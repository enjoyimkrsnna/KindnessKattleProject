# KindnessKettle: Share Surplus Meals, Spread Goodwill

**Description:**

KindnessKettle is a heartwarming platform where generosity meets simplicity. It's your go-to space for connecting through food donations. Imagine it as a virtual kettle, simmering with the warmth of shared kindness. Users effortlessly contribute to the collective pot by sharing surplus meals, linking directly with local charities for quick and convenient pickups. With KindnessKettle, making a difference is as easy as a shared meal – a simple act that ripples into a sea of goodwill, one kettle at a time. Join us in the joy of giving, where every contribution adds to the comforting brew of community care.

# AWS CloudFormation Deployment and Flyway Configuration for SQL Server RDS Instance with GitHub Actions CI/CD

This documentation provides step-by-step instructions for deploying an RDS (Relational Database Service) instance with SQL Server using AWS CloudFormation and configuring Flyway for database migrations. Additionally, it covers setting up GitHub Actions for continuous integration and continuous deployment (CI/CD).

# AWS CloudFormation Deployment

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

# Flyway Installation and Configuration

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

# GitHub Actions for Flyway Database Migrations

## Workflow Overview

This GitHub Actions workflow automates database migrations using Flyway, enabling you to effortlessly manage database schema changes.

## Workflow Script

```yaml
name: flyway
 
on:
  push:
    branches: 
      - main
 
jobs:
  deploy:
    runs-on: ubuntu-latest
 
    env:
      FLYWAY_USER: ${{ secrets.DB_BUILD_USERNAME }}
      FLYWAY_PASSWORD: ${{ secrets.DB_BUILD_PASSWORD }}
      FLYWAY_URL: ${{ secrets.DB_BUILD_URL }}
      FLYWAY_CLEAN_DISABLED: false
      FLYWAY_LOCATIONS: "filesystem:./migrations/"
      FLYWAY_CONFIG_FILES: "filesystem:./conf/flyway.toml"
 
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      - name: Setup Flyway CLI
        run: |
          sudo apt update
          sudo apt install -y default-jre
          wget -qO- https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/7.9.1/flyway-commandline-7.9.1-linux-x64.tar.gz | tar xvz
          sudo ln -s $(pwd)/flyway-7.9.1/flyway /usr/local/bin/flyway
 
      - name: Flyway Repair
        run: |
          flyway repair
      - name: Flyway Migrate 
        run: |
          flyway migrate \
             -url="${FLYWAY_URL}" \
            -user="${FLYWAY_USER}" \
            -password="${FLYWAY_PASSWORD}" \
            -configFiles="${FLYWAY_CONFIG_FILES}"
```

## Workflow Steps

1. **Checkout code:** This step checks out the repository code.

2. **Setup Flyway CLI:** Installs the required dependencies and sets up Flyway CLI.

3. **Create Secrets in GitHub:**
   - Navigate to your GitHub repository.
   - Go to the "Settings" tab.
   - In the left sidebar, click on "Secrets."
   - Click on "New repository secret" and add the following secrets:
      - `DB_BUILD_USERNAME`: Your database username.
      - `DB_BUILD_PASSWORD`: Your database password.
      - `DB_BUILD_URL`: Your database URL.

4. **Flyway Repair:** Repairs the metadata table if necessary.

5. **Flyway Migrate:** Executes database migrations using Flyway.

## Conclusion

You now have a comprehensive setup covering KindnessKettle, AWS CloudFormation deployment, Flyway installation, and GitHub Actions for automating database migrations, with the added step of creating necessary secrets in GitHub Actions for secure storage of sensitive information.

