#!/bin/bash
set -e
echo "Welcome to the UBports Installer for OnePlus 6(T)"
echo "This bash script can help you install Ubuntu Touch."
echo " "
echo "1. First, you need to download latest artifacts from https://gitlab.com/ubports/community-ports/android9/oneplus-6/oneplus-enchilada-fajita/-/pipelines"
echo "2. Ubuntu Touch and installer must be in the same directory"
echo " "
echo "If you have no fastboot, you need to download SDK-Platform-Tools from https://dl.google.com/android/repository/platform-tools-latest-linux.zip, and then unpack this zip file to your home directory."
echo " "
read -p "Choose install method. Update (u), Clean (c): " choose
    case $choose in
        "u")
            echo "Starting update"
            ~/platform-tools/fastboot set_active a
            ~/platform-tools/fastboot flash boot boot.img
            ~/platform-tools/fastboot flash system system.img
            ~/platform-tools/fastboot reboot
            echo "Enjoy your new system! ;p"
            ;;
        "c") 
            echo "Starting clean install"
            ./fastboot set_active a
            ./fastboot -w
            ./fastboot flash boot boot.img
            ./fastboot flash system system.img
            ./fastboot reboot
            echo "Enjoy your new system! ;p"
            ;;
    esac
