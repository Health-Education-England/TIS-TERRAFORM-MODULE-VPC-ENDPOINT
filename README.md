
# TIS-TERRAFORM-MODULE-VPC-ENDPOINT

This TIS terraform module creates AWS endpoits for services that normally use the public internet for connection in the specified VPC, so that traffic stayes within the AWS private network.

**How to use the terraform module?**

    module  "endpoint_module" {
    for_each  =  toset(["sqs", "sns", "ecr.dkr", "ecr.api", "lambda"])
    source  =  "../../../../modules/endpoint"
    service_name  =  "${each.key}"
    endpoint_type  =  "Interface"
    tags  = local.tags
    vpc_name  =  "trainee_preprod"
    }

1. in the `for_each` section, specify the endpoint(s) you want to add
2. in the `endpoint_type` section, you specify if you want **interface** or **gateway**, only S3 and Dynamodb endpoints have the ability to have **gateway** endpoints, all others are **interface** type.
3. in the `vpc_name` section just add the vpc you want the endpoint created in. the module will add the endpoint to the private endpoint only.

**What are VPC Endpoints?**
VPC endpoints enable creation of a private connection between VPC to supported AWS services and VPC endpoint services powered by PrivateLink using its private IP address. Traffic between VPC and AWS service does not leave the Amazon network.

![VPC Endpoint example](https://miro.medium.com/max/720/0*Gyhu3CpW0r5vbbWO.webp)

[**Interface endpoint**](https://docs.aws.amazon.com/vpc/latest/userguide/vpce-interface.html)  is an elastic network interface (ENI) with a private IP address from the IP address range of user’s subnet that serves as an entry point for traffic destined to a supported service. It enables you to privately access services by using private IP addresses.

[**Gateway endpoint**](https://docs.aws.amazon.com/vpc/latest/userguide/vpce-gateway.html)  is a gateway that you specify as a target for a route in your route table for traffic destined to a supported AWS service. Currently supports S3 and DynamoDB services.

**[Click here for full explanation](https://medium.com/awesome-cloud/aws-vpc-endpoints-overview-intro-getting-started-guide-91ca23b5af8d)**
