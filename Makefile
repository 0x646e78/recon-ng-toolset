SHELL:=/bin/bash
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
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
		--entrypoint "./recon-ng" \
		ectoplasm/recon-ng:$(TAG) $(RSRC)

build:
	@echo $(VER)
	@docker build --rm -t recon-ng:$(VER) -t recon-ng:latest ./docker/.

publish:
	@dockertag recon-ng:$(VER) ectoplasm/recon-ng:latest
	@dockertag recon-ng:$(VER) ectoplasm/recon-ng:$(VER)
	@docker push ectoplasm/recon-ng:$(VER) && docker push ectoplasm/recon-ng:latest
