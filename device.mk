#
# Copyright (C) 2011 The Android Open-Source Project
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


PRODUCT_COPY_FILES := \
	device/ti/beagleboneblack/init.genericam33xx(flatteneddevicetr.rc:root/init.genericam33xx(flatteneddevicetr.rc \
	device/ti/beagleboneblack/init.genericam33xx(flatteneddevicetr.usb.rc:root/init.genericam33xx(flatteneddevicetr.usb.rc \
	device/ti/beagleboneblack/vold.fstab:system/etc/vold.fstab \
	device/ti/beagleboneblack/fstab.genericam33xx(flatteneddevicetr:root/fstab.genericam33xx(flatteneddevicetr \
	device/ti/beagleboneblack/ueventd.genericam33xx(flatteneddevicetr.rc:root/ueventd.genericam33xx(flatteneddevicetr.rc \
	device/ti/beagleboneblack/media_codecs.xml:system/etc/media_codecs.xml \
	device/ti/beagleboneblack/media_profiles.xml:system/etc/media_profiles.xml \
	device/ti/beagleboneblack/mixer_paths.xml:system/etc/mixer_paths.xml \
	device/ti/beagleboneblack/audio_policy.conf:system/etc/audio_policy.conf

# KeyPads
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/ti-tsc.idc:system/usr/idc/ti-tsc.idc

# BBBAndroid - Since the users keep asking for GPIO key mappings for the
# various LCDs (which enumerate in a variety of values), I'm just going
# to copy links to the base one a bunch of times and hope for the best.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gpio_keys_10.kl:system/usr/keylayout/gpio_keys_10.kl \
    $(LOCAL_PATH)/gpio_keys_11.kl:system/usr/keylayout/gpio_keys_11.kl \
    $(LOCAL_PATH)/gpio_keys_12.kl:system/usr/keylayout/gpio_keys_12.kl \
    $(LOCAL_PATH)/gpio_keys_13.kl:system/usr/keylayout/gpio_keys_13.kl \
    $(LOCAL_PATH)/gpio_keys_14.kl:system/usr/keylayout/gpio_keys_14.kl \
    $(LOCAL_PATH)/gpio_keys_15.kl:system/usr/keylayout/gpio_keys_15.kl \
    $(LOCAL_PATH)/gpio_keys_16.kl:system/usr/keylayout/gpio_keys_16.kl

PRODUCT_PROPERTY_OVERRIDES := \
       hwui.render_dirty_regions=false

# Explicitly specify dpi, otherwise the icons don't show up correctly with SGX enabled
PRODUCT_PROPERTY_OVERRIDES += \
       ro.sf.lcd_density=160

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.strictmode.visual=0 \
	persist.sys.strictmode.disable=1

PRODUCT_CHARACTERISTICS := tablet,nosdcard

DEVICE_PACKAGE_OVERLAYS := \
    device/ti/beagleboneblack/overlay

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

PRODUCT_PACKAGES += \
	libaudioutils

PRODUCT_PACKAGES += \
        audio.primary.beagleboneblack \
        tinycap \
        tinymix \
        tinyplay

PRODUCT_PACKAGES += \
	dhcpcd.conf

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs

# Backlight HAL (liblights)
PRODUCT_PACKAGES += \
	lights.beagleboneblack

PRODUCT_PACKAGES += \
	FileManager-1.1.6

PRODUCT_PACKAGES += \
	androidvncserver

PRODUCT_PACKAGES += \
	camera.omap3

# BBBAndroid - Additional external packages
PRODUCT_PACKAGES += \
        i2c-tools \
        dropbear

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
