export ARCH=arm
export TARGET_PRODUCT=d1lu_LGU_KR
export CROSS_COMPILE=../../../linaro/bin/arm-eabi-
make CONFIG_NO_ERROR_ON_MISMATCH=y -j16 modules
