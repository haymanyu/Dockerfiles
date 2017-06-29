Get extension files:
---------

  - Build iamge:

      Get into source/ folder and build image:

      ```
      cd source 
      docker build -t bwbuild:9.6 -f Dockerfile.build .
      ```

  - Get bottledwater && avro extension.

      ```
    docker run --rm bwbuild:9.6 cat /avro.tar.gz > ./avro.tar.gz
    docker run --rm bwbuild:9.6 cat /bottledwater-ext.tar.gz > ./bottledwater-ext.tar.gz
    docker run --rm bwbuild:9.6 cat /bottledwater-bin.tar.gz > ./bottledwater-bin.tar.gz
    docker run --rm bwbuild:9.6 cat /librdkafka.tar.gz > ./librdkafka.tar.gz
      ```

[More Reference](https://github.com/confluentinc/bottledwater-pg#running-in-docker)


