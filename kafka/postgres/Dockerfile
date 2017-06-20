# Builds a docker image that runs a Postgres server with the Bottled Water
# plugin installed. Requires that the binaries have been built first (see
# Dockerfile.build) and placed in the same directory as this Dockerfile.
#
# Usage:
#
#   (assuming the binaries have been placed into the build/ directory alongside
#   this Dockerfile)
#   docker build -f build/Dockerfile.postgres -t confluent/postgres-bw:0.1 build
#   docker run -d --name postgres confluent/postgres-bw:0.1
#
# To connect to the running container with psql:
#
#   docker run -it --rm --link postgres postgres:9.5 \
#     psql -h postgres -U postgres
#
# In the psql session, type the following to enable the plugin:
#
#   create extension bottledwater;

FROM postgres:9.6.1
MAINTAINER 	HaymanYu<hyman@localgravity.com>
ENV POSTGIS_MAJOR 2.3
ENV POSTGIS_VERSION 2.3.2+dfsg-1~exp1.pgdg80+1
ENV TZ=Asia/Chongqing
RUN apt-get update \
      && apt-get install -y --no-install-recommends \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts=$POSTGIS_VERSION \
           postgis=$POSTGIS_VERSION \
           libjansson4 libc6-dev ca-certificates\
           wget unzip make gcc postgresql-server-dev-9.6 \
      && rm -rf /var/lib/apt/lists/*
RUN wget http://api.pgxn.org/dist/kmeans/1.1.0/kmeans-1.1.0.zip \
      && unzip kmeans-1.1.0.zip \
      && rm kmeans-1.1.0.zip \
      && cd kmeans-1.1.0 \
      && export USE_PGXS=1 \
      && make \
      && make install
RUN mkdir -p /docker-entrypoint-initdb.d
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
##
ADD bottledwater-ext.tar.gz /
ADD avro.tar.gz /
RUN cp /usr/local/lib/libavro.so.* /usr/lib/x86_64-linux-gnu/
COPY replication-config.sh /docker-entrypoint-initdb.d/replication-config.sh
COPY initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh
