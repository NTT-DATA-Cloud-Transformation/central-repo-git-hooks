# central-repo-git-hooks
This is Flux7 Centralized repository for git [pre-commit hooks](https://pre-commit.com/#intro).

## What is git-hooks
Git hooks are scripts that Git executes automaticaly on occurance of events like commit, push, and receive.

## pre-commit tool

### Pre-Requisites
### How to use pre-commit

```
$git init
Initialized empty Git repository in /home/kishor_flux7/mywork/testing/.git/

$vi .pre-commit-config.yaml

$cat .pre-commit-config.yaml
- repo: https://github.com/Flux7Labs/central-repo-git-hooks
  rev: master
  hooks:
    - id: terraform-fmt

$pre-commit install
pre-commit installed at .git/hooks/pre-commit

$pre-commit run -a
Terraform fmt........................................(no files to check)Skipped

```

### Hooks available
Following are the available hooks -
```
- id: check-readme
  description: Validate for readme file presense
  
- id: validate-author-email
  description: Valid flux7 email address
  
- id: terraform-fmt
  description: Runs `terraform fmt` on all Terraform files
  
- id: packer-validate
  description: Runs `packer validate` on all staged packer files
  
- id: cfn-lint
  description: Runs cfn-lint on CloudFormation Templates
```
### Example
