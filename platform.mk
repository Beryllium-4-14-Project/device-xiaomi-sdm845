# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Platform path
PLATFORM_COMMON_PATH := device/xiaomi/sdm845-common

PRODUCT_PLATFORM_SOD := true

TARGET_BOARD_PLATFORM := sdm845

SONY_ROOT := $(PLATFORM_COMMON_PATH)/rootdir

TARGET_PD_SERVICE_ENABLED := true

# Wi-Fi definitions for Qualcomm solution
WIFI_DRIVER_BUILT := qca_cld3
WIFI_DRIVER_DEFAULT := qca_cld3
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
HOSTAPD_VERSION := VER_0_8_X
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X
TARGET_USES_ICNSS_QMI := true
WIFI_DRIVER_STATE_CTRL_PARAM := "/sys/kernel/boot_wlan/boot_wlan"
WIFI_DRIVER_STATE_OFF := 0
WIFI_DRIVER_STATE_ON := 1

# BT definitions for Qualcomm solution
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
TARGET_USE_QTI_BT_STACK := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_COMMON_PATH)/bluetooth
WCNSS_FILTER_USES_SIBS := true

# TAD
TARGET_USES_TAD_V2 := true

# RIL
TARGET_PER_MGR_ENABLED := true

# NFC
NXP_CHIP_FW_TYPE := PN553

# Audio
BOARD_SUPPORTS_SOUND_TRIGGER := true

# SSC Sensors
TARGET_USES_SSC := true

# Display
TARGET_HAS_HDR_DISPLAY := true
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_USES_DRM_PP := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 2

# Lights HAL: Backlight
TARGET_USES_SDE := true

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(PLATFORM_COMMON_PATH)/overlay

# A/B support
AB_OTA_UPDATER := true
PRODUCT_SHIPPING_API_LEVEL := 26

# A/B OTA dexopt package
PRODUCT_PACKAGES += \
    otapreopt_script

# A/B OTA dexopt update_engine hookup
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# A/B related packages
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_client \
    update_engine_sideload \
    update_verifier \
    bootctrl.sdm845 \
    bootctrl.sdm845.recovery

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    vendor \
    vbmeta

# Treble
# Include vndk/vndk-sp/ll-ndk modules
PRODUCT_PACKAGES += \
    vndk_package

# Device Specific Permissions
PRODUCT_COPY_FILES += \
     frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
     frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
     frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
     frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

# Audio
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml \
    $(SONY_ROOT)/vendor/etc/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    $(SONY_ROOT)/vendor/etc/audio_tuning_mixer_tavil.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tavil.txt \
    $(SONY_ROOT)/vendor/etc/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(SONY_ROOT)/vendor/etc/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(SONY_ROOT)/vendor/etc/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml

# Audio - Separation between plain AOSP configuration and extended CodeAurora Audio HAL features
AUDIO_HAL_TYPE := $(if $(filter true,$(TARGET_USES_AOSP_AUDIO_HAL)),aosp,caf)
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/$(AUDIO_HAL_TYPE)_common_primary_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/common_primary_audio_policy_configuration.xml

# Media
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(SONY_ROOT)/vendor/etc/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(SONY_ROOT)/vendor/etc/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Qualcom WiFi Overlay
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(SONY_ROOT)/vendor/etc/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf

# Qualcom WiFi Configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini

# NFC Configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf

# Touch IDC
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/usr/idc/clearpad.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/clearpad.idc \
    $(SONY_ROOT)/vendor/usr/idc/synaptics_tcm_touch.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/synaptics_tcm_touch.idc

# Keylayout
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/usr/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl

# FPC Gestures
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/usr/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# RQBalance-PowerHAL configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/rqbalance_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/rqbalance_config.xml

# CAMX config
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/camera/camxoverridesettings.txt:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camxoverridesettings.txt

# Platform specific init
PRODUCT_PACKAGES += \
    init.sdm845 \
    init.sdm845.pwr \
    ueventd

# Audio
PRODUCT_PACKAGES += \
    sound_trigger.primary.sdm845 \
    audio.primary.sdm845

# GFX
PRODUCT_PACKAGES += \
    copybit.sdm845 \
    gralloc.sdm845 \
    hwcomposer.sdm845 \
    memtrack.sdm845

# GPS
PRODUCT_PACKAGES += \
    gps.sdm845

# Sensors
PRODUCT_PACKAGES += \
    sns_reg_config \
    hals.conf

# SSC Common config
PRODUCT_PACKAGES += \
    ak991x_dri_0.json \
    bma2x2_0.json \
    bme680_0.json \
    bmg160_0.json \
    bmp285_0.json \
    bmp380_0.json \
    bu52053nvx_0.json \
    cm3526_0.json \
    default_sensors.json \
    dps368_0.json \
    lsm6dsm_0_16g.json \
    lsm6dsm_0.json \
    lsm6dso_0_16g.json \
    lsm6dso_0.json \
    shtw2_0.json \
    sns_amd.json \
    sns_amd_sw_disabled.json \
    sns_amd_sw_enabled.json \
    sns_aont.json \
    sns_basic_gestures.json \
    sns_bring_to_ear.json \
    sns_ccd.json \
    sns_cm.json \
    sns_dae.json \
    sns_device_orient.json \
    sns_diag_filter.json \
    sns_distance_bound.json \
    sns_dpc.json \
    sns_facing.json \
    sns_fmv.json \
    sns_geomag_rv.json \
    sns_gyro_cal.json \
    sns_mag_cal.json \
    sns_multishake.json \
    sns_pedometer.json \
    sns_rmd.json \
    sns_rotv.json \
    sns_smd.json \
    sns_tilt.json \
    sns_tilt_sw_disabled.json \
    sns_tilt_sw_enabled.json \
    sns_tilt_to_wake.json \
    tmd2725.json \
    tmd3725.json \
    tmx4903.json

# Platform SSC Sensors
PRODUCT_PACKAGES += \
    sdm845_ak991x_0.json \
    sdm845_bmp380_0.json \
    sdm845_lsm6dsm_0.json \
    sdm845_tmd2725.json

# CAMERA
TARGET_USES_64BIT_CAMERA := true

# Look for camera.qcom.so instead of camera.$(BOARD_TARGET_PLATFORM).so
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.camera=qcom

# QCOM Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl-qti \
    android.hardware.bluetooth@1.0-service-qti

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcom.bluetooth.soc=cherokee

# Legacy BT property (will be removed in S)
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.qcom.bluetooth.soc=cherokee

# Audio - Android System
PRODUCT_PROPERTY_OVERRIDES += \
    aaudio.mmap_policy=2 \
    aaudio.mmap_exclusive_policy=2 \
    aaudio.hw_burst_min_usec=2000 \
    af.fast_track_multiplier=1

# Audio - QCOM HAL
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.offload.buffer.size.kb=32

# USB controller setup
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.controller=a600000.dwc3 \
    sys.usb.rndis.func.name=gsi

#WiFi MAC address path
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.wifi.addr_path=/data/vendor/wifi/wlan_mac.bin

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gralloc.disable_ubwc=0 \
    vendor.display.disable_scaler=0

# Display - HDR/WCG
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.dataspace_saturation_matrix=1.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,1.0 \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=2 \
    ro.surface_flinger.use_color_management=true \
    ro.surface_flinger.wcg_composition_dataspace=143261696

# IWLAN
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.iwlan_operation_mode=legacy

$(call inherit-product, device/xiaomi/sdm845-common/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
