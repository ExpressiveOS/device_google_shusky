#
# SPDX-FileCopyrightText: 2026 The ExpressiveOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit ExpressiveOS common configuration
$(call inherit-product, vendor/expressiveos/config/common.mk)

# Inherit device configuration
DEVICE_CODENAME := husky
DEVICE_PATH := device/google/shusky
VENDOR_PATH := vendor/google/husky
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := eos_$(DEVICE_CODENAME)
PRODUCT_SYSTEM_BRAND := google
PRODUCT_SYSTEM_MANUFACTURER := Google
PRODUCT_SYSTEM_NAME := generic_system_google

# ExpressiveOS overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay-expressiveos

# Boot animation
TARGET_SCREEN_HEIGHT := 2992
TARGET_SCREEN_WIDTH := 1344

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="husky-user 17 CP3A.261005.005 16271449 release-keys" \
    BuildSystemDesc="generic_system_google-user 17 CP3A.261005.005 16271449 release-keys" \
    BuildFingerprint=google/husky/husky:17/CP3A.261005.005/16271449:user/release-keys \
    BuildSystemFingerprint=google/generic_system_google/generic:17/CP3A.261005.005/16271449:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/app/GoogleExtShared/% \
    system/app/GooglePrintRecommendationService/% \
    system/priv-app/DocumentsUIGoogle/% \
    system/priv-app/GooglePackageInstaller/% \
    system/priv-app/TagGoogle/%

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
