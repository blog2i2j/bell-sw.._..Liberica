FROM debian:11

RUN     apt-get update                              \
  &&    apt-get install -y curl fontconfig locales  \
  &&    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
  &&    locale-gen                                  \
  &&    apt-get clean                               \
  &&    apt-get -y autoclean                        \
  &&    apt-get -y autoremove                       \
  &&    rm -rf /var/lib/apt/lists/*

ENV  LANG=en_US.UTF-8 \
     LANGUAGE=en_US:en

ARG LIBERICA_VERSION=19.0.2
ARG LIBERICA_BUILD=9
ARG LIBERICA_VARIANT=jre
ARG LIBERICA_ROOT=/usr/lib/jvm/${LIBERICA_VARIANT}-${LIBERICA_VERSION}-bellsoft

ARG LIBERICA_USE_LITE=0

RUN LIBERICA_ARCH='' \
  &&    LIBERICA_ARCH_TAG='' && \
        case `uname -m` in \
              x86_64) \
                  LIBERICA_ARCH="amd64" \
                  ;; \
              i686) \
                  LIBERICA_ARCH="i586" \
                  ;; \
              aarch64) \
                  LIBERICA_ARCH="aarch64" \
                  ;; \
              armv[67]l) \
                  LIBERICA_ARCH="arm32-vfp-hflt" \
                  ;; \
              *) \
                  LIBERICA_ARCH=`uname -m` \
                  ;; \
        esac \
  &&    mkdir -p $LIBERICA_ROOT \
  &&    mkdir -p /tmp/java \
  &&    RSUFFIX="" \
  &&    if [ "$LIBERICA_USE_LITE" = "1" ]; then RSUFFIX="-lite"; fi \
  &&    LIBERICA_BUILD_STR=${LIBERICA_BUILD:+"+${LIBERICA_BUILD}"} \
  &&    PKG=`echo "bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}${LIBERICA_BUILD_STR}-linux-${LIBERICA_ARCH}${RSUFFIX}.tar.gz"` \
  &&    PKG_URL="https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}/${PKG}" \
  &&    curl -SL "${PKG_URL}" -o /tmp/java/jre.tar.gz \
  &&    SHA1=$(curl -fSL "https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}/sha1sum.txt" | grep ${PKG} | cut -f1 -d' ') \
  &&    echo "${SHA1} */tmp/java/jre.tar.gz" | sha1sum -c - \
  &&    tar xzf /tmp/java/jre.tar.gz -C /tmp/java \
  &&    find "/tmp/java/${LIBERICA_VARIANT}-${LIBERICA_VERSION}${RSUFFIX}" -maxdepth 1 -mindepth 1 -exec mv "{}" "${LIBERICA_ROOT}/" \; \
  &&    ln -s $LIBERICA_ROOT /usr/lib/jvm/jre \
  &&    rm -rf /tmp/java \
  &&    (ls /usr/lib/jvm/jre/lib/client 1>/dev/null 2>&1 && (rm -rf /usr/lib/jvm/jre/lib/client && sed -i 's#-client\s\+KNOWN#-client IGNORE#g' /usr/lib/jvm/jre/lib/jvm.cfg) || : )

ENV JAVA_HOME=${LIBERICA_ROOT} \
	PATH=${LIBERICA_ROOT}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

