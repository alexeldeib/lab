ARCH := $(shell uname -m)

CMD_DOCKER ?= depot
ifeq ($(CMD_DOCKER),docker)
CMD_DOCKER_BUILD ?= $(CMD_DOCKER) buildx build
else
CMD_DOCKER_BUILD ?= $(CMD_DOCKER) build
endif
CMD_GIT := git

COMMIT_TIMESTAMP := $(shell $(CMD_GIT) show --no-patch --format=%ct)

IMAGE_NAME := llm-d
IMAGE_REPOSITORY := docker.io/alexeldeib/$(IMAGE_NAME)

BASE_IMAGE ?= ghcr.io/llm-d/llm-d
BASE_TAG ?= 0.0.8
IMAGE_TAG ?= $(BASE_TAG)-$(shell $(CMD_GIT) rev-parse --short HEAD)

DOCKER_BUILD_OPTS ?= --platform linux/amd64,linux/arm64 --push

MAKEFLAGS := -j3

all: build

.PHONY: build
build:
	SOURCE_DATE_EPOCH=$(COMMIT_TIMESTAMP) $(CMD_DOCKER_BUILD) \
	--build-arg BASE_IMAGE=$(BASE_IMAGE) \
	--build-arg BASE_TAG=$(BASE_TAG) \
	$(DOCKER_BUILD_OPTS) . -t $(IMAGE_REPOSITORY):$(IMAGE_TAG)
