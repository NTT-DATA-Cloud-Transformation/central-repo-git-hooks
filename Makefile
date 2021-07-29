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

all: setup run clean
.PHONY: all

setup:
	@echo Installing pre-commit, terraform and linters...	
	
	pip install pip==20.2.4

	if [[ -f /usr/local/bin/terraform ]]; then \
		echo "terraform already installed"; \
	else \
		if [ $(OSFLAG) == OSX ]; then \
			wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_darwin_amd64.zip -O terraform_binary.zip;\
			unzip terraform_binary.zip;\
			mv ./terraform /usr/local/bin/terraform;\
		elif [ $(OSFLAG) == Linux ]; then \
			wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip -O terraform_binary.zip;\
			unzip terraform_binary.zip;\
			mv -f ./terraform /usr/local/bin/terraform;\
		else \
			echo "Please install the terraform manually in your OS if you want a TF linter with pre-commit"; \
		fi \
	fi \

	if [[ ! -z "$$EVENT_NAME" ]] && [[ "$$EVENT_NAME" == PR ]]; then \
		pip install bc-python-hcl2==0.3.15 cfn-lint==0.47.2 networkx==2.4 pre-commit flake8 flake8-print checkov==1.0.580;\
	else \
		pip install bc-python-hcl2==0.3.15 cfn-lint==0.47.2 networkx==2.4 pre-commit flake8 checkov==1.0.580;\
	fi \
	
	pre-commit install

run:
	@echo Running pre-commit hook validation using $(HOOK_CONFIG_FILE)...
	pre-commit clean

	if [[ ! -z "$$EVENT_NAME" ]] && [[ "$$EVENT_NAME" == PR ]]; then \
		pre-commit run -c $(HOOK_CONFIG_FILE) --from-ref origin/master --to-ref HEAD;\
	else \
		pre-commit run -c $(HOOK_CONFIG_FILE) --all-files;\
	fi \


clean:
	@echo Cleaning-up...
	pre-commit clean
