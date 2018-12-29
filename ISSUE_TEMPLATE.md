
Make sure you have provided the following information:

 - [ ] link to your code branch cloned from rhboot/shim-review in the form user/repo@tag
 - [ ] completed README.md file with the necessary information
 - [ ] shim.efi to be signed
 - [ ] public portion of your certificate embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [ ] any extra patches to shim via your own git tree or as files
 - [ ] any extra patches to grub via your own git tree or as files
 - [ ] build logs


###### What organization or people are asking to have this signed:
Basealt Ltd. (Bazalt Svobodnoe Programmnoe Obespechenie, OOO)
https://www.basealt.ru

###### What product or service is this for:
OS ALT
https://www.basealt.ru/go/download/

###### What is the origin and full version number of your shim?
https://github.com/rhboot/shim/releases/tag/15

###### What's the justification that this really does need to be signed for the whole world to be able to boot it:
OS ALT is a linux distribution supporting Secure Boot

###### How do you manage and protect the keys used in your SHIM?
Access to server used to sign binaries is restricted physically 

###### Do you use EV certificates as embedded certificates in the SHIM?
no EV certs, but selfsigned altlinux-ca.cer is embedded

###### What is the origin and full version number of your bootloader (GRUB or other)?
GRUB2.02, elilo3.16, rEFInd0.11.4

http://git.altlinux.org/gears/g/grub.git
http://git.altlinux.org/gears/e/elilo.git
http://git.altlinux.org/gears/r/refind.git

###### If your SHIM launches any other components, please provide further details on what is launched
rEFInd0.11.3 in case of LiveCD or OS installer boot
grub2.02 in case of installed system

###### How do the launched components prevent execution of unauthenticated code?


###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?


###### What kernel are you using? Which patches does it includes to enforce Secure Boot?
Linux Kernel: 
4.14 (std-def: standard longterm kernel), 
	http://git.altlinux.org/gears/k/kernel-image-std-def.git;
4.19 (un-def: more modern than std-def and with forced preemption enabled),
	http://git.altlinux.org/gears/k/kernel-image-un-def.git?p=kernel-image-un-def.git;a=summary

###### What changes were made since your SHIM was last signed?
Upstream version update (0.4 -> 15)

###### What is the hash of your final SHIM binary?
479b62c0a762692c45ff9f25c56789c1ede85982e2415f37b6d756de6b685b12  shimia32.efi
2bceb0c2a625ee289218dcc30a7eef8caa9551af82a2af1aba75d2a668c01094  shimx64.efi
