ARG tl_release
ARG tl_pg_version

#############################
FROM lczub/testlink_code:${tl_release} as tl_code

ARG tl_release
WORKDIR /var/testlink-code-${tl_release}/install/sql/postgres
COPY scripts/fixing_testling_pg_install.sh ./
COPY scripts/40-testlink_add_pytlapi_dev_user.sql ./
RUN \
  mv testlink_create_tables.sql 10-testlink_create_tables.sql && \
  mv testlink_create_udf0.sql 20-testlink_create_udf0.sql && \
  mv testlink_create_default_data.sql 30-testlink_create_default_data.sql && \
  ./fixing_testling_pg_install.sh

#############################
FROM postgres:${tl_pg_version} as pg_testlink_base

ARG tl_release
ARG tl_version
ENV TL_RELEASE=$tl_release
ENV TL_VERSION=$tl_version
WORKDIR /docker-entrypoint-initdb.d
COPY --from=tl_code /var/testlink-code-${tl_release}/install/sql/postgres/*.sql ./
