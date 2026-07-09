#!/system/bin/sh
#=================================================
# Device properties for Redmi K90 Ultra (warsaw)
#=================================================
set -e

log_file="/tmp/recovery.log"
model="Redmi K90 Ultra"
device="warsaw"

log() {
    echo "variant-script: $1" | tee -a "$log_file"
}

#-------------------------------------------------
# Vibrator
#-------------------------------------------------
resetprop ro.odm.mm.vibrator.audio_haptic_support "true"
resetprop ro.odm.mm.vibrator.resonant_frequency "170"
resetprop ro.odm.mm.vibrator.slide_effect_protect_time "35"
resetprop ro.odm.mm.vibrator.sys_path "/sys/class/qcom-haptics"
resetprop ro.odm.mm.vibrator.device_type "agm"
resetprop ro.vendor.mm.vibrator.sys_path "/sys/class/qcom-haptics"

#-------------------------------------------------
# USB product string
#-------------------------------------------------
echo "$model" >/config/usb_gadget/g1/strings/0x409/product

#-------------------------------------------------
# Signal init that setup is complete
#-------------------------------------------------
setprop twrp.variant.files_copied "1"

log "Applied props for $model ($device)"
exit 0
