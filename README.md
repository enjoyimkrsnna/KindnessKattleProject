# KindnessKettle: Share Surplus Meals, Spread Goodwill

**Description:**

KindnessKettle is a heartwarming platform where generosity meets simplicity. It's your go-to space for connecting through food donations. Picture it as a virtual kettle, simmering with the warmth of shared kindness. Users effortlessly contribute to the collective pot by sharing surplus meals, linking directly with local charities for quick and convenient pickups. With KindnessKettle, making a difference is as easy as a shared meal – a simple act that ripples into a sea of goodwill, one kettle at a time. Join us in the joy of giving, where every contribution adds to the comforting brew of community care.



# AWS CloudFormation Deployment and Flyway Configuration for RDS Instance

This documentation provides step-by-step instructions for deploying an RDS (Relational Database Service) instance with SQL Server using AWS CloudFormation and configuring Flyway for database migrations.

## AWS CloudFormation Deployment

### Prerequisites

1. **AWS Account:** Ensure you have an AWS account with the necessary permissions to create resources.
2. **AWS CLI:** Install and configure the AWS Command Line Interface (CLI) on your local machine.

### Deployment Steps

#### Step 1: Clone Repository

Clone the CloudFormation script repository to your local machine:

```bash
git clone <repository-url>
cd <repository-directory>
```

#### Step 2: Configure AWS CLI

Run the following command to configure the AWS CLI with your AWS credentials:

```bash
aws configure
```

Enter your AWS Access Key ID, Secret Access Key, default region, and preferred output format.

#### Step 3: Modify Parameters

Edit the `template.yml` file to customize parameters such as `dbInstanceID`, `dbUser`, and `dbPassword`.

#### Step 4: Validate CloudFormation Template

Run the following command to validate the CloudFormation template:

```bash
aws cloudformation validate-template --template-body file://template.yml
```

#### Step 5: Create CloudFormation Stack

Run the following command to create the CloudFormation stack:

```bash
aws cloudformation create-stack --stack-name <stack-name> --template-body file://template.yml --capabilities CAPABILITY_IAM
```

Replace `<stack-name>` with your desired stack name.

#### Step 6: Monitor Stack Creation

Monitor the stack creation progress using the AWS CloudFormation console or the following command:

```bash
aws cloudformation describe-stacks --stack-name <stack-name>
```

#### Step 7: Stack Cleanup (Optional)

If needed, delete the CloudFormation stack to remove the RDS instance:

```bash
aws cloudformation delete-stack --stack-name <stack-name>
```

### Notes:

- Ensure that sensitive information, especially database passwords, is handled securely.
- Adjust the security group settings based on your requirements.
- Review the CloudFormation events and logs for detailed information.

## Flyway Installation and Configuration

### Prerequisites

1. **RDS Instance:** Ensure you have an RDS instance with the necessary database created and accessible.
2. **Flyway CLI:** Download and install the Flyway Command-Line Interface (CLI) from the official website: [Flyway Downloads](https://flywaydb.org/download).

3. **Database Migrations:** Prepare SQL migration scripts for your database changes.

### Installation Steps

#### Step 1: Download and Extract Flyway CLI

Download the Flyway CLI archive and extract it to your preferred location on your local machine.

#### Step 2: Configure Flyway

Navigate to the Flyway CLI installation directory and create a `flyway.toml` file within the `conf` directory.

```bash
cd /path/to/flyway
touch conf/flyway.toml
```

Edit the `conf/flyway.toml` file with your RDS instance connection details:

```toml
flyway.url = "jdbc:sqlserver://<rds-instance-endpoint>:<port>;databaseName=<your-database>"
flyway.user = "<your-username>"
flyway.password = "<your-password>"
```

#### Step 3: Set Flyway Environment Variables

Set environment variables for Flyway to point to the configuration file:

```bash
export FLYWAY_CONFIG_FILES=/path/to/flyway/conf/flyway.toml
```

#### Step 4: Run Migrations

Place your SQL migration scripts (`.sql` files) in the `migration` directory within the Flyway installation directory.

Run the following command to perform the database migration:

```bash
./flyway migrate
```

This command will execute all pending migrations and update the database schema.

#### Step 5: Check Migration Status

Verify the migration status using the following command:

```bash
./flyway info
```

This command provides details about applied and pending migrations.

## Additional Flyway Commands

- **Undo Last Migration:**

  ```bash
  ./flyway undo
  ```

- **Clean Database:**

  ```bash
  ./flyway clean
  ```

- **Validate Migrations:**

  ```bash
  ./flyway validate
  ```

### Conclusion

You have successfully installed and configured Flyway to migrate SQL files to your connected RDS instance database using the `flyway.toml` configuration file. Adjust the migration scripts and repeat the migration process as needed for your database changes.
