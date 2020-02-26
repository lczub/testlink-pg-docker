# TestLink PostgreSQL Docker Compose Configuration

This docker-compose configuration has the scope to setup a TestLink environment with PostGreSQL, which can be used by projects like TL-API for their tests.
- container build only from official PHP and PostGreSQL images
- automated TestLink database setup without manual interactions
- supports builds with different TL, PHP and PG version combinations
- optional pgadmin container can be started to analyse the current DB situation 


## Build and Run TestLink 1.9.19
```
docker-compose --env-file .\envs\testlink-1.9.19.env -f docker-compose.yml -f docker-compose.build.yml build
docker-compose --env-file .\envs\testlink-1.9.19.env -f docker-compose.yml up -d 
```
## Build and Run TestLink 1.9.20
```
docker-compose --env-file .\envs\testlink-1.9.20.env -f docker-compose.yml -f docker-compose.build.yml build
docker-compose --env-file .\envs\testlink-1.9.20.env -f docker-compose.yml up -d
```
## Start aditional pgadmin container to analyse the current db situation
```
docker-compose --env-file .\envs\testlink-1.9.19.env -f docker-compose.yml  -f .\docker-compose.pgadmin.yml up -d pgadmin
docker-compose --env-file .\envs\testlink-1.9.20.env -f docker-compose.yml  -f .\docker-compose.pgadmin.yml up -d pgadmin
```