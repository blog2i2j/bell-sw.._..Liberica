FROM debian:12-slim as glibc-base

ARG GLIBC_VERSION=2.36
ARG GLIBC_PREFIX=/usr/glibc
ARG LANG=en_US.UTF-8

RUN apt-get update && apt-get install -y \
  curl build-essential gawk bison python3 texinfo gettext \
  && \
  cd /root && \
  curl -SL http://ftp.gnu.org/gnu/glibc/glibc-${GLIBC_VERSION}.tar.gz | tar xzf - && \
  mkdir -p /root/build && cd /root/build && \
  ../glibc-${GLIBC_VERSION}/configure \
    --prefix=${GLIBC_PREFIX} \
    --libdir="${GLIBC_PREFIX}/lib" \
    --libexecdir="${GLIBC_PREFIX}/lib" \
    --enable-multi-arch \
    --enable-stack-protector=strong \
  && \
  make -j`nproc` && make DESTDIR=/root/dest install && \
  RTLD=`find /root/dest${GLIBC_PREFIX}/lib -name 'ld-linux-*.so.*'` && [ -x "$RTLD" ] && \
  LOCALEDEF="$RTLD --library-path /root/dest${GLIBC_PREFIX}/lib /root/dest${GLIBC_PREFIX}/bin/localedef --alias-file=/root/glibc-${GLIBC_VERSION}/intl/locale.alias" && \
  export I18NPATH=/root/glibc-${GLIBC_VERSION}/localedata && \
  export GCONVPATH=/root/glibc-${GLIBC_VERSION}/iconvdata && \
  LOCALE=$(echo ${LANG} | cut -d. -f1) && CHARMAP=$(echo ${LANG} | cut -d. -f2) && \
  mkdir -pv /root/dest${GLIBC_PREFIX}/lib/locale && \
  cd /root/glibc-${GLIBC_VERSION}/localedata && \
  ${LOCALEDEF} -i locales/$LOCALE -f charmaps/$CHARMAP --prefix=/root/dest $LANG && \
  cd /root && rm -rf build glibc-${GLIBC_VERSION} && \
  cd /root/dest${GLIBC_PREFIX} && \
  ( strip bin/* sbin/* lib/* || true ) && \
  echo "/usr/local/lib" > /root/dest${GLIBC_PREFIX}/etc/ld.so.conf && \
  echo "${GLIBC_PREFIX}/lib" >> /root/dest${GLIBC_PREFIX}/etc/ld.so.conf && \
  echo "/usr/lib" >> /root/dest${GLIBC_PREFIX}/etc/ld.so.conf && \
  echo "/lib" >> /root/dest${GLIBC_PREFIX}/etc/ld.so.conf

RUN cd /root/dest${GLIBC_PREFIX} && \
  rm -rf etc/rpc var include share bin "sbin/[^l]*"  \
	lib/*.o lib/*.a lib/audit lib/gconv lib/getconf

FROM alpine:3.21 as liberica

ARG GLIBC_PREFIX=/usr/glibc
ARG EXT_GCC_LIBS_URL=https://archive.archlinux.org/packages/g/gcc-libs/gcc-libs-8.3.0-1-x86_64.pkg.tar.xz
ARG EXT_ZLIB_URL=https://archive.archlinux.org/packages/z/zlib/zlib-1%3A1.2.11-4-x86_64.pkg.tar.xz
ARG LANG=en_US.UTF-8
ARG OPT_PKGS=

ENV  LANG=${LANG} \
     LANGUAGE=${LANG}:en
#	 LC_ALL=en_US.UTF-8

ARG LIBERICA_VERSION=17.0.15
ARG LIBERICA_BUILD=10
ARG LIBERICA_VARIANT=jre
ARG LIBERICA_ROOT=/usr/lib/jvm/${LIBERICA_VARIANT}-${LIBERICA_VERSION}-bellsoft

ARG LIBERICA_USE_LITE=1
ARG LIBERICA_GENERATE_CDS=false

COPY --from=glibc-base /root/dest/ /

RUN LIBERICA_ARCH='' &&  LIBERICA_ARCH_TAG='' &&   \
  apk --no-cache upgrade libcrypto3 libssl3   &&   \
        case `uname -m` in                         \
              x86_64)                              \
                  LIBERICA_ARCH="amd64"            \
                  ;;                               \
              i686)                                \
                  LIBERICA_ARCH="i586"             \
                  ;;                               \
              aarch64)                             \
                  LIBERICA_ARCH="aarch64"          \
                  ;;                               \
              armv[67]l)                           \
                  LIBERICA_ARCH="arm32-vfp-hflt";  \
                  ;;                               \
              *)                                   \
            LIBERICA_ARCH=`uname -m`               \
            ;;                                     \
        esac                                       \
  &&    ln -s ${GLIBC_PREFIX}/lib/ld-*.so* /lib \
  &&    ln -s ${GLIBC_PREFIX}/etc/ld.so.cache /etc \
  &&    if [ "$LIBERICA_ARCH" = "amd64" ]; then ln -s /lib /lib64 \
  &&      mkdir /tmp/zlib && wget -O - "${EXT_ZLIB_URL}" | tar xJf - -C /tmp/zlib \
  &&      cp -dP /tmp/zlib/usr/lib/libz.so* "${GLIBC_PREFIX}/lib" \
  &&      rm -rf /tmp/zlib \
  &&      mkdir /tmp/gcc && wget -O - "${EXT_GCC_LIBS_URL}" | tar xJf - -C /tmp/gcc \
  &&      cp -dP /tmp/gcc/usr/lib/libgcc* /tmp/gcc/usr/lib/libstdc++* "${GLIBC_PREFIX}/lib" \
  &&      rm -rf /tmp/gcc; \
        fi \
  &&    for pkg in $OPT_PKGS ; do apk --no-cache add $pkg ; done \
  &&    ${GLIBC_PREFIX}/sbin/ldconfig \
  &&    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' > /etc/nsswitch.conf \
  &&    mkdir -p $LIBERICA_ROOT \
  &&    mkdir -p /tmp/java \
  &&    if [ "$LIBERICA_USE_LITE" = "1" ]; then  \
            RSUFFIX="-lite";                     \
            LITE_URL="/docker" ;                 \
        else                                     \
            RSUFFIX="";                          \
            LITE_URL="";                         \
        fi \
  &&    LIBERICA_BUILD_STR=${LIBERICA_BUILD:+"+${LIBERICA_BUILD}"} \
  &&    echo LIBERICA_BUILD_STR - ${LIBERICA_BUILD_STR} \
  &&    PKG="bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}${LIBERICA_BUILD_STR}-linux-${LIBERICA_ARCH}${LIBSUFFIX}${RSUFFIX}.tar.gz" \
  &&    PKG_URL="https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}${LITE_URL}/${PKG}" \
  &&    echo "Download ${PKG_URL}" \
  &&    wget "${PKG_URL}" -O /tmp/java/jre.tar.gz \
  &&    SHA_URL="https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}/sha1sum.txt" \
  &&    if [ "$LIBERICA_USE_LITE" = "1" ]; then                                                    \
          SHA_URL="https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}/docker/sha1sum.txt";         \
        fi \
  &&    SHA1=$(wget -q ${SHA_URL} -O -  | grep ${PKG} | grep -v json | cut -f1 -d' ')    \
  &&    echo "${SHA1} */tmp/java/jre.tar.gz" | sha1sum -c - \
  &&    tar xzf /tmp/java/jre.tar.gz -C /tmp/java \
  &&    find "/tmp/java/${LIBERICA_VARIANT}-${LIBERICA_VERSION}" -maxdepth 1 -mindepth 1 -exec mv "{}" "${LIBERICA_ROOT}/" \; \
  &&    ln -s $LIBERICA_ROOT /usr/lib/jvm/jre \
  &&    (ls /usr/lib/jvm/jre/lib/client 1>/dev/null 2>&1 && (rm -rf /usr/lib/jvm/jre/lib/client && sed -i 's#-client\s\+KNOWN#-client IGNORE#g' /usr/lib/jvm/jre/lib/jvm.cfg) || : ) \
  &&    if [ $LIBERICA_GENERATE_CDS = true ]; then                       \
        ${LIBERICA_ROOT}/bin/java -XX:+UseCompressedOops -Xshare:dump;   \
        ${LIBERICA_ROOT}/bin/java -XX:-UseCompressedOops -Xshare:dump;   \
    else                                                                 \
        find ${LIBERICA_ROOT} -name "classes*.jsa" -exec rm {} \; ;      \
    fi                               \
  &&    rm -rf /tmp/java             \
  &&    rm -rf /tmp/hsperfdata_root

ENV JAVA_HOME=${LIBERICA_ROOT} \
	PATH=${LIBERICA_ROOT}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

