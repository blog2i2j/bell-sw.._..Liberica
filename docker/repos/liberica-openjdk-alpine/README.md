# bellsoft/liberica-openjdk-alpine

## What is Liberica JDK?
Liberica JDK is free and 100% open-source Progressive Java Runtime for modern Java deployments. It is developed and supported by BellSoft, a major OpenJDK contributor. Application development with Liberica JDK is

*  Flexible. Liberica JDK supports the widest range of present-day architectures and operating systems, which makes it a unified Java runtime for desktop, server, cloud, and embedded use cases.
* Cost- and time-efficient. BellSoft produces the smallest containers in the world based on Liberica Lite and Alpine Linux, which enable companies to minimize deployment time and reduce cloud expenses.
* Secure. Liberica JDK is TCK-verified for Java SE specifications and thoroughly tested for exposures before every release. The CPU release cycle helps to deliver timely security patches and bug fixes to keep the runtime secure and performant at all times.

[Liberica JDK is recommended and used by Spring](https://spring.io/quickstart) as the end-to-end solution for Spring Native applications.
BellSoft serves millions of developers and companies from various industries across the globe. For more information, visit [www.bell-sw.com](https://www.bell-sw.com).
## How to choose an optimal Java image?

We compiled an interactive scheme that will help you decide which BellSoft’s image is perfect for your project.
![How to choose an optimal java image](https://download.bell-sw.com/static/images/how-to-choose-optimal-java-image.jpg)


## What’s in this image?
This repository contains Alpine glibc Docker images of Liberica JDK. Alpine Linux is a lightweight Linux distribution with the base image of ~5MB, which allows minimizing the size of a container. The original Alpine is based on musl, but if you are using a glibc-based distribution and unwilling to migrate to another libc, we added Liberica JDK images for Alpine glibc.
We have been shipping images of Liberica JDK with Alpine musl since JDK 11. BellSoft’s engineers have upstreamed the support of this OS into JDK 16 and beyond as part of the Portola Project, and now we produce the smallest containers on the market that are only 42.72 MB, which are compatible with all Java applications.
Microcontainers with Alpine Linux and Liberica JDK are perfect for building Java microservices:

* They are 5—7 times smaller than traditional images (based on CentOS or Debian, for example), and thus help to reduce cloud resource consumption dramatically
* They accelerate the deployment times
* Fixes and enhancements are introduced continuously and promptly, keeping the containers secure and performant at all times

Liberica JDK images for Alpine are available for following architectures:

* x86_64 (aka amd64)
* aarch64 (aka ARM64)
* armhf (for devices like Raspberry Pi 2/3)

The tags point at the Java version (right after the OS name) and supported architecture.
Image name structure:
X-Y and X-cds-Y, where X is the Java version and Y is the architecture type. If the architecture type is not included into the name, then the build supports AMD64 and ARM64 by default.
The ‘latest’ tag points to the latest version of an image. Images with '-cds' in tag contain CDS (Class Data Sharing) archive.
For instance, [bellsoft/liberica-openjdk-alpine:19.0.1-aarch64](https://hub.docker.com/layers/bellsoft/liberica-openjdk-alpine/19.0.1-aarch64/images/sha256-f22af7458af1b43b00898bfb5bbb0648d151c67a0793ab0bbbac6743afb9d412?context=explore) is an image with Liberica JDK version 19.0.1 for Alpine glibc running on AArch64

## Alpaquita Linux is a free and advanced replacement for Alpine to use in containers with Liberica JDK.

[Alpaquita](https://bell-sw.com/alpaquita-linux/) is a lightweight Linux distribution that integrates all the main features of Alpine plus multiple enhancements and enterprise support.

Like Alpine, Alpaquita is a small and performant Linux distribution, but in addition to that, it
 - supports both musl and glibc,
 - provides an optimized version of musl,
 - is more secure thanks to the kernel hardening, Secure Boot support, and other features,
 - contains [multiple performance enhancements](https://bell-sw.com/blog/alpaquita-linux-features-explained/).

The most important Alpaquita’s feature for the enterprise development is the support from the BellSoft team. Containers with Alpaquita and Liberica JDK are a unified solution with tested and perfectly compatible components that receive support and regular updates from a single vendor. Our clients obtain fixes on demand, which are implemented in the next release and become available for everyone. We provide Long-Term Support and a software bill of materials both for Liberica JDK and Alpaquita Linux.

As such, containers with Alpaquita are a free and better alternative to Alpine-based solutions.

You can find them at https://hub.docker.com/r/bellsoft/liberica-runtime-container

## Tags
* [`latest-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/24/Dockerfile),
[`latest`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/24/Dockerfile),
[`24.0.1-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/24/Dockerfile),
[`24.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/24/Dockerfile),
[`24-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/24/Dockerfile),
[`24`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/24/Dockerfile),
* [`23-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/23/Dockerfile),
[`23`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/23/Dockerfile),
* [`22`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/22/Dockerfile),
[`22-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/22/Dockerfile),
* [`21.0.7-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/21/Dockerfile),
[`21.0.7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/21/Dockerfile),
[`21.0.6-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/21/Dockerfile),
[`21.0.6`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/21/Dockerfile),
[`21.0.5-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/21/Dockerfile),
[`21.0.5`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/21/Dockerfile),
[`21.0.4-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/21/Dockerfile),
[`21.0.4`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/21/Dockerfile),
[`21.0.3-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/21/Dockerfile),
[`21.0.3`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/21/Dockerfile),
[`21`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/21/Dockerfile),
[`21-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/21/Dockerfile),
* [`20`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/old/20/Dockerfile)
* [`19`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/old/19/Dockerfile)
* [`18`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/old/18/Dockerfile)
* [`17.0.15-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/17/Dockerfile),
[`17.0.15`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/17/Dockerfile),
[`17.0.14-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/17/Dockerfile),
[`17.0.14`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/17/Dockerfile),
[`17.0.13-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/17/Dockerfile),
[`17.0.13`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/17/Dockerfile),
[`17.0.12`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/17/Dockerfile),
[`17.0.12-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/17/Dockerfile),
[`17.0.11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/17/Dockerfile),
[`17.0.11-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/17/Dockerfile),
[`17`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/17/Dockerfile),
[`17-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/17/Dockerfile)
* [`16`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/old/16/Dockerfile)
* [`15`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/old/15/Dockerfile)
* [`14`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/old/14/Dockerfile)
* [`13`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/old/13.0.0/Dockerfile)
* [`12`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/old/12.0.0/Dockerfile)
* [`11.0.27-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/11/Dockerfile),
[`11.0.27`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/11/Dockerfile),
[`11.0.26-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/11/Dockerfile),
[`11.0.26`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/11/Dockerfile),
[`11.0.25-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/11/Dockerfile),
[`11.0.25`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/11/Dockerfile),
[`11.0.24`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/11/Dockerfile),
[`11.0.24-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/11/Dockerfile),
[`11.0.23`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/11/Dockerfile),
[`11.0.23-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/11/Dockerfile),
[`11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/11/Dockerfile),
[`11-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/11/Dockerfile)
* [`10.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/old/10.0.2/Dockerfile),
[`10.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/old/10.0.1/Dockerfile),
[`10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/old/10.0.0/Dockerfile) - armhf only (Raspberry Pi 2/3)
* [`9.0.4`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/old/9.0.4/Dockerfile),
[`9.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/old/9.0.1/Dockerfile) - armhf only (Raspberry Pi 2/3)
* [`8u432`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/8/Dockerfile),
[`8u432-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/8/Dockerfile),
[`8u422`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/8/Dockerfile),
[`8u422-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/8/Dockerfile),
[`8u412`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/8/Dockerfile),
[`8u412-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/8/Dockerfile),
[`8u392`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/8/Dockerfile),
[`8u392-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/8/Dockerfile),
[`8u`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/8/Dockerfile),
[`8u-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/8/Dockerfile),
[`8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/8/Dockerfile),
[`8-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine/8/Dockerfile)   - amd64 and aarch64 only


## Build

Dockerfile accepts the following parameters:

* `LANG` – Specifies a `locale` for this image. By default it's set to en_US.UTF-8, for locale names see <https://www.gnu.org/software/gettext/manual/html_node/Locale-Names.html#Locale-Names>. Note that the specified locale cannot be changed in runtime.
* `OPT_PKGS` – Specifies a list of optional Alpine Linux packages to be installed, the packages should be separated by spaces, i.e. "curl lftp ttf-dejavu".

### Version specific options

* JDK 8u* version
  * `LIBERICA_USE_LITE` – defines content of JDK for this image. `0` means keep jdk unchanged, `1` (default) creates lite image, where demos, samples and sources are removed from image.
* JDK 11* and JDK 17* versions
  * `LIBERICA_IMAGE_VARIANT` – possible image variants are:
    * `base` – server VM with `java.base` module.
	* `base-minimal` – minimal VM with `java.base` module.
	* `lite` (default) – lite JDK with minimal footprint.
	* `standard` – standard JDK.
  * `LIBERICA_VM` – this option defines included VM for lite and standard image variant. Possible values are:
    * `server` (default) – add `server` VM to image.
	* `client` – add `client` VM to image.
	* `minimal` – add `minimal` VM to image.
	* `all` – add all VMs from original bundle to image.

## Usage

For example, you can run a Liberica OpenJDK 17 container with the following command:

 ```docker run -it --rm bellsoft/liberica-openjdk-alpine:latest java -version```

To run some application you can create Dockerfile, based on bellsoft/liberica-openjdk-alpine image or mount volume with your code/applicaiton, for example:

 ```docker run -it --rm  -v /home/user/project/:/data bellsoft/liberica-openjdk-alpine:latest java -jar /data/MyApp.jar```

## Off-screen rendering

Containerized deployments sometimes do some off-screen rendering, such as when preparing documents, forms, and images. When performing off-screen rendering, the JDK requires OS fonts and `fontconfig` libraries to be present.
In case when you don't have these libraries or fonts you will encounter the exception, similar to one below:

```
Exception in thread "main" java.lang.InternalError: java.lang.reflect.InvocationTargetException
	at java.desktop/sun.font.FontManagerFactory$1.run(FontManagerFactory.java:86)
	at java.base/java.security.AccessController.doPrivileged(AccessController.java:312)
	at java.desktop/sun.font.FontManagerFactory.getInstance(FontManagerFactory.java:74)
	at java.desktop/sun.font.SunFontManager.getInstance(SunFontManager.java:247)
	at java.desktop/sun.font.FontDesignMetrics.getMetrics(FontDesignMetrics.java:261)
	at java.desktop/sun.swing.SwingUtilities2.getFontMetrics(SwingUtilities2.java:1243)
...
	at jdk.compiler/com.sun.tools.javac.launcher.Main.run(Main.java:192)
	at jdk.compiler/com.sun.tools.javac.launcher.Main.main(Main.java:132)
Caused by: java.lang.NullPointerException
	at java.desktop/sun.awt.FontConfiguration.getVersion(FontConfiguration.java:1262)
	at java.desktop/sun.awt.FontConfiguration.readFontConfigFile(FontConfiguration.java:225)
	at java.desktop/sun.awt.FontConfiguration.init(FontConfiguration.java:107)
	at java.desktop/sun.awt.X11FontManager.createFontConfiguration(X11FontManager.java:719)
	at java.desktop/sun.font.SunFontManager$2.run(SunFontManager.java:362)
	at java.base/java.security.AccessController.doPrivileged(AccessController.java:312)
	at java.desktop/sun.font.SunFontManager.<init>(SunFontManager.java:307)
	at java.desktop/sun.awt.FcFontManager.<init>(FcFontManager.java:35)
	at java.desktop/sun.awt.X11FontManager.<init>(X11FontManager.java:56)
	... 28 more
```

On Alpine Linux, these libraries are provided by `fontconfig` and `ttf-dejavu` packages, and can be installed by running the following command:

```apk add fontconfig ttf-dejavu```

The Liberica JDK Dockerfile can be built with these libraries by specifying `OPT_PKGS` build argument:

```shell
docker build -t bellsoft/liberica-openjdk-alpine:11 \
  --build-arg LIBERICA_RELEASE_TAG=11.0.6 \
  --build-arg LIBERICA_VERSION=11.0.6 \
  --build-arg LIBERICA_BUILD=10 \
  --build-arg LIBERICA_VARIANT=jdk \
  --build-arg LIBERICA_ROOT=/usr/lib/jvm/jdk-11.0.6-bellsoft-x86_64 \
  --build-arg OPT_PKGS="fontconfig ttf-dejavu"
```
