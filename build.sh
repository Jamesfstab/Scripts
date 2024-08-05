#!/bin/bash
path=~/

MOTO() {
    mkdir cr
    cd cr

    cd cr
    git clone https://github.com/Jamesfstab/private-keys -b Android-14 vendor/lineage-priv
    git clone https://github.com/Jamesfstab/vendor_extra -b Android-14 vendor/extra

    echo -ne '\n' | repo init -u https://github.com/crdroidandroid/android.git -b 14.0 --git-lfs --depth=1
    repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

    cd $path/cr

    # Device tree
    git clone https://github.com/Jamesfstab/android_device_motorola_corfur -b Android-14 device/motorola/corfur
    git clone https://github.com/Jamesfstab/proprietary_vendor_motorola_corfur -b Android-14 vendor/motorola/corfur
    git clone https://github.com/moto-corfur/android_kernel_motorola_sm6375 -b Android-14 kernel/motorola/sm6375

    # Setup
    . b*/e* && breakfast corfur && make -j$(nproc --all)

    cp -r out/target/product/*/crDroidAndroid**.zip $path

    cd $path
}
