    <h1>AWS CloudFormation Deployment for RDS Instance</h1>

    <p>This documentation provides step-by-step instructions for deploying an RDS (Relational Database Service)
        instance with SQL Server using AWS CloudFormation.</p>

    <h2>Prerequisites</h2>

    <ol>
        <li><strong>AWS Account:</strong> Ensure you have an AWS account with the necessary permissions to create
            resources.</li>
        <li><strong>AWS CLI:</strong> Install and configure the AWS Command Line Interface (CLI) on your local
            machine.</li>
    </ol>

    <h2>Deployment Steps</h2>

    <h3>Step 1: Clone Repository</h3>

    <p>Clone the CloudFormation script repository to your local machine:</p>

    <pre><code>git clone &lt;repository-url&gt;
cd &lt;repository-directory&gt;</code></pre>

    <h3>Step 2: Configure AWS CLI</h3>

    <p>Run the following command to configure the AWS CLI with your AWS credentials:</p>

    <pre><code>aws configure</code></pre>

    <p>Enter your AWS Access Key ID, Secret Access Key, default region, and preferred output format.</p>

    <h3>Step 3: Modify Parameters</h3>

    <p>Edit the <code>template.yml</code> file to customize parameters such as <code>dbInstanceID</code>,
        <code>dbUser</code>, and <code>dbPassword</code>.</p>

    <h3>Step 4: Validate CloudFormation Template</h3>

    <p>Run the following command to validate the CloudFormation template:</p>

    <pre><code>aws cloudformation validate-template --template-body file://template.yml</code></pre>

    <h3>Step 5: Create CloudFormation Stack</h3>

    <p>Run the following command to create the CloudFormation stack:</p>

    <pre><code>aws cloudformation create-stack --stack-name &lt;stack-name&gt; --template-body file://template.yml
        --capabilities CAPABILITY_IAM</code></pre>

    <p>Replace <code>&lt;stack-name&gt;</code> with your desired stack name.</p>

    <h3>Step 6: Monitor Stack Creation</h3>

    <p>Monitor the stack creation progress using the AWS CloudFormation console or the following command:</p>

    <pre><code>aws cloudformation describe-stacks --stack-name &lt;stack-name&gt;</code></pre>

    <h3>Step 7: Stack Cleanup (Optional)</h3>

    <p>If needed, delete the CloudFormation stack to remove the RDS instance:</p>

    <pre><code>aws cloudformation delete-stack --stack-name &lt;stack-name&gt;</code></pre>

    <h3>Notes:</h3>

    <ul>
        <li>Ensure that sensitive information, especially database passwords, is handled securely.</li>
        <li>Adjust the security group settings based on your requirements.</li>
        <li>Review the CloudFormation events and logs for detailed information.</li>
    </ul>

