#!/bin/bash

mkdir build
cd build
git clone https://gitlab.com/kalilinux/nethunter/build-scripts/kali-nethunter-installer.git
cd kali-nethunter-installer
./bootstrap.sh
mkdir -p kernels/eleven/a5y17lte
cat /home/loco/Code/nethunter/devices.yml >> kernels/devices.yml
cd ..
git https://github.com/LineageOS/android_kernel_samsung_universal7880 -b lineage-18.1
cd android_kernel_samsung_universal7880
git clone https://gitlab.com/kalilinux/nethunter/build-scripts/kali-nethunter-kernel-builder.git
cd kali-nethunter-kernel-builder
cp /home/loco/Code/nethunter/local.config.example.a5y17lte ./local.config
cp /home/loco/Code/nethunter/config ./config
cp /home/loco/Code/nethunter/anykernel.sh-a5y17lte ./anykernel3/anykernel.sh

echo "Run ./build.sh and press S to get toolchain" 
echo " Then press 2 to configure and 3 to compile the kernel, see if all works"
echo " Press 4 to apply any patches, then 6 to build anykernel.zip"
echo " Once you have the kernel image"
echo " copy the Image (unzipped) to build/kali-nethunter-installer/kernels/eleven/a5y17lte-los"
echo " and run ./build.py -i -k a5y17lte --eleven from build/kali-nethunter-installer"
echo " the resulting file can then be installed using TWRP"
