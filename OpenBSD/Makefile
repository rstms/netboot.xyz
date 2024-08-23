major = 7
minor = 5
arch = amd64

src = install$(major)$(minor).img
dst = netboot$(major)$(minor).img
installurl != cat /etc/installurl

src_img="$base_dir/pub/OpenBSD/$version/$arch/${src_image_name}${label}.img"
dst_img="$base_dir/pub/OpenBSD/$version/$arch/netboot${label}.img"


$(dst): $(src)
	doas ./mkautoinstallimg $(src) $@
	doas chown $(USER).$(USER) $@

$(src):
	ftp $(installurl)/$(major).$(minor)/$(arch)/$(src)

install: $(dst)
	cp $(dst) /var/www/htdocs/pub/OpenBSD/$(major).$(minor)/$(arch)/$(dst)

clean:
	rm -f $(dst)
