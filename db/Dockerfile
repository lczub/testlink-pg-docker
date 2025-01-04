ARG tl_release
ARG tl_pg_version

#############################
FROM alpine as tl_code_base

ARG tl_release
ARG tl_version

ARG tl_download_base=https://github.com/TestLinkOpenSourceTRMS/testlink-code/archive
ARG tl_download_file=$tl_version.zip

ENV TL_RELEASE=$tl_release
ENV TL_VERSION=$tl_version

RUN \
  echo download testlink archive ${tl_download_base}/${tl_download_file} && \
  wget -qO - ${tl_download_base}/${tl_download_file} | unzip -q - && \
  mv testlink-* /var/testlink-code-${tl_release}

#############################
FROM tl_code_base as tl_code_pg

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
FROM docker.io/postgres:${tl_pg_version} as pg_testlink_base

ARG tl_release
ARG tl_version
ENV TL_RELEASE=$tl_release
ENV TL_VERSION=$tl_version
WORKDIR /docker-entrypoint-initdb.d
COPY --from=tl_code_pg /var/testlink-code-${tl_release}/install/sql/postgres/*.sql ./
