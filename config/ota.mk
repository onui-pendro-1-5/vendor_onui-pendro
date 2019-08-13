ifneq ($(IS_GENERIC_SYSTEM_IMAGE), true)
ifeq ($(CUSTOM_BUILD_TYPE), OFFICIAL)

CUSTOM_OTA_VERSION_CODE := pie

CUSTOM_PROPERTIES += \
    org.onui-pendro.ota.version_code=$(CUSTOM_OTA_VERSION_CODE) \
    sys.ota.disable_uncrypt=1

PRODUCT_PACKAGES += \
    Updater

PRODUCT_COPY_FILES += \
    vendor/aosp/config/permissions/org.onui-pendro.ota.xml:system/etc/permissions/org.onui-pendro.ota.xml

endif
endif
