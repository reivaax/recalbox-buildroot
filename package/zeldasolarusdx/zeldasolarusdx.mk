################################################################################
#
# Zelda Solarus dx
#
################################################################################
ZELDASOLARUSDX_VERSION = 1.4.1
ZELDASOLARUSDX_SOURCE = v$(ZELDASOLARUSDX_VERSION).tar.gz
ZELDASOLARUSDX_SITE = https://github.com/christopho/solarus/archive
ZELDASOLARUSDX_LICENCE = GPL
ZELDASOLARUSDX_DEPENDENCIES = libpthread-stubs sdl2 sdl2_image sdl2_ttf openal vorbis-tools modplugtools lua physfs

define ZELDASOLARUSDX_RPI_FIXUP.in
	$(SED) 's|/opt/vc/include|$(STAGING_DIR)/usr/include|g' $(@D)/CMakeLists.txt
	$(SED) 's|/opt/vc/lib|$(STAGING_DIR)/usr/lib|g' $(@D)/CMakeLists.txt
endef

ZELDASOLARUSDX_PRE_CONFIGURE_HOOKS += ZELDASOLARUSDX_RPI_FIXUP

$(eval $(cmake-package))
