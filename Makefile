
default: upload

build:
	docker build -t localbuild -f Dockerfile .

compile: build
	docker run --rm -it -v $(PWD):/buildout localbuild

upload: compile
	ssh netboot@rigel rm -rf htdocs/*
	scp -rp buildout/* netboot@rigel:htdocs/
	cp buildout/ipxe/netboot.xyz.iso /mount/beaker/h/vmware/iso/netboot.iso

clean:
	rm -rf buildout
