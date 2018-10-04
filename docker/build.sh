#!/bin/sh
set -x

PUSH=$1
[ -z $PUSH ] && PUSH="0"

NS=bellsoft
if [ -z $LIBERICA_ARCH ]; then
	#LIBERICA_ARCH="amd64"

	LOCAL_ARCH=`uname -m`
	case $LOCAL_ARCH in
		x86_64)
			LIBERICA_ARCH="amd64"
			;;
		aarch64)
			LIBERICA_ARCH=$LOCAL_ARCH
			LIBERICA_ARCH_TAG="ARMv8"
			;;
		*)
			LIBERICA_ARCH=$LOCAL_ARCH
			;;
	esac
fi
[ -z $LIBERICA_ARCH_TAG ] && LIBERICA_ARCH_TAG="$LIBERICA_ARCH"
[ -z $LIBERICA_VERSION ] && LIBERICA_VERSION="10.0.2 10.0.2:10 10.0.2:latest"
[ -z $LIBERICA_VARIANT ] && LIBERICA_VARIANT="jdk jre"
[ -z $LIBERICA_OS ] && LIBERICA_OS="debian centos alpine"

for os in $LIBERICA_OS; do
	for version in $LIBERICA_VERSION; do
		for variant in $LIBERICA_VARIANT; do
			TAG=$version
			V=$version
			`echo "$version" | grep -q -- ':'` && TAG=`echo "$version" | cut -d: -f2` && V=`echo "$version" | cut -d: -f1`
			BUILD_PATH="./$os"
			[ -f ./$LIBERICA_ARCH/$os/Dockerfile ] && BUILD_PATH="./$LIBERICA_ARCH/$os"
			echo "Building Liberica $variant v $version..."
			docker build -t ${NS}/liberica-open${variant}-$os:$TAG \
				--build-arg LIBERICA_ARCH=$LIBERICA_ARCH \
				--build-arg LIBERICA_ARCH_TAG=$LIBERICA_ARCH_TAG \
				--build-arg LIBERICA_VERSION=$V \
				--build-arg LIBERICA_VARIANT=$variant \
				$BUILD_PATH
			[ "$PUSH" = "1" ] && docker push ${NS}/liberica-open${variant}-$os:$TAG
		done
	done
done

