## (c)2018 Nikolai Kostrigin <nickel@basealt.ru>
## Create an ALT docker image with hasher for reproducible build of shim binaries

FROM fotengauer/altlinux-sisyphus
RUN apt-get update && apt-get -y install \
	su \
	git \
	hasher \
	gear

RUN useradd builder 
RUN hasher-useradd builder

USER builder
WORKDIR /home/builder

RUN git clone http://git.altlinux.org/gears/s/shim.git
RUN mkdir hasher 
WORKDIR /home/builder/shim 
