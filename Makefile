HOOK_CONFIG_FILE?=.pre-commit-pr-hooks.yaml
export HOOK_CONFIG_FILE

all: setup run clean
.PHONY: all

setup:
	@echo Installing pre-commit and linters...
	pip install cfn-lint pre-commit flake8
	pre-commit install

run:
	@echo Running pre-commit hool validation using $(HOOK_CONFIG_FILE)...
	pre-commit clean
	pre-commit run -c $(HOOK_CONFIG_FILE) --all-files

clean:
	@echo Cleaning-up...
	pre-commit clean
