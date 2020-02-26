#############################
FROM alpine 

ARG TL_RELEASE
ARG TL_VERSION

ARG TL_DOWNLOAD_BASE=https://github.com/TestLinkOpenSourceTRMS/testlink-code/archive
ARG TL_DOWNLOAD_FILE=$TL_VERSION.zip

ENV TL_RELEASE=$TL_RELEASE
ENV TL_VERSION=$TL_VERSION

WORKDIR /tmp
RUN \
   echo download testlink archive ${TL_DOWNLOAD_BASE}/${TL_DOWNLOAD_FILE} && \
   wget -qO - ${TL_DOWNLOAD_BASE}/${TL_DOWNLOAD_FILE} | unzip -q - && \
   mv testlink-* /var/testlink-code-${TL_RELEASE}
  
CMD ls -ltr /var /var/testlink*