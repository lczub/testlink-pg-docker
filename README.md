# TestLink PostgreSQL Docker Compose Configuration

This docker-compose configuration has the scope to setup a TestLink environment with PostGreSQL, which can be used by projects like TL-API for their tests.
- container build only from official PHP and PostGreSQL images
- automated TestLink database setup without manual interactions
- supports builds with different TL, PHP and PG version combinations
- optional pgadmin container can be started to analyse the current DB situation 


## Build and Run TestLink 1.9.20.fied
```
docker-compose --env-file .\envs\testlink-1.9.20.fixed.env -f docker-compose.yml -f docker-compose.build.yml build
docker-compose --env-file .\envs\testlink-1.9.20.fixed.env -f docker-compose.yml up -d
```
Known issue: starting container *testlink_pg* aborts with known TL 1.9.20 PG installation issue [TL Mantis 8874](http://mantis.testlink.org/view.php?id=8874) 
## Build and Run TestLink 1.9.20
```
docker-compose --env-file .\envs\testlink-1.9.20.env -f docker-compose.yml -f docker-compose.build.yml build
docker-compose --env-file .\envs\testlink-1.9.20.env -f docker-compose.yml up -d
```

Known issue: starting container *testlink_pg* aborts with known TL 1.9.20 PG installation issue [TL Mantis 8874](http://mantis.testlink.org/view.php?id=8874) 
## Build and Run TestLink 1.9.19
```
docker-compose --env-file .\envs\testlink-1.9.19.env -f docker-compose.yml -f docker-compose.build.yml build
docker-compose --env-file .\envs\testlink-1.9.19.env -f docker-compose.yml up -d 
```
Includes fix for known TL 1.9.19 PG installation issue [TL Mantis 8693](http://mantis.testlink.org/view.php?id=8693)
## Start aditional pgadmin container to analyse the current db situation
```
docker-compose --env-file .\envs\testlink-1.9.20.fixed.env -f docker-compose.yml  -f .\docker-compose.pgadmin.yml up -d pgadmin
docker-compose --env-file .\envs\testlink-1.9.20.env -f docker-compose.yml  -f .\docker-compose.pgadmin.yml up -d pgadmin
docker-compose --env-file .\envs\testlink-1.9.19.env -f docker-compose.yml  -f .\docker-compose.pgadmin.yml up -d pgadmin

```