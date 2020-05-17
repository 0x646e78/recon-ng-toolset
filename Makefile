SHELL:=/bin/bash
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
TOOLSET_VER = 2
VER:=$$(cat docker/recon-ng/VERSION |grep __version | cut -d\' -f2)
TAG?=latest
R?=

ifeq ($(R),)
	RSRC:=
else
	RSRC:= -r $(R)
endif

run:
	@mkdir -p $(HOME)/.recon-ng/
	@docker run --rm -it \
		-v ~/.recon-ng:/root/.recon-ng \
		-v $(ROOT_DIR)/resources:/recon-ng/resources \
		docker.io/ectoplasm/recon-ng:$(TAG) $(RSRC)

run-dev:
	@mkdir -p $(HOME)/.recon-ng/
	@docker run --rm -it \
		-v ~/.recon-ng:/root/.recon-ng \
		-v $(ROOT_DIR)/resources:/recon-ng/resources \
		recon-ng:$(TAG) $(RSRC)

build:
	@echo "$(VER)-$(TOOLSET_VER)"
	@docker build --rm -t recon-ng:$(VER)-$(TOOLSET_VER) -t recon-ng:latest ./docker/.

publish:
	@docker tag recon-ng:$(VER)-$(TOOLSET_VER) docker.io/ectoplasm/recon-ng:$(VER)
	@docker tag docker.io/ectoplasm/recon-ng:$(VER) docker.io/ectoplasm/recon-ng:latest
	@docker tag docker.io/ectoplasm/recon-ng:$(VER) docker.io/ectoplasm/recon-ng:$(VER)-$(TOOLSET_VER)
	@docker push docker.io/ectoplasm/recon-ng:$(VER)-$(TOOLSET_VER) &&\
  	docker push docker.io/ectoplasm/recon-ng:$(VER) &&\
	 	docker push docker.io/ectoplasm/recon-ng:latest
