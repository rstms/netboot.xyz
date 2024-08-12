
default: upload

build:
	docker build -t localbuild -f Dockerfile .

compile: build
	docker run --rm -it -v $(PWD):/buildout localbuild

upload: compile
	ssh netboot@rigel rm -rf htdocs/*
	scp -rp buildout/* netboot@rigel:htdocs/
	ssh netboot@rigel mv htdocs/ipxe/netboot.xyz.iso htdocs/rstms-netboot.iso
	cp buildout/ipxe/netboot.xyz.iso /mnt/beaker/h/vmware/iso/rstms-netboot.iso

clean:
	rm -rf buildout
