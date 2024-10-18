# Terraform AWS Static Site Deployment

This project contains Terraform Infrastructure as Code (IaC) to deploy a static website on AWS using S3, CloudFront, ACM, and Route53.

## Modules

### Certificate (cer)
Manages AWS Certificate Manager (ACM) for SSL/TLS certificates.

### CloudFront
Sets up CloudFront distributions for content delivery.

### Route53
Configures DNS settings using Amazon Route53.

### S3
Creates and configures S3 buckets for static website hosting.

## Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/terraform-aws-static-site.git
   cd terraform-aws-static-site
   ```

2. Update `terraform.tfvars` with your specific values:
   ```hcl
   region = "your-preferred-region"
   domain = "your-domain.com"
   ```

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Review the planned changes:
   ```bash
   terraform plan
   ```

5. Apply the Terraform configuration:
   ```bash
   terraform apply
   ```

6. Confirm the changes by typing `yes` when prompted.

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 0.12+)
- A registered domain name

## How It Works

This Terraform project sets up a complete infrastructure for hosting a static website on AWS. Here's an overview of how the components work together:

1. **S3 Buckets**: 
   - Two S3 buckets are created: one for the root domain and one for the www subdomain.
   - The www bucket is configured for static website hosting, while the root domain bucket is set up to redirect to the www version.

2. **ACM Certificate**:
   - An SSL/TLS certificate is requested and validated through AWS Certificate Manager.
   - The certificate is created in the us-east-1 region, which is required for use with CloudFront.
   - DNS validation is used, with the necessary CNAME records automatically added to Route53.

3. **CloudFront Distributions**:
   - Two CloudFront distributions are created, one for the root domain and one for the www subdomain.
   - These distributions are configured to use the S3 buckets as origins.
   - The ACM certificate is attached to both distributions to enable HTTPS.

4. **Route53**:
   - A hosted zone is created for the domain if it doesn't already exist.
   - A records are added to point the root domain and www subdomain to the respective CloudFront distributions.
   - The necessary records for ACM certificate validation are also managed here.

This architecture provides a secure, scalable, and high-performance hosting solution for static websites, leveraging AWS's global content delivery network.

## Important Notes

- Ensure your AWS CLI is configured with the correct credentials and region.
- The ACM certificate is created in the `us-east-1` region as required by CloudFront.
- Make sure your domain's nameservers are pointing to the Route53 nameservers after applying the Terraform configuration.

## Cleanup

To destroy the created resources:

```bash
terraform destroy
```

**Caution:** This will remove all resources created by this Terraform configuration. Ensure you want to delete everything before confirming.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.