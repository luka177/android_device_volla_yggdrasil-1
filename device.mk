#
# Copyright (C) 2017 The LineageOS Project
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
#


# Inherit from mt6763-common
$(call inherit-product, device/volla/mt6763-common/mt6763.mk)

$(call inherit-product, vendor/volla/yggdrasil/yggdrasil-vendor.mk)

# setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Light
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.yggdrasil

