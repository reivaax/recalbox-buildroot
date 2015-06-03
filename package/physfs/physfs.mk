################################################################################
#
# physfs
#
################################################################################
PHYSFS_VERSION = 2.0.3
PHYSFS_SOURCE = physfs-$(PHYSFS_VERSION).tar.bz2
PHYSFS_SITE =  http://icculus.org/physfs/downloads
PHYSFS_LICENCE = GPL
PHYSFS_DEPENDENCIES = 

define PHYSFS_RPI_FIXUP.in
	$(SED) 's|/opt/vc/include|$(STAGING_DIR)/usr/include|g' $(@D)/CMakeLists.txt
	$(SED) 's|/opt/vc/lib|$(STAGING_DIR)/usr/lib|g' $(@D)/CMakeLists.txt
endef

PHYSFS_PRE_CONFIGURE_HOOKS += PHYSFS_RPI_FIXUP

$(eval $(cmake-package))
