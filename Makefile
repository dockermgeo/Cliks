PWD=$(shell pwd)
SRC_DIR=$(PWD)/src
VAULT_DIR=$(PWD)/src/vault
DOCKER_IMAGE:=dockermgeo/vaultclient
VAULT_VERSION=0.9.0
VAULT_ZIP_FILE:=vault_$(VAULT_VERSION)_linux_amd64.zip

build: prepare
	cd $(PWD)
	docker build -t $(DOCKER_IMAGE) .

prepare:
	mkdie -p $(PWD)/docker_root/usr/local/bin/
	cp -v $(SRC_DIR)/lib/linux.vault $(PWD)/docker_root/usr/local/bin/
	cp -v $(SRC_DIR)/cliks $(PWD)/docker_root/usr/local/bin/
	chmod a+x $(PWD)/docker_root/usr/local/bin/*

download:
	mkdir -p $(VAULT_DIR)
	cd $(VAULT_DIR)
	curl -O https://releases.hashicorp.com/vault/$(VAULT_VERSION)/$(VAULT_ZIP_FILE)
	unzip $(VAULT_ZIP_FILE)
	rm -f $(VAULT_ZIP_FILE)
	mv vault $(SRC_DIR)/lib/linux.vault
	cd $(PWD)
	rm -Rf $(VAULT_DIR)

term:
	docker run -ti  --rm --entrypoint=bash $(DOCKER_IMAGE)

test:
	cd $(SRC_DIR) && npm start
