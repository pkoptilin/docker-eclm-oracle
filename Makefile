TAG=0.13.2
DOCKER_HOST := tcp://$(shell boot2docker ip):2376
DOCKER_CERT_PATH := $(shell echo ~)/.boot2docker/certs/boot2docker-vm
DOCKER_TLS_VERIFY := 1

build:
        docker build --tag=oracle-eclm .

run:
	export DOCKER_TLS_VERIFY=$(DOCKER_TLS_VERIFY);export DOCKER_HOST=$(DOCKER_HOST);export DOCKER_CERT_PATH=$(DOCKER_CERT_PATH);\
	docker run -d --name oracle oracle-eclm

run-tag:
	export DOCKER_TLS_VERIFY=$(DOCKER_TLS_VERIFY);export DOCKER_HOST=$(DOCKER_HOST);export DOCKER_CERT_PATH=$(DOCKER_CERT_PATH);\
	docker run -d --name oracle oracle-eclm-$(TAG)

run-ext:
	export DOCKER_TLS_VERIFY=$(DOCKER_TLS_VERIFY);export DOCKER_HOST=$(DOCKER_HOST);export DOCKER_CERT_PATH=$(DOCKER_CERT_PATH);\
	docker run -d --name oracle -p 1521:1521 -p 49160:22 oracle-eclm
	
commit:
	export DOCKER_TLS_VERIFY=$(DOCKER_TLS_VERIFY);export DOCKER_HOST=$(DOCKER_HOST);export DOCKER_CERT_PATH=$(DOCKER_CERT_PATH);\
	docker commit 3132192a1260 oracle-eclm-$(TAG)

show:
	export DOCKER_TLS_VERIFY=$(DOCKER_TLS_VERIFY);export DOCKER_HOST=$(DOCKER_HOST);export DOCKER_CERT_PATH=$(DOCKER_CERT_PATH);\
	docker ps;\
	docker logs oracle

clean:
	export DOCKER_TLS_VERIFY=$(DOCKER_TLS_VERIFY);export DOCKER_HOST=$(DOCKER_HOST);export DOCKER_CERT_PATH=$(DOCKER_CERT_PATH);\
	docker stop oracle;\
	docker rm oracle

all:build,run
