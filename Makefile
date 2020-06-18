define install_terraform
	if [ "$(uname)" == "Darwin" ];
	then
	    wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_darwin_amd64.zip -O terraform_binary.zip
		unzip terraform_binary.zip
		mv ./terraform /usr/local/bin/terraform
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ];
	then
	    wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip -O terraform_binary.zip
		unzip terraform_binary.zip
		mv ./terraform /usr/local/bin/terraform
	fi
endef


HOOK_CONFIG_FILE?=.pre-commit-pr-hooks.yaml
export HOOK_CONFIG_FILE

all: setup run clean
.PHONY: all

setup:
	@echo Installing pre-commit and linters...
	$(install_terraform run)
	pip install cfn-lint pre-commit flake8
	pre-commit install

run:
	@echo Running pre-commit hook validation using $(HOOK_CONFIG_FILE)...
	pre-commit clean
	pre-commit run -c $(HOOK_CONFIG_FILE) --all-files

clean:
	@echo Cleaning-up...
	pre-commit clean
