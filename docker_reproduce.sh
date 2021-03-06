#!/bin/bash
BUILDDIR="build"

## (c)2018 Nikolai Kostrigin <nickel@basealt.ru>

# prepare an archive with sandboxes for Sisyphus
tar -cvf ./hsh-sandbox.tar ./hsh-sandbox

## ALT container with hasher based reproducible build for shim binaries
docker build -t alt:sisyphus . -f Dockerfile

#privileged is vital here due to isolation support by the kernel inside
#the container environment

docker container run -it --privileged --user builder \
  --workdir /home/builder/shim --name shim_rebuild alt:sisyphus /bin/bash \
 -c "cd /home/builder/shim && /home/builder/hsh-sandbox/sisyphus-x86_64/compile build 2>&1 | tee log"

[ ! -d "./$BUILDDIR" ] && mkdir ./$BUILDDIR

#build log
docker container cp shim_rebuild:/home/builder/shim/log ./$BUILDDIR

#package build RPM style spec file
docker container cp shim_rebuild:/home/builder/shim/.gear/shim.spec ./$BUILDDIR

#ia32 binary
docker container cp \
  shim_rebuild:/tmp/.private/builder/hsh-sandbox/sisyphus-x86_64/hasher/chroot/usr/src/RPM/BUILD/shim-15.4/build-ia32/shimia32.efi \
  ./$BUILDDIR

#x64 binary
docker container cp \
	shim_rebuild:/tmp/.private/builder/hsh-sandbox/sisyphus-x86_64/hasher/chroot/usr/src/RPM/BUILD/shim-15.4/build-x64/shimx64.efi \
	./$BUILDDIR

#sha256 hashes
sha256sum ./$BUILDDIR/shimia32.efi ./$BUILDDIR/shimx64.efi > ./$BUILDDIR/sha256sum.shim

docker container rm shim_rebuild
