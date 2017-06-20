###PipeplineDB with Postgis

Create image based on offical __PipelineDB__ with version 0.9.7, and install extension of __PostGis__.

### Run PipelineDB

- Build image

  ```
  docker build -t pipeline:0.9.7_postgis .
  ```

- Run container

  ```
  docker run --name pipeline -itd -p 5432:5432 -v /path/to/data/:/var/lib/pipelinedb/data/ pipeline:0.9.7_postgis 
  ```
  
[More reference](https://github.com/pipelinedb)