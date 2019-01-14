## (c)2018 Nikolai Kostrigin <nickel@basealt.ru>
## Create an ALT docker image with hasher for reproducible build of shim binaries

FROM alt:sisyphus
RUN apt-get update && apt-get -y install \
	su \
	git \
	hasher \
	gear

RUN useradd builder 
RUN hasher-useradd builder

RUN mkdir -p /tmp/.private/builder
RUN chown builder:builder /tmp/.private/builder

USER builder
WORKDIR /home/builder
ADD ./hsh-sandbox.tar /home/builder

RUN git clone http://git.altlinux.org/gears/s/shim.git
RUN mkdir hasher 
WORKDIR /home/builder/shim 
