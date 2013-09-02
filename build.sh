export ARCH=arm
export TARGET_PRODUCT=d1lkt_KT_KR
export CROSS_COMPILE=../../../linaro/bin/arm-eabi-
make CONFIG_NO_ERROR_ON_MISMATCH=y -j16 zImage
mkbootimg --cmdline " console=ttyHSL0,115200,n8 androidboot.hardware=d1lu user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 lpj=67724" --base 0x80200000 --pagesize 2048 --kernel arch/arm/boot/zImage --ramdisk boot.img-ramdisk.gz  --ramdiskaddr 0x82200000 -o ../boot.img
