OSFLAG 				:=
ifeq ($(OS),Windows_NT)
	OSFLAG += -D WIN32
	ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
		OSFLAG += -D AMD64
	endif
	ifeq ($(PROCESSOR_ARCHITECTURE),x86)
		OSFLAG += -D IA32
	endif
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		OSFLAG = LINUX
	endif
	ifeq ($(UNAME_S),Darwin)
		OSFLAG = OSX
	endif
endif


HOOK_CONFIG_FILE?=.pre-commit-pr-hooks.yaml
export HOOK_CONFIG_FILE

all: setup
all: setup run clean
.PHONY: all

setup:
	@echo Installing pre-commit, terraform and linters...	
	
	ifeq ($(OSFLAG), OSX)
		$(shell wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_darwin_amd64.zip -O terraform_binary.zip)
		$(shell unzip terraform_binary.zip)
		$(shell sudo mv ./terraform /usr/local/bin/terraform)
	else
		$(shell wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip -O terraform_binary.zip)
		$(shell unzip terraform_binary.zip)
		$(shell sudo mv ./terraform /usr/local/bin/terraform)
	endif

	pip install cfn-lint pre-commit flake8
	pre-commit install

run:
	@echo Running pre-commit hook validation using $(HOOK_CONFIG_FILE)...
	pre-commit clean
	pre-commit run -c $(HOOK_CONFIG_FILE) --all-files

clean:
	@echo Cleaning-up...
	pre-commit clean
