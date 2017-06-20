###PgAgent 

Pure pgagent image with postgres version 9.5.4

- build image

  ```
  docker build -t pgagent .
  ```

- run container

  ```
  docker run -itd --name pgagent -p 5433:5432 pgagent 
  ```

- Manage pgagent

  Using PgAmdinIII to manage jobs.
  
  [More reference](https://www.pgadmin.org/docs/pgadmin3/1.22/pgagent.html)
  
  