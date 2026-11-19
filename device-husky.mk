#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-FileCopyrightText: 2026 The ExpressiveOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from zuma
include device/google/zuma/common.mk

# Fingerprint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# GPS
PRODUCT_PACKAGES += \
    android.hardware.sensors-V2-ndk.vendor:64

# Overlays
PRODUCT_PACKAGES += \
    FrameworkResOverlayVendorShusky \
    PixelNfcOverlayShusky \
    PixelWifiOverlay2023Shusky \
    SafetyRegulatoryInfoOverlayProductShusky

PRODUCT_PACKAGES += \
    DMServiceOverlayVendorHusky \
    FrameworkResOverlayProductHusky \
    FrameworkResOverlayVendorHusky \
    PixelDisplayServiceOverlayProductHusky \
    PixelNfcOverlayHusky \
    PixelUwbOverlayHK3 \
    SettingsGoogleHuskyOverlay \
    SettingsHuskyOverlay \
    SystemUIGoogleOverlayVendorHusky

# PowerShare
include hardware/google/pixel/eos_powershare/device.mk

# Preinstalled packages
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/sysconfig/preinstalled-packages-prebuilt-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-prebuilt-product.xml \
    $(DEVICE_PATH)/sysconfig/preinstalled-packages-prebuilt-system_ext.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/preinstalled-packages-prebuilt-system_ext.xml

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/sysconfig/preinstalled-packages-prebuilt-thermometer-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-prebuilt-thermometer-product.xml

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop

# Recovery
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.husky.rc

PRODUCT_PACKAGES += \
    init.recovery.husky.touch.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Window extensions
$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# Adaptive Connectivity Services (SCONE) and Google Fi (Tycho)
PRODUCT_PACKAGES += \
    SCONE-v77459 \
    Tycho

# Updates come from denson9874/expressiveos_ota (ExpressiveOS's own feed and keys)
PRODUCT_PACKAGES += \
    UpdaterOverlayHusky

# NFC on after a clean flash, as stock
PRODUCT_PACKAGES += \
    NfcOverlayHusky

# Keep Google Play services from preparing Google's OTAs (sysconfig/disable-google-ota.xml).
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/sysconfig/disable-google-ota.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/disable-google-ota.xml

# Values stock husky (CP3A.261005.005) sets that our build left at the AOSP default
PRODUCT_PACKAGES += \
    FrameworkResOverlayStockHusky \
    MediaProviderOverlayStockHusky \
    SettingsOverlayStockHusky \
    SystemUIOverlayStockHusky \
    WifiOverlayStockHusky

# Wild Kernels' boot (EOS_WILD_BOOT, BoardConfig)
ifneq ($(EOS_WILD_BOOT),)
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false
endif
