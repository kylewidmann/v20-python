SHELL := /bin/bash -e -o pipefail
PROJECT ?= v20-python
BRANCH_NAME ?= local
BUILD_NUMBER ?= 0
IMAGE ?= ${PROJECT}:${BRANCH_NAME}-${BUILD_NUMBER}
COMPOSE_FILE=docker/docker-compose.yaml
COMPOSE_BASE_FILE=docker/docker-compose.base.yaml
DC=docker-compose -p ${PROJECT} -f ${COMPOSE_FILE} -f ${COMPOSE_BASE_FILE}
SERVICE := v20
POETRY ?= "poetry"
VERSION := $(shell head VERSION | grep -Eo "\d+.\d+.\d+")

.DEFAULT_GOAL := help

.EXPORT_ALL_VARIABLES:

include makefiles/development.mk
include makefiles/help.mk
include makefiles/lint.mk
include makefiles/local.mk
include makefiles/test.mk