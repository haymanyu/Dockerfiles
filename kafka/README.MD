### Bottledwater - Streaming data from postgresql to kafka

BottledWater is used to translate WAL(Write Ahead Log) to Avro data format, and streaming the data to kafka 
clients in time.
Click [here](https://github.com/confluentinc/bottledwater-pg) to get more about bottledwater.

#### Build images

Images should be built before running containers:

  - [BottledWater](bottledwater/)
    
  - [Postgres](postgres/)

#### Run containers

- Run kafka:

  [Confluentic Images](http://docs.confluent.io/current/cp-docker-images/docs/intro.html#choosing-the-right-images) is been used.

  ```
  docker-compose up -d zookeeper kafka schema-registry
  ```
  
  And if __rest_proxy__ is needed, run:
  
  ```
  docker-compose up -d rest
  ```  

- Run bottledwater:

  ```
  docker-compose up -d postgres bottledwater
  ```


