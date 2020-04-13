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
docker-compose --env-file ./envs/testlink-1.9.20.fixed.env -f docker-compose.yml -f docker-compose.build.yml build
docker-compose --env-file ./envs/testlink-1.9.20.fixed.env -f docker-compose.yml up -d
```

Known issue: TestLink login failed with internal server error (not yet analysed)
```
 ERROR:  column d.adsrc does not exist at character 24,
 STATEMENT:  SELECT d.adnum as num, d.adsrc as def from pg_attrdef d, pg_class c where d.adrelid=c.oid and c.relname='users' order by d.adnum
```

## Build and Run TestLink 1.9.20
Source: [TestLink Release Tag _1.9.20_](https://github.com/TestLinkOpenSourceTRMS/testlink-code/releases/tag/1.9.20)
```
docker-compose --env-file ./envs/testlink-1.9.20.env -f docker-compose.yml -f docker-compose.build.yml build
docker-compose --env-file ./envs/testlink-1.9.20.env -f docker-compose.yml up -d
```

Known issue: starting container *testlink_pg* aborts with known TL 1.9.20 PG installation issue [TL Mantis 8874](http://mantis.testlink.org/view.php?id=8874) 

## Build and Run TestLink 1.9.19
Source: [TestLink Release Tag _1.9.19_](https://github.com/TestLinkOpenSourceTRMS/testlink-code/releases/tag/1.9.19)
```
docker-compose --env-file ./envs/testlink-1.9.19.env -f docker-compose.yml -f docker-compose.build.yml build
docker-compose --env-file ./envs/testlink-1.9.19.env -f docker-compose.yml up -d 
```
Docker build will install fix for known TL 1.9.19 PG installation issue [TL Mantis 8693](http://mantis.testlink.org/view.php?id=8693)
## Start additional pgadmin container to analyse the current db situation
pgadmin will be reachable on [localhost port 8086](http://localhost:8086) with credential _user@domain.com_ + _SuperSecret_

TL PG Server connection parameter are: host *tl_pg* user *tlink* password *tlink*
```
docker-compose --env-file ./envs/testlink-1.9.20.fixed.env -f docker-compose.yml  -f ./docker-compose.pgadmin.yml up -d pgadmin
docker-compose --env-file ./envs/testlink-1.9.20.env -f docker-compose.yml  -f ./docker-compose.pgadmin.yml up -d pgadmin
docker-compose --env-file ./envs/testlink-1.9.19.env -f docker-compose.yml  -f ./docker-compose.pgadmin.yml up -d pgadmin

```