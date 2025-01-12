# TestLink PostgreSQL podman Compose Configuration

podman compose configuration with scope to set up TestLink environment with PostGreSQL for testing projects like TL-API.
- container are build from official PHP and PostGreSQL images
- automated TestLink database setup without manual interactions
- supports builds with different TL, PHP and PG version combinations
- provides VSCodium config with podman compose task definitions 

DO NOT USE THIS CONFIG IN PRODUCTION - DEFAULT USER CREDENTIALS ARE USED

TestLink will be reachable on [localhost port 8085](http://localhost:8085)
- test login: _pyTLapi_ + _pyTLapi_

[MailPit](https://hub.docker.com/r/axllent/mailpit) checking SMTP on [localhost port 8025](http://localhost:8025/)

PGadmin checking DB tables [localhost port 8086](http://localhost:8086) 
- default login: _user@domain.com_ + _SuperSecret_
- TL PG Server connection parameter are: host *tl_pg* user *tlink* password *tlink*

## Build and Run TestLink 1.9.20.fixed
Source: [TestLink Branch _testlink_1_9_20_fixed_](https://github.com/TestLinkOpenSourceTRMS/testlink-code/tree/testlink_1_9_20_fixed)
```
podman compose --env-file ./envs/testlink-1.9.20.fixed.env -f docker-compose.yml up -d
```

podman build will fix known TL 1.9.20.fixed PG installation issues see [fixing_testling_pg_install.sh](./db/scripts/fixing_testling_pg_install.sh)

## Build and Run TestLink 2.0.0.dev
Source: [TestLink Release Branch _2.0.0-2.0.0-20201221-01_](https://github.com/TestLinkOpenSourceTRMS/testlink-code/tree/2.0.0-20201221-01)
```
podman compose --env-file ./envs/testlink-2.0.0.dev.env -f docker-compose.yml up -d
```

## Build and Run TestLink 1.9.19
Source: [TestLink Release Tag _1.9.19_](https://github.com/TestLinkOpenSourceTRMS/testlink-code/releases/tag/1.9.19)
```
podman compose --env-file ./envs/testlink-1.9.19.env -f docker-compose.yml up -d 
```

podman build will install fix for known TL 1.9.19 PG installation issue [TL Mantis 8693](http://mantis.testlink.org/view.php?id=8693), see [fixing_testling_pg_install.sh](./db/scripts/fixing_testling_pg_install.sh)

## Stop and remove containers, networks ...

```
podman compose --env-file ./envs/testlink-1.9.20.fixed.env -f docker-compose.yml down -v
podman compose --env-file ./envs/testlink-2.0.0.dev.env -f docker-compose.yml down -v
podman compose --env-file ./envs/testlink-1.9.19.env -f docker-compose.yml down -v
```

