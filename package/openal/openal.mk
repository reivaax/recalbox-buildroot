################################################################################
#
# openal
#
################################################################################
OPENAL_VERSION = 1.15.1
OPENAL_SOURCE = openal-soft-$(OPENAL_VERSION).tar.gz
OPENAL_SITE = https://github.com/JogAmp/openal-soft/archive
OPENAL_LICENCE = GPL
OPENAL_DEPENDENCIES = 

define OPENAL_RPI_FIXUP.in
	$(SED) 's|/opt/vc/include|$(STAGING_DIR)/usr/include|g' $(@D)/CMakeLists.txt
	$(SED) 's|/opt/vc/lib|$(STAGING_DIR)/usr/lib|g' $(@D)/CMakeLists.txt
endef

OPENAL_PRE_CONFIGURE_HOOKS += OPENAL_RPI_FIXUP

$(eval $(cmake-package))
