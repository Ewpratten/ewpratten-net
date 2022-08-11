# Base args for any Alpine ISO we might want to create
MKIMAGE_BASE_ARGS= --repository http://dl-cdn.alpinelinux.org/alpine/v3.16/main --extra-repository http://dl-cdn.alpinelinux.org/alpine/v3.16/community --outdir /iso --workdir /iso_work

# Builds the router ISO
iso/alpine-erl-x86_64.iso: config/mkimg/mkimg.erl.sh docker-image.sha
	mkdir -p iso
	docker run --rm \
		-v $(CURDIR)/config/mkimg/mkimg.erl.sh:/root/aports/scripts/mkimg.erl.sh \
		-v $(CURDIR)/iso:/iso \
		-v $(CURDIR)/workdir:/iso_work \
		os_build_env \
		/bin/sh /root/aports/scripts/mkimage.sh $(MKIMAGE_BASE_ARGS) --arch x86_64 --profile erl
	mv -f iso/alpine-erl-*-x86_64.iso iso/alpine-erl-x86_64.iso

# Builds the docker image for generating ISOs and sticks the container hash in a file to prevent unneeded rebuitls
docker-image.sha: build_env/Dockerfile
	docker build -t os_build_env -f ./build_env/Dockerfile .
	docker images --no-trunc --quiet os_build_env > docker-image.sha

clean:
	rm -rf iso