This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your branch

Note that we really only have experience with using grub2 on Linux, so asking
us to endorse anything else for signing is going to require some convincing on
your part.

Here's the template:

-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
Nikolai Kostrigin for
Basealt Ltd. (Bazalt Svobodnoe Programmnoe Obespechenie, OOO)
https://www.basealt.ru

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
OS ALT
https://www.basealt.ru/go/download/

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
OS ALT is a linux distribution supporting Secure Boot

-------------------------------------------------------------------------------
Who is the primary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Dmitry Levin
- Position: Principal Software Engineer
- Email address: ldv@basealt.ru
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the linux community: ldv.pub

-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Nikolai Kostrigin
- Position: Software Engineer
- Email address: nickel@basealt.ru
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the linux community: nickel.pub

-------------------------------------------------------------------------------
What upstream shim tag is this starting from:
-------------------------------------------------------------------------------
https://github.com/rhboot/shim/releases/tag/15

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
http://git.altlinux.org/gears/s/shim.git

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
No

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
-------------------------------------------------------------------------------
A Docker container creation scripts are attached.
Please run /bin/bash ./docker_reproduce.sh

Build container produces following artifacts:
1. ./build/log - build log
2. ./build/shim.spec - a copy of RPM style spec file which defines the build
3. ./build/shimia32.efi - rebuilt ia32 binary
4. ./build/shimx64.efi - rebuilt x64 binary
5. ./build/sha256sum.shim - sha256 hashes calculated for mentioned binaries

The following tools are used to build binaries in a clean chrooted environment:
https://www.altlinux.org/Hasher

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
Log file of the build is available as a "log" 

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------
Sysdev Submission ID:
14351339051890343 for shimia32.efi
13566173665208949 for shimx64.efi
