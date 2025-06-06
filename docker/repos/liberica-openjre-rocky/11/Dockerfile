FROM rockylinux/rockylinux:9-minimal

ENV  LANG=en_US.UTF-8 \
     LANGUAGE=en_US:en
#	 LC_ALL=en_US.UTF-8

ARG LIBERICA_VERSION=11.0.27
ARG LIBERICA_BUILD=9
ARG LIBERICA_ROOT=/usr/lib/jvm/jre-${LIBERICA_VERSION}-bellsoft
ARG LIBERICA_VARIANT=jre

ARG LIBERICA_USE_LITE=1
ARG LIBERICA_GENERATE_CDS=false

RUN LIBERICA_ARCH=''                             \
  &&    LIBERICA_ARCH_TAG='' &&                  \
  case `uname -m` in                       \
        x86_64)                            \
            LIBERICA_ARCH="amd64"          \
            ;;                             \
        i686)                              \
            LIBERICA_ARCH="i586"           \
            ;;                             \
        aarch64)                           \
            LIBERICA_ARCH="aarch64"        \
            ;;                             \
        armv[67]l)                         \
            LIBERICA_ARCH="arm32-vfp-hflt" \
            ;;                             \
        *)                                 \
            LIBERICA_ARCH=`uname -m`       \
            ;;                             \
  esac  &&                                 \
  microdnf install -y fontconfig tar gzip  \
                      findutils &&         \
  mkdir -p $LIBERICA_ROOT &&               \
  mkdir -p /tmp/java                       \
  &&    RSUFFIX=""                               \
  &&    if [ "$LIBERICA_USE_LITE" = "1" ]; then  \
            RSUFFIX="-lite";                     \
            LITE_URL="/docker" ;                 \
        else                                     \
            RSUFFIX="";                          \
            LITE_URL="";                         \
        fi &&                                    \
  LIBERICA_BUILD_STR=${LIBERICA_BUILD:+"+${LIBERICA_BUILD}"} && \
  PKG=`echo "bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}${LIBERICA_BUILD_STR}-linux-${LIBERICA_ARCH}${RSUFFIX}.tar.gz"` && \
  PKG_URL="https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}${LITE_URL}/${PKG}" && \
  echo "Download ${PKG_URL}" && \
  curl -SL "${PKG_URL}" -o /tmp/java/jre.tar.gz \
  &&    SHA_URL="https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}/sha1sum.txt" \
  &&    if [ "$LIBERICA_USE_LITE" = "1" ]; then                                                    \
          SHA_URL="https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}/docker/sha1sum.txt";         \
        fi \
  &&    echo ${SHA_URL} \
  &&    SHA1=$(curl -fSL ${SHA_URL} | grep ${PKG} | grep -v json | cut -f1 -d' ')    \
  && echo "${SHA1} */tmp/java/jre.tar.gz" | sha1sum -c - && \
  tar xzf /tmp/java/jre.tar.gz -C /tmp/java && \
  find "/tmp/java/${LIBERICA_VARIANT}-${LIBERICA_VERSION}" -maxdepth 1 -mindepth 1 -exec mv "{}" "${LIBERICA_ROOT}/" \; && \
  ln -s "${LIBERICA_ROOT}" /usr/lib/jvm/jre && \
  microdnf clean all && \
  rm -rf /var/lib/rpm/__db* && \
  (ls /usr/lib/jvm/jre/lib/client 1>/dev/null 2>&1 && (rm -rf /usr/lib/jvm/jre/lib/client && sed -i 's#-client\s\+KNOWN#-client IGNORE#g' /usr/lib/jvm/jre/lib/jvm.cfg) || : ) \
  &&    if [ $LIBERICA_GENERATE_CDS = true ]; then                  \
        ${LIBERICA_ROOT}/bin/java -Xshare:dump;                     \
    else                                                            \
        find ${LIBERICA_ROOT} -name "classes*.jsa" -exec rm {} \; ; \
    fi                                                              \
  &&    rm -rf /tmp/java                                            \
  &&    rm -rf /tmp/hsperfdata_root

ENV JAVA_HOME=${LIBERICA_ROOT} \
	PATH=${LIBERICA_ROOT}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

