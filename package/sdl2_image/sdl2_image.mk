################################################################################
#
# sdl2_image
#
################################################################################

SDL2_IMAGE_VERSION = 2.0.0
SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
SDL2_IMAGE_SITE = www.libsdl.org/projects/SDL_image/release/
SDL2_IMAGE_INSTALL_STAGING = YES
SDL2_IMAGE_LICENSE = zlib
SDL2_IMAGE_LICENSE_FILES = COPYING

SDL2_IMAGE_CONF_OPTS = \
	--with-sdl2-prefix=$(STAGING_DIR)/usr \
	--with-sdl2-exec-prefix=$(STAGING_DIR)/usr \
	--disable-sdl2test \
	--disable-static \
	--enable-bmp=$(if $(BR2_PACKAGE_SDL2_IMAGE_BMP),yes,no) \
	--enable-gif=$(if $(BR2_PACKAGE_SDL2_IMAGE_GIF),yes,no) \
	--enable-jpg=$(if $(BR2_PACKAGE_SDL2_IMAGE_JPEG),yes,no) \
	--enable-lbm=$(if $(BR2_PACKAGE_SDL2_IMAGE_LBM),yes,no) \
	--enable-pcx=$(if $(BR2_PACKAGE_SDL2_IMAGE_PCX),yes,no) \
	--enable-png=$(if $(BR2_PACKAGE_SDL2_IMAGE_PNG),yes,no) \
	--enable-pnm=$(if $(BR2_PACKAGE_SDL2_IMAGE_PNM),yes,no) \
	--enable-tga=$(if $(BR2_PACKAGE_SDL2_IMAGE_TARGA),yes,no) \
	--enable-tif=$(if $(BR2_PACKAGE_SDL2_IMAGE_TIFF),yes,no) \
	--enable-webp=$(if $(BR2_PACKAGE_SDL2_IMAGE_WEBP),yes,no) \
	--enable-xcf=$(if $(BR2_PACKAGE_SDL2_IMAGE_XCF),yes,no) \
	--enable-xpm=$(if $(BR2_PACKAGE_SDL2_IMAGE_XPM),yes,no) \
	--enable-xv=$(if $(BR2_PACKAGE_SDL2_IMAGE_XV),yes,no) \

SDL2_IMAGE_DEPENDENCIES = sdl2 \
	$(if $(BR2_PACKAGE_SDL2_IMAGE_JPEG),jpeg) \
	$(if $(BR2_PACKAGE_SDL2_IMAGE_PNG),libpng) \
	$(if $(BR2_PACKAGE_SDL2_IMAGE_TIFF),tiff) \
	$(if $(BR2_PACKAGE_SDL2_IMAGE_WEBP),webp)

HOST_SDL2_IMAGE_CONF_OPTS = \
	--with-sdl2-prefix=$(HOST_DIR)/usr \
	--with-sdl2-exec-prefix=$(HOST_DIR)/usr \
	--disable-sdl2test \
	--disable-static \
	--disable-jpg-shared \
	--disable-png-shared \
	--disable-tif-shared \

HOST_SDL2_IMAGE_DEPENDENCIES = host-libjpeg host-libpng host-sdl

$(eval $(autotools-package))
$(eval $(host-autotools-package))
