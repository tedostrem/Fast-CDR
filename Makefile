DEB := fastcdr.deb
ARTIFACTS_DIR := artifacts/usr/local
LIB_OUTPUT := ${ARTIFACTS_DIR}/lib/libfastcdr.so

.PHONY : arm build clean deb

build : ${LIB_OUTPUT}

${LIB_OUTPUT} :
	mkdir -p build
	cd build && cmake -DCMAKE_TOOLCHAIN_FILE=../arm-gnueabi.toolchain.cmake -DCMAKE_INSTALL_PREFIX:PATH=/build/${ARTIFACTS_DIR} -DTHIRDPARTY=ON .. && make && make install
	sudo chown -R ${HOST_USER}:${HOST_GROUP} .

arm : 
	docker run -it --rm \
		-v $(shell pwd):/build \
		-e HOST_USER=$(shell id -u) \
		-e HOST_GROUP=$(shell id -g) \
		vincross/xcompile \
		/bin/sh -c "cd /build && make build deb"

deb : ${DEB}

${DEB} : ${LIB_OUTPUT}
	fpm -a armhf -f -s dir -t deb --deb-no-default-config-files -C artifacts --name fastcdr --version $(shell git rev-parse --short HEAD) --iteration 1 --description "Fast-CDR" -p ${DEB} .
	sudo chown -R ${HOST_USER}:${HOST_GROUP} .

clean :
	rm -frv build artifacts
