FROM alpine:3.18

ENV  LANG=en_US.UTF-8 \
     LANGUAGE=en_US:en

ARG LIBERICA_VERSION=20.0.1
ARG LIBERICA_BUILD=10
ARG LIBERICA_VARIANT=jre
ARG LIBERICA_ROOT=/usr/lib/jvm/${LIBERICA_VARIANT}-${LIBERICA_VERSION}-bellsoft
ARG LIBERICA_RELEASE_TAG=
ARG LIBERICA_USE_LITE=0
ARG LIBSUFFIX="-musl"

RUN LIBERICA_ARCH='' && LIBERICA_ARCH_TAG='' &&    \
  apk --no-cache upgrade libcrypto1.1 libssl1.1 && \
  set -x &&                                        \
  case `uname -m` in                               \
        x86_64)                                    \
            LIBERICA_ARCH="x64"                    \
            ;;                                     \
        aarch64)                                   \
            LIBERICA_ARCH="aarch64"                \
            ;;                                     \
        *)                                         \
            LIBERICA_ARCH=`uname -m`               \
            ;;                                     \
  esac                                             \
  &&    RTAG="$LIBERICA_RELEASE_TAG" \
  &&    if [ "x${RTAG}" = "x" ]; then RTAG="$LIBERICA_VERSION"; fi \
  &&    PACKED_ROOT="jre${LIBERICA_VERSION}" \
  &&    LITE_VERSION_EXCLUDES="" \
  &&    if [ "$LIBERICA_USE_LITE" = "1" ]; then \
          LITE_VERSION_EXCLUDES="--exclude ${PACKED_ROOT}/man"; fi \
  &&    mkdir -p $LIBERICA_ROOT \
  &&    mkdir -p /tmp/java \
  &&    LIBERICA_BUILD_STR=${LIBERICA_BUILD:+"+${LIBERICA_BUILD}"} \
  &&    PKG=`echo "bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}${LIBERICA_BUILD_STR}-linux-${LIBERICA_ARCH}${LIBSUFFIX}${RSUFFIX}.tar.gz"` \
  &&    PKG_URL="https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}/${PKG}" \
  &&    echo "Download ${PKG_URL}" \
  &&    wget "${PKG_URL}" -O /tmp/java/jre.tar.gz \
  &&    SHA1=$(wget -q "https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}/sha1sum.txt" -O - | grep ${PKG} | cut -f1 -d' ') \
  &&    echo "${SHA1} */tmp/java/jre.tar.gz" | sha1sum -c - \
  &&    tar xzf /tmp/java/jre.tar.gz -C /tmp/java $LITE_VERSION_EXCLUDES \
  &&    find "/tmp/java/${LIBERICA_VARIANT}-${LIBERICA_VERSION}" -maxdepth 1 -mindepth 1 -exec mv "{}" "${LIBERICA_ROOT}/" \; \
  &&    ln -s "${LIBERICA_ROOT}" /usr/lib/jvm/jre \
  &&    rm -rf /tmp/java \
  &&    (ls /usr/lib/jvm/jre/lib/client 1>/dev/null 2>&1 && (rm -rf /usr/lib/jvm/jre/lib/client && sed -i 's#-client\s\+KNOWN#-client IGNORE#g' /usr/lib/jvm/jre/lib/jvm.cfg) || : )

ENV JAVA_HOME=${LIBERICA_ROOT} \
	PATH=${LIBERICA_ROOT}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

