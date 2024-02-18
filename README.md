# AWS CloudFormation Deployment for RDS Instance

This documentation provides step-by-step instructions for deploying an RDS (Relational Database Service) instance with SQL Server using AWS CloudFormation.

## Prerequisites

1. **AWS Account:** Ensure you have an AWS account with the necessary permissions to create resources.
2. **AWS CLI:** Install and configure the AWS Command Line Interface (CLI) on your local machine.

## Deployment Steps

### Step 1: Clone Repository

Clone the CloudFormation script repository to your local machine:

git clone <repository-url>
cd <repository-directory>

### Step 2: Configure AWS CLI

Run the following command to configure the AWS CLI with your AWS credentials:

aws configure

Enter your AWS Access Key ID, Secret Access Key, default region, and preferred output format.

### Step 3: Modify Parameters

Edit the `template.yml` file to customize parameters such as `dbInstanceID`, `dbUser`, and `dbPassword`.

### Step 4: Validate CloudFormation Template

Run the following command to validate the CloudFormation template:

aws cloudformation validate-template --template-body file://template.yml


### Step 5: Create CloudFormation Stack

Run the following command to create the CloudFormation stack:


aws cloudformation create-stack --stack-name <stack-name> --template-body file://template.yml --capabilities CAPABILITY_IAM


Replace `<stack-name>` with your desired stack name.

### Step 6: Monitor Stack Creation

Monitor the stack creation progress using the AWS CloudFormation console or the following command:


aws cloudformation describe-stacks --stack-name <stack-name>

### Step 7: Stack Cleanup (Optional)

If needed, delete the CloudFormation stack to remove the RDS instance:


aws cloudformation delete-stack --stack-name <stack-name>


### Notes:

- Ensure that sensitive information, especially database passwords, is handled securely.
- Adjust the security group settings based on your requirements.
- Review the CloudFormation events and logs for detailed information.
