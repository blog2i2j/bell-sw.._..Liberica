FROM alpine:3.21

ENV  LANG=en_US.UTF-8 \
     LANGUAGE=en_US:en

ARG LIBERICA_VERSION=8u452
ARG LIBERICA_BUILD=11
ARG LIBERICA_ROOT=/usr/lib/jvm/jdk-${LIBERICA_VERSION}-bellsoft
ARG LIBERICA_VARIANT=jdk
ARG LIBERICA_USE_LITE="1"
ARG LIBSUFFIX="-musl"
ARG LIBERICA_GENERATE_CDS=false

RUN LIBERICA_ARCH='' && LIBERICA_ARCH_TAG='' && \
  apk --no-cache upgrade libcrypto3 libssl3  && \
  case `uname -m` in                            \
        x86_64)                                 \
            LIBERICA_ARCH="x64"                 \
            ;;                                  \
        aarch64)                                \
            LIBERICA_ARCH="aarch64"             \
            ;;                                  \
        *)                                      \
            LIBERICA_ARCH=`uname -m`            \
            ;;                                  \
  esac  &&                                      \
  PACKED_ROOT="jdk${LIBERICA_VERSION}"; \
  LITE_VERSION_EXCLUDES="" && if [ "$LIBERICA_USE_LITE" = "1" ]; then \
  LITE_VERSION_EXCLUDES="--exclude ${PACKED_ROOT}/demo --exclude ${PACKED_ROOT}/sample --exclude ${PACKED_ROOT}/src.zip --exclude ${PACKED_ROOT}/man"; fi && \
  mkdir -p $LIBERICA_ROOT && \
  mkdir -p /tmp/java && \
  LIBERICA_BUILD_STR=${LIBERICA_BUILD:+"+${LIBERICA_BUILD}"} && \
  PKG=`echo "bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}${LIBERICA_BUILD_STR}-linux-${LIBERICA_ARCH}${LIBSUFFIX}${RSUFFIX}.tar.gz"` && \
  wget "https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}/${PKG}" -O /tmp/java/jdk.tar.gz && \
  SHA1=`wget -q "https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}/sha1sum.txt" -O - | grep ${PKG} | grep -v json | cut -f1 -d' '` && \
  echo "${SHA1} */tmp/java/jdk.tar.gz" | sha1sum -c - && \
  tar xzf /tmp/java/jdk.tar.gz -C /tmp/java $LITE_VERSION_EXCLUDES && \
  find "/tmp/java/${LIBERICA_VARIANT}${LIBERICA_VERSION}" -maxdepth 1 -mindepth 1 -exec mv "{}" "${LIBERICA_ROOT}/" \; && \
  ln -s "${LIBERICA_ROOT}" /usr/lib/jvm/jdk \
  &&  if [ $LIBERICA_GENERATE_CDS = true ]; then                     \
        ${LIBERICA_ROOT}/bin/java -Xshare:dump;                      \
      else                                                           \
        find ${LIBERICA_ROOT} -name "classes*.jsa" -exec rm {} \; ;  \
      fi                           \
  &&  rm -rf /tmp/java             \
  &&  rm -rf /tmp/hsperfdata_root

ENV JAVA_HOME=${LIBERICA_ROOT} \
	PATH=${LIBERICA_ROOT}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

