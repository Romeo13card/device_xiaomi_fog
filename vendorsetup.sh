# Remove Pixel kernel header
rm -rf hardware/google/pixel/kernel_headers/Android.bp

# Clone vendor tree
git clone -b pixelbuilds https://github.com/alternoegraha/vendor_xiaomi_fog vendor/xiaomi/fog

# Clone kernel tree
git clone --depth=1 -b fog-r-oss-staging https://github.com/alternoegraha/fog_kernel_xiaomi_sm6225 kernel/xiaomi/fog

# Clone hardware/xiaomi
git clone https://github.com/alternoegraha/pb_hardware_xiaomi hardware/xiaomi

# Kernel fixups
cd kernel/xiaomi/fog
rm -rf Android.bp
rm -rf techpack/audio/Android.bp
cd ../../..