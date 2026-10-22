include $(TOPDIR)/rules.mk
PKG_NAME:=demo-app
PKG_VERSION:=@VERSION@
PKG_RELEASE:=@REVISION@
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
include $(INCLUDE_DIR)/package.mk

define Package/demo-app
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=demo-app canonical CI experiment
  DEPENDS:=+demo-core
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) $(TOPDIR)/recipes/demo-app/src/. $(PKG_BUILD_DIR)/
endef

define Build/Compile
	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(PKG_BUILD_DIR)/app.c -ldemo-core -o $(PKG_BUILD_DIR)/demo-app
endef

define Package/demo-app/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/demo-app $(1)/usr/bin/
endef

$(eval $(call BuildPackage,demo-app))
