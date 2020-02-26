ARG TL_RELEASE
ARG TL_PG_VERSION

#############################
FROM lczub/testlink_code:${TL_RELEASE} as tl_code

ARG TL_RELEASE
WORKDIR /var/testlink-code-${TL_RELEASE}/install/sql/postgres
COPY scripts/fixing_testling_pg_install.sh ./
RUN \
  mv testlink_create_tables.sql 10-testlink_create_tables.sql && \
  mv testlink_create_udf0.sql 20-testlink_create_udf0.sql && \
  mv testlink_create_default_data.sql 30-testlink_create_default_data.sql && \
  ./fixing_testling_pg_install.sh

#############################
FROM postgres:${TL_PG_VERSION} as pg_testlink_base

ARG TL_RELEASE
ARG TL_VERSION
ENV TL_RELEASE=$TL_RELEASE
ENV TL_VERSION=$TL_VERSION
WORKDIR /docker-entrypoint-initdb.d
COPY --from=tl_code /var/testlink-code-${TL_RELEASE}/install/sql/postgres/*.sql ./
