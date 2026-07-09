#!/system/bin/sh
#=================================================
# Set device properties for Redmi K90 Ultra (warsaw)
#=================================================
set -e

model="Redmi K90 Ultra"
log_file="/tmp/recovery.log"

log() {
    echo "variant-props-override.sh: $1" | tee -a "$log_file"
}

#-------------------------------------------------
# Set vibrator-related properties
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
# Set product & model properties
#-------------------------------------------------
device_props=(
    ro.build.product
    ro.product.device
    ro.product.odm.device
    ro.product.vendor.device
    ro.product.product.device
    ro.product.system_ext.device
    ro.product.system.device
    ro.product.bootimage.device
    ro.product.name
    ro.product.odm.name
    ro.product.vendor.name
    ro.product.product.name
    ro.product.system_ext.name
    ro.product.system.name
)

model_props=(
    ro.product.model
    ro.product.odm.model
    ro.product.vendor.model
    ro.product.product.model
    ro.product.system_ext.model
    ro.product.system.model
)

for prop in "${device_props[@]}"; do
    resetprop "$prop" "warsaw"
done

for prop in "${model_props[@]}"; do
    resetprop "$prop" "$model"
done

#-------------------------------------------------
# Signal init that variant setup is complete
#-------------------------------------------------
setprop twrp.variant.files_copied "1"

#-------------------------------------------------
# Done
#-------------------------------------------------
log "Applied device props for: $model (warsaw)"
exit 0
