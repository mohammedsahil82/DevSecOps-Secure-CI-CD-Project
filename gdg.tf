provider_installation {
  filesystem_mirror {
    path    = "/usr/share/terraform/providers"
    include = ["example.com/*/*"]
  }
  direct {
    exclude = ["example.com/*/*"]
  }
}
provider_installation {
  filesystem_mirror {
    path    = "/usr/share/terraform/providers"
    include = ["example.com/*/*"]
  }
  direct {
    exclude = ["example.com/*/*"]
  }
}
ssing a Different Configuration Directory
Terraform v0.13 and earlier also accepted a directory path in place of the plan file argument to terraform apply, in which case Terraform would use that directory as the root module instead of the current working directory.

That usage was deprecated in Terraform v0.14 and removed in Terraform v0.15. If your workflow relies on overriding the root module directory, use the -chdir global option instead, which works across all commands and makes Terraform consistently look in the given directory for all files it would normally read or write in the current working directory.

If your previous use of this legacy pattern was also relying on Terraform writing the .terraform subdirectory into the current working directory even though the root module directory was overridden, use the TF_DATA_DIR environment variable to direct Terraform to write the .terraform directory to a location other than the current working directory.

Examples
The following examples show how to use the terraform apply command for common use cases.

Pass values to input variables
The following command sets the env input variable to prod at runtime:

$ terraform apply -var='env=prod'

The following command sets input variable values by using a local file named my-vars.tfvars:

$ terraform apply -var-file='my-vars.tfvars'

Invoke actions
The following command targets the aws_lambda_invoke action configuration named test. As a result, Terraform invokes the action and ignores all other configurations:

$ terraform apply -invoke='action.aws_lambda_invoke.test`

You can use for_each and count meta-arguments in action configurations. These meta-arguments can invoke an action multiple times. Refer to the action block reference for more information.

The following command invokes the aws_lambda_invoke action configuration named test one time:

$ terraform apply -invoke='action.aws_lambda_invoke.test["first-member-of-a-set"
