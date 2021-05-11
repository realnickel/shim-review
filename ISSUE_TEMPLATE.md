Make sure you have provided the following information:

 - [x] link to your code branch cloned from rhboot/shim-review in the form user/repo@tag
https://github.com/realnickel/shim-review/tree/BaseALT-shim15.4-ia32-x64-20210511
 - [x] completed README.md file with the necessary information
 - [x] shim.efi to be signed
 - [x] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [x] binaries, for which hashes are added do vendor_db ( if you use vendor_db and have hashes allow-listed )
 - [x] any extra patches to shim via your own git tree or as files
 - [x] any extra patches to grub via your own git tree or as files
 - [x] build logs
 - [x] a Dockerfile to reproduce the build of the provided shim EFI binaries
https://github.com/realnickel/shim-review/blob/BaseALT-shim15.4-ia32-x64-20210511/docker_reproduce.sh
https://github.com/realnickel/shim-review/blob/BaseALT-shim15.4-ia32-x64-20210511/Dockerfile


###### What organization or people are asking to have this signed:
Basealt Ltd. (Bazalt Svobodnoe Programmnoe Obespechenie, OOO)
https://www.basealt.ru

###### What product or service is this for:
OS ALT
https://getalt.org/en/
https://www.basealt.ru/go/downloads/

###### Please create your shim binaries starting with the 15.4 shim release tar file:
###### https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2
###### This matches https://github.com/rhboot/shim/releases/tag/15.4 and contains
###### the appropriate gnu-efi source.
###### Please confirm this as the origin your shim.
We use 15.4 shim (https://github.com/rhboot/shim/releases/tag/15.4) +
1bea91ba Fix a broken file header on ia32 (PR #357)

all patches from https://github.com/rhboot/shim-review/issues/165 to address
critical issues

###### What's the justification that this really does need to be signed for the whole world to be able to boot it:
OS ALT is a linux distribution supporting Secure Boot

###### How do you manage and protect the keys used in your SHIM?
Access to server used to sign binaries is restricted physically.
Only few trusted persons have sign authority.

###### Do you use EV certificates as embedded certificates in the SHIM?
No EV certs, but selfsigned altlinux-ca.cer is embedded

###### If you use new vendor_db functionality, are any hashes allow-listed, and if yes: for what binaries ?
No

###### Is kernel upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 present in your kernel, if you boot chain includes a Linux kernel ?
Yes

###### if SHIM is loading GRUB2 bootloader, are CVEs CVE-2020-14372,
###### CVE-2020-25632, CVE-2020-25647, CVE-2020-27749, CVE-2020-27779,
###### CVE-2021-20225, CVE-2021-20233, CVE-2020-10713, CVE-2020-14308,
###### CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
###### ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
###### and if you are shipping the shim_lock module CVE-2021-3418
###### fixed ?
Yes

###### "Please specifically confirm that you add a vendor specific SBAT entry for SBAT header in each binary that supports SBAT metadata
###### ( grub2, fwupd, fwupdate, shim + all child shim binaries )" to shim review doc ?
###### Please provide exact SBAT entries for all SBAT binaries you are booting or planning to boot directly through shim
SBAT for shim:

sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
shim,1,UEFI shim,shim,1,https://github.com/rhboot/shim
shim.altlinux,1,ALT Linux,shim,15.4-alt2,http://git.altlinux.org/gears/s/shim.git

SBAT for grub:

sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
grub,1,Free Software Foundation,grub,2.06-rc1,https://www.gnu.org/software/grub/
grub.altlinux,1,ALT Linux,grub,2.06-alt1.rc1,http://git.altlinux.org/gears/g/grub.git

SBAT for fwupd has the same style

sbat,1,UEFI shim,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
fwupd,1,Firmware update daemon,fwupd,1.5.9,https://github.com/fwupd/fwupd
fwupd.altlinux,1,ALT Linux,fwupd,1.5.9-alt1,http://git.altlinux.org/gears/f/fwupd.git

##### Were your old SHIM hashes provided to Microsoft ?
Yes

##### Did you change your certificate strategy, so that affected by CVE-2020-14372, CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
##### CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
##### CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705 ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
##### grub2 bootloaders can not be verified ?
Yes

##### What exact implementation of Secureboot in grub2 ( if this is your bootloader ) you have ?
##### * Upstream grub2 shim_lock verifier or * Downstream RHEL/Fedora/Debian/Canonical like implementation ?
Downstream RHEL/Fedora/Debian/Canonical like implementation

###### What is the origin and full version number of your bootloader (GRUB or other)?
upstream grub-2.06-rc1 including patches for all currently discussed security issues;
also there are some SB patches from Fedora and other patches listed in repository's grub_patches subdir

###### If your SHIM launches any other components, please provide further details on what is launched
It also launches fwupd-1.5.9-alt1

###### If your GRUB2 launches any other binaries that are not Linux kernel in SecureBoot mode,
###### please provide further details on what is launched and how it enforces Secureboot lockdown
It doesn't

###### If you are re-using a previously used (CA) certificate, you
###### will need to add the hashes of the previous GRUB2 binaries
###### exposed to the CVEs to vendor_dbx in shim in order to prevent
###### GRUB2 from being able to chainload those older GRUB2 binaries. If
###### you are changing to a new (CA) certificate, this does not
###### apply. Please describe your strategy.
We are switching to a new certificate

###### How do the launched components prevent execution of unauthenticated code?
GRUB and kernel are patched to enforce Secure Boot.

###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?
No

###### What kernel are you using? Which patches does it includes to enforce Secure Boot?
Linux Kernel:
5.4  (std-def: standard longterm kernel for stable branches),
5.10 (std-def: standard longterm kernel for unstable branch),
        http://git.altlinux.org/gears/k/kernel-image-std-def.git
5.11 (un-def: more modern than std-def and with forced preemption enabled),
        http://git.altlinux.org/gears/k/kernel-image-un-def.git?p=kernel-image-un-def.git;a=summary

###### What changes were made since your SHIM was last signed?
Upstream version update (15 -> 15.4 + fixes)

###### What is the SHA256 hash of your final SHIM binary?
00f59c23d70369ebe4c6f1f74928e094f5b15e155da4f484c4e6d2946ded8c90  shimia32.efi
4ed7d10389810632198d9c227296e46b222c16daf0122d0f17b5cbe52c18cd72  shimx64.efi
