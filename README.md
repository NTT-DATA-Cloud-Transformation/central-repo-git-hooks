# central-repo-git-hooks
This is Flux7 Centralized repository for git pre-commit hooks.

## What is git-hooks
Git hooks are scripts that Git executes automaticaly on occurance of events like commit, push, and receive.

## pre-commit tool

### Pre-Requisites
### How to use pre-commit
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
