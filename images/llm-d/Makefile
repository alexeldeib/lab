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

IMAGE_TAG ?= $(shell $(CMD_GIT) describe --tags --match='$(IMAGE_NAME)-v*' || $(CMD_GIT) rev-parse --short HEAD)
IMAGE_TAG := $(IMAGE_TAG:$(IMAGE_NAME)-%=%)


.PHONY: build
build:
    SOURCE_DATE_EPOCH=$(COMMIT_TIMESTAMP) $(CMD_DOCKER_BUILD) $(DOCKER_BUILD_OPTS) . -t $(IMAGE_REPOSITORY):$(IMAGE_TAG)
