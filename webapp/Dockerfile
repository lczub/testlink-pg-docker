ARG tl_release
ARG tl_php_version

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
FROM docker.io/php:${tl_php_version}-apache as tl_php_custom

ARG tl_release
ARG tl_version
ENV TL_RELEASE=$tl_release
ENV TL_VERSION=$tl_version
ENV TL_DB_USER=$tl_db_user
ENV TL_DB_PASS=$tl_db_password
ENV TL_DB_HOST=$tl_db_host
ENV TL_DB_NAME=$tl_db_name
RUN apt-get update && \
    apt-get install -y libpq-dev && \
	docker-php-ext-install pgsql
  
RUN \
  mkdir -p /var/testlink/logs && \
  chmod 777 -R /var/testlink/logs && \
  mkdir -p /var/testlink/upload_area && \
  chmod 777 -R /var/testlink/upload_area
  
COPY --from=tl_code_base --chown=www-data:www-data /var/testlink-code-${tl_release}  /var/www/html  
COPY --chown=www-data:www-data scripts/*.php /var/www/html
RUN \
  chmod 777 -R /var/www/html/gui/templates_c 