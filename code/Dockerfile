#############################
FROM alpine 

ARG tl_release
ARG tl_version

ARG tl_download_base=https://github.com/TestLinkOpenSourceTRMS/testlink-code/archive
ARG tl_download_file=$tl_version.zip

ENV TL_RELEASE=$tl_release
ENV TL_VERSION=$tl_version

WORKDIR /tmp
RUN \
   echo download testlink archive ${tl_download_base}/${tl_download_file} && \
   wget -qO - ${tl_download_base}/${tl_download_file} | unzip -q - && \
   mv testlink-* /var/testlink-code-${tl_release}
  
CMD ls -ltr /var /var/testlink*