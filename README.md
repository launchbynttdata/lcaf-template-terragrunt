# launch-terragrunt-skeleton
This skeleton is the template used to generate terragrunt services utilizing [launch-cli](https://github.com/nexient-llc/launch-cli.git)

## .launch folder
The `.launch` folder contains the metadata used with `launch-cli` to generate code based on this skeleton. This folder is not commited during new service creation and only exists in the skeleton.

This folder contains the following structure:
```
./launch
    example_projects/
        Contains examples on how to utilize this skeleton
    jinja2/
        Contains the jinja2 templates to be rendered
```

## Usage

Within the `.launch/jinja2`, the platform contains the entire structure of the jinja2 templates to render. if the folder path is surrounded by brackets `{{some_var}}`, its a variable path and all jinja2 templates within those children directories will be replicated throughout your `inputs`.

When using `launch-cli` commands with this skeleton, inputs supplied must match the structure of the skeleton being used.


Create a new service
`launch service create --name my-new-service --in-file my_inputs.json`

Deploy service:
`launch terragrunt plan --repository-url https://github.com/my-org/my-new-service`

### Skeleton jinja2 inputs
```
{
    "sources":{
        "service":{
            "module": string,
            "tag" : string
        }, // Required
        "pipeline":{
            "module": string,
            "tag" : string
        }, // Optional
        "webhook":{
            "module": string,
            "tag" : string
        } // Optional
    },
    "provider": string, // Required, accepts only 'aws' or 'az'
    "remote_state": {
        "resource_group_name": string, // Optional, az only
        "storage_account_name": string, // Optional, az only
        "container_name": string, // Optional, az only
        "bucket": string, // Optional, aws only
        "dynamodb_table": string // Optional, aws only
    }, // Optional
    "accounts": {
        string: string
    }, // Required
    "naming_prefix": string, //Required
    "platform": {
        "service": {
            string: {
                string: {
                    string: {
                        "properties_file": string
                    }
                }
            }
        }, //Required
        "pipeline": {
            "pipeline-provider": {
                string: {
                    string: {
                        "properties_file": "./aws_s3.tfvars"
                    }
                }
            }, //Optional
            "git-provider": {
                string: {
                    string: {
                        "properties_file": "./aws_s3.tfvars"
                    }
                }
            } // Optional
        } // Optional
    }
}
```

### Example launch-cli params to be used with this skeleton.
```
{
    "sources":{
        "service":{
            "module": "https://github.com/nexient-llc/tf-aws-wrapper_module-s3_bucket.git",
            "tag" : "0.1.0"
        },
        "pipeline":{
            "module": "https://github.com/nexient-llc/tf-aws-wrapper_module-s3_bucket.git",
            "tag" : "0.1.0"
        },
        "webhook":{
            "module": "https://github.com/nexient-llc/tf-aws-wrapper_module-s3_bucket.git",
            "tag" : "0.1.0"
        }
    },
    "provider": "aws",
    "accounts": {
        "sandbox": "launch-sandbox-admin"
    },
    "naming_prefix": "demo",
    "platform": {
        "service": {
            "sandbox": {
                "us-east-2": {
                    "000": {
                        "properties_file": "./aws_s3.tfvars"
                    }
                }
            }
        },
        "pipeline": {
            "pipeline-provider": {
                "aws": {
                    "sandbox": {
                        "properties_file": "./aws_s3.tfvars"
                    }
                }
            },
            "git-provider": {
                "aws": {
                    "webhook": {
                        "properties_file": "./aws_s3.tfvars"
                    }
                }
            }
        }
    }
}
```
