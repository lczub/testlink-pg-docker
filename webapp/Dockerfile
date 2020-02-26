ARG TL_RELEASE
ARG TL_PHP_VERSION

#############################
FROM lczub/testlink_code:${TL_RELEASE} as tl_code

#############################
FROM php:${TL_PHP_VERSION}-apache as tl_php_base

ARG TL_RELEASE
ARG TL_VERSION
ENV TL_RELEASE=$TL_RELEASE
ENV TL_VERSION=$TL_VERSION
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
  
COPY --from=tl_code --chown=www-data:www-data /var/testlink-code-${TL_RELEASE}  /var/www/html  
RUN \
  chmod 777 -R /var/www/html/gui/templates_c 

#############################
FROM tl_php_base as tl_php_custom

COPY --chown=www-data:www-data scripts/*.php /var/www/html
