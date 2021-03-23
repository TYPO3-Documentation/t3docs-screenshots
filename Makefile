SHELL := /bin/bash

BRANCH ?= $$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

.PHONY: fetch

fetch:
	@echo "Clone manual 'TYPO3CMS-Reference-TCA'"
	@git clone --single-branch --branch 10.4 git@github.com:TYPO3-Documentation/TYPO3CMS-Reference-TCA.git t3docs/TYPO3CMS-Reference-TCA
