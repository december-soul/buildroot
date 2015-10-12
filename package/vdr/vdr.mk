#############################################################
#
# vdr
# depends on wchar and local support of uclibc
#
#############################################################
VDR_VERSION = 2.2.0
VDR_SITE = ftp://ftp.tvdr.de/vdr/
VDR_SOURCE = vdr-$(VDR_VERSION).tar.bz2

PKG_CONFIG = $(BR2_HOST_DIR)/usr/bin/pkg-config

VDR_RPIHDDEVICE_VERSION = master
VDR_RPIHDDEVICE_SITE = http://projects.vdr-developer.org/git/vdr-plugin-rpihddevice.git/snapshot/vdr-plugin-rpihddevice-$(VDR_RPIHDDEVICE_VERSION).tar.gz
VDR_RPIHDDEVICE_SOURCE = vdr-plugin-rpihddevice-$(VDR_RPIHDDEVICE_VERSION).tar.gz

VDR_STREAMDEV_VERSION = master
VDR_STREAMDEV_SITE = http://projects.vdr-developer.org/git/vdr-plugin-streamdev.git/snapshot/vdr-plugin-streamdev-$(VDR_STREAMDEV_VERSION).tar.gz
VDR_STREAMDEV_SOURCE = vdr-plugin-streamdev-$(VDR_STREAMDEV_VERSION).tar.gz

VDR_REMOTETIMERS_VERSION= 1.0.1
VDR_REMOTETIMERS_SITE = http://vdr.schmirler.de/remotetimers/vdr-remotetimers-$(VDR_REMOTETIMERS_VERSION).tgz
VDR_REMOTETIMERS_SOURCE = vdr-remotetimers-$(VDR_REMOTETIMERS_VERSION).tgz

VDR_SVDRPSERVICE_VERSION= 1.0.0
VDR_SVDRPSERVICE_SITE = http://vdr.schmirler.de/svdrpservice/vdr-svdrpservice-$(VDR_SVDRPSERVICE_VERSION).tgz
VDR_SVDRPSERVICE_SOURCE = vdr-svdrpservice-$(VDR_SVDRPSERVICE_VERSION).tgz

VDR_SUSPENDOUTPUT_VERSION= 2.0.0
VDR_SUSPENDOUTPUT_SITE = http://www.vdr-portal.de/index.php
VDR_SUSPENDOUTPUT_SOURCE = vdr-plugin-suspendoutput-$(VDR_SUSPENDOUTPUT_VERSION).tgz

#VDR_SKINDESIGNER_VERSION= 0.5.3
VDR_SKINDESIGNER_VERSION= master
VDR_SKINDESIGNER_SITE= http://projects.vdr-developer.org/git/vdr-plugin-skindesigner.git/snapshot/vdr-plugin-skindesigner-$(VDR_SKINDESIGNER_VERSION).tar.gz
VDR_SKINDESIGNER_SOURCE= vdr-plugin-skindesigner-$(VDR_SKINDESIGNER_VERSION).tar.gz

VDR_CECREMOTE_VERSION= 1.2.0
VDR_CECREMOTE_SITE= http://www.uli-eckhardt.de/vdr/download/vdr-cecremote-${VDR_CECREMOTE_VERSION}.tgz
VDR_CECREMOTE_SOURCE= vdr-cecremote-$(VDR_CECREMOTE_VERSION).tgz


VDR_INSTALL_STAGING = NO
VDR_INSTALL_TARGET = YES
VDR_SECTION = multimedia
VDR_DESCRIPTION = Video Disk Recorder
VDR_DEPENDENCIES = libcap fontconfig freetype gettext libjpeg

define VDR_RPIHDDEVICE_DOWNLOAD
    $(call DOWNLOAD,$(VDR_RPIHDDEVICE_SITE),$(VDR_RPIHDDEVICE_SOURCE))
endef

define VDR_STREAMDEV_DOWNLOAD
    $(call DOWNLOAD,$(VDR_STREAMDEV_SITE),$(VDR_STREAMDEV_SOURCE))
endef

define VDR_REMOTETIMERS_DOWNLOAD
    $(call DOWNLOAD,$(VDR_REMOTETIMERS_SITE),$(VDR_REMOTETIMERS_SOURCE))
endef

define VDR_SVDRPSERVICE_DOWNLOAD
    $(call DOWNLOAD,$(VDR_SVDRPSERVICE_SITE),$(VDR_SVDRPSERVICE_SOURCE))
endef

define VDR_SUSPENDOUTPUT_DOWNLOAD
    $(call DOWNLOAD,$(VDR_SUSPENDOUTPUT_SITE),$(VDR_SUSPENDOUTPUT_SOURCE))
endef

define VDR_SKINDESIGNER_DOWNLOAD
    $(call DOWNLOAD,$(VDR_SKINDESIGNER_SITE),$(VDR_SKINDESIGNER_SOURCE))
endef

define VDR_CECREMOTE_DOWNLOAD
    $(call DOWNLOAD,$(VDR_CECREMOTE_SITE),$(VDR_CECREMOTE_SOURCE))
endef

define VDR_RPIHDDEVICE_EXTRACT
    mkdir -p $(VDR_DIR)/PLUGINS/src/rpihddevice
    $(if $(VDR_RPIHDDEVICE_SOURCE),$(INFLATE$(suffix $(VDR_RPIDHDEVICE_SOURCE))) \
	$(TAR) --strip-components=1 -C $(VDR_DIR)/PLUGINS/src/rpihddevice -xvzf $(DL_DIR)/$(VDR_RPIHDDEVICE_SOURCE) )
endef

define VDR_STREAMDEV_EXTRACT
    set -x
    mkdir -p $(VDR_DIR)/PLUGINS/src/streamdev
    $(if $(VDR_STREAMDEV_SOURCE),$(INFLATE$(suffix $(VDR_STREAMDEV_SOURCE))) \
     echo "" || tar --strip-components=1 -C $(VDR_DIR)/PLUGINS/src/streamdev -xvzf $(DL_DIR)/$(VDR_STREAMDEV_SOURCE) )
    set +x
endef

define VDR_REMOTETIMERS_EXTRACT
    set -x
    mkdir -p $(VDR_DIR)/PLUGINS/src/remotetimers
    $(if $(VDR_REMOTETIMERS_SOURCE),$(INFLATE$(suffix $(VDR_REMOTETIMERS_SOURCE))) \
        echo "" || $(TAR) --strip-components=1 -C $(VDR_DIR)/PLUGINS/src/remotetimers -xvzf $(DL_DIR)/$(VDR_REMOTETIMERS_SOURCE) )
    set +x
endef
 
define VDR_SVDRPSERVICE_EXTRACT
    set -x
    mkdir -p $(VDR_DIR)/PLUGINS/src/svdrpservice
    $(if $(VDR_SVDRPSERVICE_SOURCE),$(INFLATE$(suffix $(VDR_SVDRPSERVICE_SOURCE))) \
        echo "" || $(TAR) -C $(VDR_DIR)/PLUGINS/src/svdrpservice -xvzf $(DL_DIR)/$(VDR_SVDRPSERVICE_SOURCE) )
    set +x
endef

define VDR_SUSPENDOUTPUT_EXTRACT
    set -x
    mkdir -p $(VDR_DIR)/PLUGINS/src/suspendoutput
    $(if $(VDR_SUSPENDOUTPUT_SOURCE),$(INFLATE$(suffix $(VDR_SUSPENDOUTPUT_SOURCE))) \
        echo "" || $(TAR) -C $(VDR_DIR)/PLUGINS/src/suspendoutput -xvzf $(DL_DIR)/$(VDR_SUSPENDOUTPUT_SOURCE))
    set +x
endef

define VDR_SKINDESIGNER_EXTRACT
    mkdir -p $(VDR_DIR)/PLUGINS/src/skindesigner
    $(if $(VDR_SKINDESIGNER_SOURCE),$(INFLATE$(suffix $(VDR_SKINDESIGNER_SOURCE))) zcat $(DL_DIR)/$(VDR_SKINDESIGNER_SOURCE) | \
        $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(VDR_DIR)/PLUGINS/src/skindesigner $(TAR_OPTIONS) -)
endef

define VDR_CECREMOTE_EXTRACT
    mkdir -p $(VDR_DIR)/PLUGINS/src/cecremote
    $(if $(VDR_CECREMOTE_SOURCE),$(INFLATE$(suffix $(VDR_CECREMOTE_SOURCE))) zcat $(DL_DIR)/$(VDR_CECREMOTE_SOURCE) | \
        $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(VDR_DIR)/PLUGINS/src/cecremote $(TAR_OPTIONS) -)
endef


define VDR_RPIHDDEVICE_POST_PATCH
    sed -i -e 's|/opt/vc/|/usr/|g' $(VDR_DIR)/PLUGINS/src/rpihddevice/Makefile
endef

define VDR_STREAMDEV_POST_PATCH
    #sed -i -r 's|-C ./client install|DESTDIR=$$\(DESTDIR\) -C ./client install|g' $(VDR_DIR)/PLUGINS/src/streamdev/Makefile
    sed -i -r 's|LIBDIR := |#LIBDIR := |g' $(VDR_DIR)/PLUGINS/src/streamdev/Makefile
endef

define VDR_REMOTETIMERS_POST_PATCH
# patch -d $(VDR_DIR) -i MainMenuHooks-v1_0_3.diff
 patch -d $(VDR_DIR)/PLUGINS/src/remotetimers/ -i $(DL_DIR)/remotetimers-vdr2.1.2compat.diff
endef

define VDR_SUSPENDOUTPUT_POST_PATCH
    sed -i 's/$$(CC) mpg2c.c/gcc mpg2c.c/g' $(VDR_DIR)/PLUGINS/src/suspendoutput/Makefile
    rm -f $(VDR_DIR)/PLUGINS/src/suspendoutput/mpg2c
endef

ifeq ($(BR2_PACKAGE_VDR_RPIHDDEVICE),y)
VDR_POST_DOWNLOAD_HOOKS += VDR_RPIHDDEVICE_DOWNLOAD
VDR_POST_EXTRACT_HOOKS += VDR_RPIHDDEVICE_EXTRACT  
VDR_POST_PATCH_HOOKS += VDR_RPIHDDEVICE_POST_PATCH
VDR_DEPENDENCIES += ffmpeg rpi-userland
TARGET_CONFIGURE_OPTS += SDKSTAGE=$(STAGING_DIR)
endif

ifeq ($(BR2_PACKAGE_VDR_STREAMDEV),y)
VDR_POST_DOWNLOAD_HOOKS += VDR_STREAMDEV_DOWNLOAD
VDR_POST_EXTRACT_HOOKS += VDR_STREAMDEV_EXTRACT  
VDR_POST_PATCH_HOOKS += VDR_STREAMDEV_POST_PATCH
endif

ifeq ($(BR2_PACKAGE_VDR_REMOTETIMERS),y)
VDR_POST_DOWNLOAD_HOOKS += VDR_REMOTETIMERS_DOWNLOAD
VDR_POST_EXTRACT_HOOKS += VDR_REMOTETIMERS_EXTRACT  
VDR_POST_PATCH_HOOKS += VDR_REMOTETIMERS_POST_PATCH
endif

ifeq ($(BR2_PACKAGE_VDR_SVDRPSERVICE),y)
VDR_POST_DOWNLOAD_HOOKS += VDR_SVDRPSERVICE_DOWNLOAD
VDR_POST_EXTRACT_HOOKS += VDR_SVDRPSERVICE_EXTRACT  
#VDR_POST_PATCH_HOOKS += VDR_SVDRPSERVICE_POST_PATCH
endif

ifeq ($(BR2_PACKAGE_VDR_SUSPENDOUTPUT),y)
VDR_POST_DOWNLOAD_HOOKS += VDR_SUSPENDOUTPUT_DOWNLOAD
VDR_POST_EXTRACT_HOOKS += VDR_SUSPENDOUTPUT_EXTRACT  
VDR_POST_PATCH_HOOKS += VDR_SUSPENDOUTPUT_POST_PATCH  
endif

ifeq ($(BR2_PACKAGE_VDR_SKINDESIGNER),y)
VDR_POST_DOWNLOAD_HOOKS += VDR_SKINDESIGNER_DOWNLOAD
VDR_POST_EXTRACT_HOOKS += VDR_SKINDESIGNER_EXTRACT  
endif

ifeq ($(BR2_PACKAGE_VDR_CECREMOTE),y)
VDR_POST_DOWNLOAD_HOOKS += VDR_CECREMOTE_DOWNLOAD
VDR_POST_EXTRACT_HOOKS += VDR_CECREMOTE_EXTRACT  
endif

define VDR_REMOVE_SKINCURSES
    rm -rf $(VDR_DIR)/PLUGINS/src/skincurses
endef

define VDR_MAKE_CONF
  echo 'CFLAGS += -O0 -g' > $(VDR_DIR)/Make.config
  echo 'CXXFLAGS += -O0 -g' >> $(VDR_DIR)/Make.config
  echo 'PREFIX = /usr' >> $(VDR_DIR)/Make.config
  echo 'LIBDIR = /usr/lib/vdr/plugins' >> $(VDR_DIR)/Make.config
  echo 'VDR_USER = vdr' >> $(VDR_DIR)/Make.config
#  echo 'LIBS += -lintl' >> $(VDR_DIR)/Make.config
  echo 'LIRC_DEVICE = /run/lirc/lircd' >> $(VDR_DIR)/Make.config
  echo 'CACHEDIR  = /var/cache/vdr' >> $(VDR_DIR)/Make.config
  echo 'CONFDIR = /etc/vdr' >> $(VDR_DIR)/Make.config
  echo 'PLGCFG = /etc/vdr/plugins' >> $(VDR_DIR)/Make.config
endef

VDR_POST_PATCH_HOOKS += VDR_REMOVE_SKINCURSES VDR_MAKE_CONF

define VDR_BUILD_CMDS
    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) 
#    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) plugins
endef

define VDR_INSTALL_TARGET_CMDS
	set -x
    echo install vdr
    #$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) install
    #$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) 
    DESTDIR=$(TARGET_DIR) VIDEODIR=/var/lib/video.00 CONFDIR=$(TARGET_DIR)/etc/vdr CACHEDIR=$(TARGET_DIR)/var/cache/vdr $(MAKE1) -C $(@D) install
    #DESTDIR=$(TARGET_DIR) VIDEODIR=$(TARGET_DIR)/video CONFDIR=$(TARGET_DIR)/etc/vdr CACHEDIR=$(TARGET_DIR)/var/cache/vdr $(MAKE1) -C $(@D) install-plugins
    $(INSTALL) -D -m 755 package/vdr/setup.conf $(TARGET_DIR)/etc/vdr/
    $(INSTALL) -D -m 755 package/vdr/channels.conf $(TARGET_DIR)/etc/vdr/
    $(INSTALL) -D -m 755 package/vdr/remote.conf  $(TARGET_DIR)/etc/vdr/
    $(INSTALL) -D -m 755 package/vdr/commands.conf  $(TARGET_DIR)/etc/vdr/
    $(INSTALL) -D -m 755 package/vdr/svdrpsend.sh $(TARGET_DIR)/usr/bin/
    $(INSTALL) -D -m 755 package/vdr/detect_streamdevserver.sh $(TARGET_DIR)/usr/bin/
    $(INSTALL) -D -m 755 package/vdr/get_channelsconf.sh $(TARGET_DIR)/usr/bin/
    mkdir -p $(TARGET_DIR)/usr/share/fonts/VDROpenSans/
    #$(INSTALL) -D -m 755 $(VDR_DIR)/PLUGINS/src/skindesigner/fonts/VDROpenSans/*  $(TARGET_DIR)/usr/share/fonts/VDROpenSans/
    mkdir -p $(TARGET_DIR)/var/lib/video.00/
	set +x
endef


define VDR_INSTALL_INIT_SYSV
        $(INSTALL) -D -m 755 package/vdr/S50vdr \
                $(TARGET_DIR)/etc/init.d/S50vdr
endef

$(eval $(generic-package))
