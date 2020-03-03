ARG tl_release
ARG tl_php_version

#############################
FROM lczub/testlink_code:${tl_release} as tl_code

#############################
FROM php:${tl_php_version}-apache as tl_php_base

ARG tl_release
ARG tl_version
ENV TL_RELEASE=$tl_release
ENV TL_VERSION=$tl_version
RUN apt-get update && \
    apt-get install -y libpq-dev && \
	docker-php-ext-install pgsql
  
RUN \
  mkdir -p /var/testlink/logs && \
  chmod 777 -R /var/testlink/logs && \
  mkdir -p /var/testlink/upload_area && \
  chmod 777 -R /var/testlink/upload_area  && \
  mkdir -p /var/testlink/scripts

COPY scripts/*.sh /var/testlink/scripts
WORKDIR /var/testlink/scripts
CMD ./create_php_db_config_file.sh && apache2-foreground
  
COPY --from=tl_code --chown=www-data:www-data /var/testlink-code-${tl_release}  /var/www/html  
RUN \
  chmod 777 -R /var/www/html/gui/templates_c 

#############################
FROM tl_php_base as tl_php_custom

COPY --chown=www-data:www-data scripts/*.php /var/www/html
