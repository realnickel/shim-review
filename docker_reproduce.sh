#!/bin/bash

## (c)2018 Nikolai Kostrigin <nickel@basealt.ru>
## ALT container with hasher based reproducible build for shim binaries
docker build -t altlinux-builder . -f Dockerfile

#privileged is vital here due to isolation support by the kernel inside the container environvent
docker container run -it --privileged --user builder --workdir /home/builder/shim --name shim_rebuild altlinux-builder /bin/bash -c "cd /home/builder/shim && gear-hsh -v --commit -- -v --lazy-cleanup --mountpoint=/proc --no-sisyphus-check=packager,gpg 2>&1 | tee log"

#build log
docker container cp shim_rebuild:/home/builder/shim/log .
#package build RPM style spec file
docker container cp shim_rebuild:/home/builder/shim/.gear/shim.spec .
#ia32 binary
docker container cp shim_rebuild:/home/builder/hasher/chroot/usr/src/RPM/BUILD/shim-15/build-ia32/shimia32.efi .
#x64 binary
docker container cp shim_rebuild:/home/builder/hasher/chroot/usr/src/RPM/BUILD/shim-15/build-x64/shimx64.efi .
#sha256 hashes
sha256sum ./shimia32.efi ./shimx64.efi > sha256sum.shim

docker container rm shim_rebuild



