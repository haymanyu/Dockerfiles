FROM postgres:9.5.4
MAINTAINER 	HymanYu<hyman@localgravity.com>
ENV TZ=Asia/Chongqing
RUN apt-get update \
      && apt-get install -y --no-install-recommends \
          postgresql-server-dev-9.5 pgagent \
      && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /docker-entrypoint-initdb.d
RUN useradd -s /bin/bash -m pgagent
RUN su pgagent -c "echo '*:*:*:postgres:pg!001_lg' > ~/.pgpass "
RUN su pgagent -c "chmod 600 ~/.pgpass"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY pgagent /etc/init.d/pgagent
COPY initdb_pgagent.sh /docker-entrypoint-initdb.d/initdb_pgagent.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh
