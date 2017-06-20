### Postgres with bottledwater extion

- Bottledwater extionsion

  Used to pass WAL(write ahead log) to bottledwater.
  
  Click [here](../extension/README.MD) to get the details of generating extension files.

- Application && extensions version details below:

  Applications | Version
  ------------ |:--------: 
  Postgres     | 9.6.1
  Postgis      | 2.3.2
  K-means      | 1.1.0
  Bottledwater | 

###How to use

- Build Images

  ```
  docker build -t postgres:9.6.1_bw .
  ```
  
- Run Container

  ```
  docker-compose up -d postgres
  ```

####Note

  Before using bottledwater, extension should be created on the database you want to steaming to kafka.

- Create extension:

  ```
  create extension bottledwater
  ```
