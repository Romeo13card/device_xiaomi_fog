# Remove Pixel kernel header
rm -rf hardware/google/pixel/kernel_headers/Android.bp

# Clone vendor tree
git clone -b baklava-and-beyond https://github.com/alternoegraha/vendor_xiaomi_fog vendor/xiaomi/fog

# Clone prebuilt kernel
git clone https://github.com/Romeo13card/device_xiaomi_fog-kernel -b neutron device/xiaomi/fog-kernel

# Clone LineageOS' hardware/xiaomi
git clone -b lineage-23.2 https://github.com/LineageOS/android_hardware_xiaomi hardware/xiaomi

# Clone MIUI Camera
git clone -b vauxite-sm6225 https://gitlab.com/ThankYouMario/proprietary_vendor_xiaomi_camera vendor/xiaomi/camera

#Clone DolbyAtmos
git clone https://github.com/swiitch-OFF-Lab/packages_apps_DolbyUI.git packages/apps/DolbyUI -b 16.0 --depth 1
git clone https://github.com/swiitch-OFF-Lab/hardware_dolby.git hardware/dolby -b sony-1.5 --depth 1
