ARCH := $(shell uname -m)

CMD_DOCKER ?= depot
ifeq ($(CMD_DOCKER),docker)
CMD_DOCKER_BUILD ?= $(CMD_DOCKER) buildx build
else
CMD_DOCKER_BUILD ?= $(CMD_DOCKER) build
endif
CMD_GIT := git

COMMIT_TIMESTAMP := $(shell $(CMD_GIT) show --no-patch --format=%ct)

IMAGE_NAME := vllm
IMAGE_REPOSITORY := docker.io/alexeldeib/$(IMAGE_NAME)

IMAGE_TAG ?= $(shell $(CMD_GIT) rev-parse --short HEAD)-$(CMD_DOCKER)-src

DOCKER_BUILD_OPTS ?= --platform linux/amd64 --push
MAKEFLAGS := -j3

MAX_JOBS ?= 32
SCCACHE_WEBDAV_ENDPOINT ?= https://cache.depot.dev
SCCACHE_WEBDAV_TOKEN ?= 

all: build

.PHONY: build
build:
	SOURCE_DATE_EPOCH=$(COMMIT_TIMESTAMP) $(CMD_DOCKER_BUILD) \
	--build-arg MAX_JOBS=$(MAX_JOBS) \
	--build-arg SCCACHE_WEBDAV_ENDPOINT=$(SCCACHE_WEBDAV_ENDPOINT) \
	--build-arg SCCACHE_WEBDAV_TOKEN=$(SCCACHE_WEBDAV_TOKEN) \
	$(DOCKER_BUILD_OPTS) . -t $(IMAGE_REPOSITORY):$(IMAGE_TAG)
