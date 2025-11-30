# AWS EC2 and Security Groups

This section covers how to launch an EC2 instance and configure Security Groups properly.  
EC2 is AWS’s virtual machine service, and Security Groups act as the network firewall that decides what traffic reaches your instance.  
Understanding both is essential for working with cloud servers safely.

---

## Prerequisites

- An active AWS account  
- Basic understanding of IPs, ports, and protocols  
- SSH client available on your system (Linux/macOS/WSL/Windows with PuTTY)

---

## Step 1: Launch an EC2 Instance

### Accessing EC2
1. Log in to the AWS Management Console  
2. Search for **EC2**  
3. Make sure you're in the region where you want the server to run  

### Instance Setup
1. Click **Launch Instance**  
2. Fill the basic details:
   - Name the instance clearly (e.g., "dev-web-server")
   - Add tags to organize resources

3. Select an AMI:
   - Recommended: **Ubuntu Server 22.04 LTS**
   - Ensure it is **Free-tier eligible**

4. Choose Instance Type:
   - Select **t2.micro** (1 vCPU, 1 GiB RAM)  
   - Good for testing and learning

### Network Settings
1. Choose the VPC and subnet  
2. Enable **Auto-assign Public IP** if you want to access the server from your machine  
3. Leave other defaults as-is unless you have custom networking

---

## Step 2: Choose or Create a Key Pair

Key pairs let you securely connect to the server.

### Creating a New Key Pair
- Give it a name  
- Choose **RSA**  
- Choose **PEM** format for Linux/macOS  
- Download and store it safely  

### Using an Existing Key Pair
- Select from your previously created keys  

Keep your key secure. You need it every time you SSH into the instance.

---

## Step 3: Configure Security Groups

Security Groups decide what traffic can reach your EC2 instance.  
They apply at the instance level and allow only the traffic you specify.

### Inbound Rules

#### 1. SSH Access
- Protocol: TCP  
- Port: 22  
- Source: Your IP (recommended)  
- Purpose: Remote login to the server  

#### 2. HTTP (if running a web server)
- Protocol: TCP  
- Port: 80  
- Source: Anywhere or specific IP ranges  
- Purpose: Allow users to access your site  

#### 3. HTTPS (secure web access)
- Protocol: TCP  
- Port: 443  
- Source: Anywhere  
- Purpose: Secure website traffic  

> Keep admin ports locked to your IP.  
> Only public-facing ports (80/443) should be open to everyone.

### Outbound Rules
The default **allow all** outbound rule is fine for most cases.  
Instances usually need internet access for updates, package installs, and APIs.

---

## Step 4: Launch and Connect

### Launching
- Click **Launch Instance**  
- Wait for the instance state to show **Running**  
- Note the **Public IP** or **Public DNS**

### Connecting via SSH
On Linux/macOS/WSL:

chmod 400 /path/to/key.pem
ssh -i /path/to/key.pem ubuntu@<public-ip>


If you see a warning about permissions, ensure the key file has restricted access (`chmod 400`).

---

## Why Security Groups Matter

- They determine whether your instance is reachable  
- They protect your server from unwanted access  
- They ensure only necessary ports are open  
- They prevent accidental exposure of sensitive services (DB, admin ports, cache servers)

Most “server unreachable” issues come down to Security Group misconfiguration.  
Learning how to set rules correctly saves a lot of time.

---

## Best Practices

- Allow SSH only from your IP  
- Do not expose database ports publicly  
- Keep separate Security Groups for different roles (web, app, DB)  
- Use tags to track and organize resources  
- Review and remove unused Security Groups periodically  

---

## Summary

You launched an EC2 instance, created/selected a key pair, and configured Security Groups to control traffic.  
This is one of the core skills in AWS, and mastering it early makes working with 
