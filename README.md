# TestLink PostgreSQL Docker Compose Configuration

This docker-compose configuration has the scope to setup a TestLink environment with PostGreSQL, which can be used by projects like TL-API for their tests.
- container build only from official PHP and PostGreSQL images
- automated TestLink database setup without manual interactions
- supports builds with different TL, PHP and PG version combinations
- optional pgadmin container can be started to analyse the current DB situation 

TestLink will be reachable on [localhost port 8085](http://localhost:8085)

## Build and Run TestLink 1.9.20.fixed
Source: [TestLink Branch _testlink_1_9_20_fixed_](https://github.com/TestLinkOpenSourceTRMS/testlink-code/tree/testlink_1_9_20_fixed)
```
docker compose --env-file ./envs/testlink-1.9.20.fixed.env -f docker-compose.yml -f docker-compose.build.yml build tl_code
docker compose --env-file ./envs/testlink-1.9.20.fixed.env -f docker-compose.yml -f docker-compose.build.yml build tl_pg tl_apache
docker compose --env-file ./envs/testlink-1.9.20.fixed.env -f docker-compose.yml up -d
```

## Build and Run TestLink 2.0.0.dev
Source: [TestLink Release Branch _2.0.0-2.0.0-20201221-01_](https://github.com/TestLinkOpenSourceTRMS/testlink-code/tree/2.0.0-20201221-01)
```
docker compose --env-file ./envs/testlink-2.0.0.dev.env -f docker-compose.yml -f docker-compose.build.yml build tl_code
docker compose --env-file ./envs/testlink-2.0.0.dev.env -f docker-compose.yml -f docker-compose.build.yml build tl_pg tl_apache
docker compose --env-file ./envs/testlink-2.0.0.dev.env -f docker-compose.yml up -d
```

## Build and Run TestLink 1.9.19
Source: [TestLink Release Tag _1.9.19_](https://github.com/TestLinkOpenSourceTRMS/testlink-code/releases/tag/1.9.19)
```
docker compose --env-file ./envs/testlink-1.9.19.env -f docker-compose.yml -f docker-compose.build.yml build tl_code
docker compose --env-file ./envs/testlink-1.9.19.env -f docker-compose.yml -f docker-compose.build.yml build tl_pg tl_apache
docker compose --env-file ./envs/testlink-1.9.19.env -f docker-compose.yml up -d 
```

Docker build will install fix for known TL 1.9.19 PG installation issue [TL Mantis 8693](http://mantis.testlink.org/view.php?id=8693)

## Start additional pgadmin container to analyse the current db situation
pgadmin will be reachable on [localhost port 8086](http://localhost:8086) with credential _user@domain.com_ + _SuperSecret_

TL PG Server connection parameter are: host *tl_pg* user *tlink* password *tlink*
```
docker compose --env-file ./envs/testlink-1.9.20.fixed.env -f docker-compose.yml  -f ./docker-compose.pgadmin.yml up -d pgadmin
docker compose --env-file ./envs/testlink-2.0.0.dev.env -f docker-compose.yml  -f ./docker-compose.pgadmin.yml up -d pgadmin
docker compose --env-file ./envs/testlink-1.9.19.env -f docker-compose.yml  -f ./docker-compose.pgadmin.yml up -d pgadmin

```

## Stop and remove containers, networks ...

```
docker compose --env-file ./envs/testlink-1.9.20.fixed.env -f docker-compose.yml down --rmi local -v
docker compose --env-file ./envs/testlink-2.0.0.dev.env -f docker-compose.yml down --rmi local -v
docker compose --env-file ./envs/testlink-1.9.19.env -f docker-compose.yml down --rmi local -v
```

## copy source from testlink_code for debugging build isssues
```
docker run --name tl_code -it --rm -d lczub/testlink_code:2.0.0.dev /bin/sh
docker cp tl_code:/var/testlink-code-2.0.0.dev d:\tmp
docker rm -f tl_code
```
