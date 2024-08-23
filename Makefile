upload: compile
	scp buildout/index.html netboot@rigel:htdocs
	scp menu.ipxe netboot@rigel:htdocs
	scp buildout/rstms* netboot@rigel:htdocs
	scp buildout/ipxe/netboot.xyz.iso netboot@rigel:htdocs/rstms-netboot.iso
	cp buildout/ipxe/netboot.xyz.iso /mnt/beaker/h/vmware/iso/rstms-netboot.iso

build:
	docker build -t localbuild -f Dockerfile .

compile:
	docker run --rm -it -v $(PWD):/buildout localbuild

clean:
	rm -rf buildout
