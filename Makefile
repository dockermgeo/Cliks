######
PWD=$(shell pwd)
SRC_DIR=$(PWD)/src
DOWNLOAD_DIR=$(SRC_DIR)/download
DOCKER_DIR=$(PWD)/docker_root
#
DOCKER_IMAGE:=dockermgeo/vaultclient
######

install: install.linux

install.linux: download.vault download.clireds
	@echo "Building on LINUX!!!"
	mkdir -p /usr/local/bin
	mkdir -p /usr/share
	cp -v $(DOWNLOAD_DIR)/vault /usr/local/bin/
	cp -v $(DOWNLOAD_DIR)/clireds /usr/local/bin/
	cp -Rv $(SRC_DIR)/cliks /usr/share/
	chmod -Rv a+x /usr/share/cliks/*
	ln -s /usr/share/cliks/cliks /usr/local/bin/
	chmod a+x /usr/local/bin/*

docker.build: prepare
	@echo "Docker build"
	cd $(PWD)
	docker build -t $(DOCKER_IMAGE) .

prepare: download.vault download.clireds
	@echo "Prepare Build"
	mkdir -p $(DOCKER_DIR)/usr/local/bin
	mkdir -p $(DOCKER_DIR)/usr/share
	cp -v $(DOWNLOAD_DIR)/vault $(DOCKER_DIR)/usr/local/bin/
	cp -v $(DOWNLOAD_DIR)/clireds $(DOCKER_DIR)/usr/local/bin/
	cp -Rv $(SRC_DIR)/cliks $(DOCKER_DIR)/usr/share/
	chmod -Rv a+x $(DOCKER_DIR)/usr/share/cliks/*
	cp -v $(DOCKER_DIR)/usr/share/cliks/cliks $(DOCKER_DIR)/usr/local/bin/
	chmod a+x $(DOCKER_DIR)/usr/local/bin/*

download.vault:
	mkdir -p $(DOWNLOAD_DIR)
	#curl -O https://github.com/dockermgeo/libshare/blob/master/keystore_clients/clivaults/vault-Linux
	curl -O https://releases.hashicorp.com/vault/0.9.0/vault_0.9.0_linux_amd64.zip
	unzip vault_0.9.0_linux_amd64.zip
	rm vault_0.9.0_linux_amd64.zip
	mv vault $(DOWNLOAD_DIR)/vault
	chmod a+x $(DOWNLOAD_DIR)/vault


download.clireds:
		curl -O https://github.com/dockermgeo/libshare/blob/master/keystore_clients/clireds/clireds-Linux
		mv clireds-Linux $(DOWNLOAD_DIR)/clireds
		chmod a+x $(DOWNLOAD_DIR)/clireds


term:
	docker run -ti  -e VAULT_TOKEN=token123 -e VAULT_ADDR=http://vaultserver:8200 --rm --entrypoint=bash $(DOCKER_IMAGE)
