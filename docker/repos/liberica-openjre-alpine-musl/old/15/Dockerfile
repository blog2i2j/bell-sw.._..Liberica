FROM alpine:3.11

ENV  LANG=en_US.UTF-8 \
     LANGUAGE=en_US:en

ARG LIBERICA_ROOT=/usr/lib/jvm/jdk-15.0.2-bellsoft
ARG LIBERICA_VERSION=15.0.2
ARG LIBERICA_BUILD=10
ARG LIBERICA_VARIANT=jre
ARG LIBERICA_RELEASE_TAG=15.0.2
ARG LIBERICA_USE_LITE=0

RUN LIBERICA_ARCH=x64-musl && \
  RTAG="$LIBERICA_RELEASE_TAG" && if [ "x${RTAG}" = "x" ]; then RTAG="$LIBERICA_VERSION"; fi && \
  PACKED_ROOT="jre${LIBERICA_VERSION}" && \
  LITE_VERSION_EXCLUDES="" && if [ "$LIBERICA_USE_LITE" = "1" ]; then \
  LITE_VERSION_EXCLUDES="--exclude ${PACKED_ROOT}/man"; fi && \
  mkdir -p $LIBERICA_ROOT && \
  mkdir -p /tmp/java && \
  LIBERICA_BUILD_STR=${LIBERICA_BUILD:+"+${LIBERICA_BUILD}"} && \
  PKG=`echo "bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}${LIBERICA_BUILD_STR}-linux-${LIBERICA_ARCH}${RSUFFIX}.tar.gz"` && \
  wget "https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}/${PKG}" -O /tmp/java/jre.tar.gz && \
  SHA1=`wget -q "https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}/sha1sum.txt" -O - | grep ${PKG} | cut -f1 -d' '` && \
  echo "${SHA1} */tmp/java/jre.tar.gz" | sha1sum -c - && \
  tar xzf /tmp/java/jre.tar.gz -C /tmp/java $LITE_VERSION_EXCLUDES && \
  find "/tmp/java/${LIBERICA_VARIANT}-${LIBERICA_VERSION}" -maxdepth 1 -mindepth 1 -exec mv "{}" "${LIBERICA_ROOT}/" \; && \
  ln -s "${LIBERICA_ROOT}" /usr/lib/jvm/jre && \
  rm -rf /tmp/java

ENV JAVA_HOME=${LIBERICA_ROOT} \
	PATH=${LIBERICA_ROOT}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

