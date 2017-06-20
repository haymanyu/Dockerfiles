Bottledwater
------------

The image is built based on postgres with version 9.6.1, and get then extension source on [Confluentinc-BottledWater](https://github.com/confluentinc/bottledwater-pg#running-in-docker).

Click [here](../extension/) to get the details of generating extension files.

- Settings

  __bottledwater-docker-wrapper.sh__ contains the kafka and database connection settings.
  
  Default connection settings:
  
  - Database connection information
  
     Parameter|Value
     ----|-----
     dbname|postgres 
     port|5432 
     host|localhost 
     user|bottledwater
  
  - kafka connection information
  
  	 container|host|port
  	 ---------|----|----
    kafka-broker|localhost|9092 
    schema-registry|localhost|8081

- Build image

  ```
  docker build -t bottledwater:9.6.1 .
  ```
  
- Run containers

  ```
  docker-compose up -d bottledwater
  ```
