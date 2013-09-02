cp drivers/staging/prima/wlan.ko ../wlan.ko
../../../arm-eabi-4.6/bin/arm-eabi-strip --strip-unneed ../wlan.ko
cp drivers/staging/prima/firmware_bin/WCNSS_cfg.dat ../WCNSS_cfg.dat
cp net/wireless/cfg80211.ko ../cfg80211.ko
../../../arm-eabi-4.6/bin/arm-eabi-strip --strip-unneed ../cfg80211.ko
