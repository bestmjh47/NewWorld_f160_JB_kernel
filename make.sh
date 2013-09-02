#!/bin/bash
#######################################################
#  PANTECH defined Environment                        #
#######################################################
# export TARGET_BUILD_SKY_MODEL_NAME=IM-A750K
# export TARGET_BUILD_SKY_MODEL_ID=MODEL_EF32K
# export TARGET_BUILD_SKY_BOARD_VER=EF32K_ES20
# export TARGET_BUILD_SKY_FIRMWARE_VER=S0832143
# export TARGET_BUILD_SKY_CUST_INCLUDE=$PWD/include/CUST_SKY.h
# export TARGET_BUILD_SKY_CUST_INCLUDE_DIR=$PWD/include
#######################################################

ODIR=../build_d1l
image_filename="$ODIR/arch/arm/boot/zImage"
TOOLCHAIN=../../../linaro/bin/arm-eabi-

export ARCH=arm
export toolchain=../../../linaro/bin/arm-eabi-
KERNEL_DEFCONFIG=d1lu-perf_defconfig

if [ ! -d $ODIR ]; then
	mkdir $ODIR
	chmod 755 $ODIR
fi

if [ ! -f $ODIR/.config ]; then
	echo "load defconfig"
	make O=$ODIR ARCH=arm CROSS_COMPILE=$TOOLCHAIN $KERNEL_DEFCONFIG 
fi

if [ "$1" = "" ]; then
	make CONFIG_NO_ERROR_ON_MISMATCH=y -j16 O=$ODIR ARCH=arm CROSS_COMPILE=$TOOLCHAIN zImage
else
	make -j16 O=$ODIR ARCH=arm CROSS_COMPILE=$TOOLCHAIN $1 $2 $3
fi

if [ -f $image_filename ]; then
	echo "   make boot.img"
	mkbootimg --cmdline " console=ttyHSL0,115200,n8 androidboot.hardware=d1lu user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 lpj=67724" --base 0x80200000 --pagesize 2048 --kernel $ODIR/arch/arm/boot/zImage --ramdisk boot.img-ramdisk.gz  --ramdiskaddr 0x82200000 -o ../boot.img
fi


