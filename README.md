# central-repo-git-hooks
This is Flux7 Centralized repository for git [pre-commit hooks](https://pre-commit.com/#intro).

## What is git-hooks
Git hooks are scripts that Git executes automaticaly on occurance of events like commit, push, and receive.

## pre-commit tool

### Pre-Requisites
* You need to have the pre-commit package manager [installed](https://pre-commit.com/#install).



### How to use pre-commit

```
create a direcotry for your project repository and and initiliaze the git using git init command.
$ git init
Initialized empty Git repository in /home/kishor_flux7/mywork/testing/.git/

create  .pre-commit-config.yaml file .
$ vi .pre-commit-config.yaml

Add the reference to use this repo and the rev as the brach or git tag , and under hooks list add the hooks you wish to call.
$ cat .pre-commit-config.yaml
- repo: https://github.com/Flux7Labs/central-repo-git-hooks
  rev: master
  hooks:
    - id: terraform-fmt

Run the pre-commit install command to initialize the pre-commit.
$ pre-commit install
pre-commit installed at .git/hooks/pre-commit

Run the following command to test if the pre-commit hook executes.
$ pre-commit run -a
Terraform fmt........................................(no files to check)Skipped

```

### Hooks available
Following are the available hooks -
```
- id: check-readme
  description: Validate for readme file presense
  
- id: validate-author-email
  description: Validate the author flux7 email address
  
- id: terraform-fmt
  description: Runs `terraform fmt` on all Terraform files
  
- id: packer-validate
  description: Runs `packer validate` on all staged packer files
  
- id: cfn-lint
  description: Runs cfn-lint on CloudFormation Templates

- id: flake8-lint
  description: '`flake8` is a command-line utility for enforcing style consistency across Python projects.'

# The below hooks are only required or used by a PR build and not required to be used by developers
- id: prbuild-cfn-lint
  description: Runs cfn-lint on CloudFormation Templates when a pr build is invoked  

```

### Developer - How to trigger hooks validation

The pre-commit hooks from this central-repo-git-hooks repo can be triggered to run against any repository.

- Checkout the code/project repository.

- Change directory to the code/project repository.

- Install and validate the pre-commit hooks with the following command.

  bash <(curl -s https://raw.githubusercontent.com/Flux7Labs/central-repo-git-hooks/blob/master/developer-hooks.sh)
  
  The above command will install the pre-commit and all the other required linters and runs the pre-commit hooks validation on the code/project repository reading the pre-commit [hooks config file](https://github.com/Flux7Labs/central-repo-git-hooks/blob/master/.pre-commit-config.yaml) from this repo.

### How this repo can be used as a part of the Server based PR Builds?

[Makefile](./Makefile) : The makefile is developed as a part of this repository for the flexibility to use the pre-commit hooks as a part of server based pr builds on multiple repositories. For eg At Flux7, this make file is used by a centralized CI System which runs the code linting as a check on all the repositories irrespective of the language used by the code repository
