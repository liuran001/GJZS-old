#!/system/bin/sh
MODPATH=/data/adb/modules/huzeASGuard
[[ -d ${MODPATH} ]] || source '/data/media/0/Android/ASGuard.conf'
[[ -n "${MODPATH}" ]] || MODPATH=/data/adb/lite_modules/huzeASGuard
touch ${MODPATH}/disable
echo "waiting...."
sleep 3
rm ${MODPATH}/config/EAS.ini
settings put secure enabled_accessibility_services ""
rm ${MODPATH}/disable
echo "OK"
