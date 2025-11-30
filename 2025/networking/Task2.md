# Understanding Networking Protocols and Ports for DevOps

## What Protocols and Ports Actually Mean

Protocols define how communication happens between systems.  
Ports define where that communication is received.  

In DevOps, these two decide whether services can talk to each other.  
Most “connection not working” issues come down to the wrong protocol or a blocked port.

---

# Core Protocols for DevOps

## HTTP (Port 80)
Explanation: Basic web communication without encryption.  
Usage: Quick service checks, load balancer health checks, testing APIs in development.

## HTTPS (Port 443)
Explanation: Encrypted version of HTTP using TLS.  
Usage: Production traffic, securing web apps, configuring SSL in servers and load balancers.

## SSH (Port 22)
Explanation: Secure remote access to Linux servers.  
Usage: Connecting to EC2, Git over SSH, automation via Ansible or scripts.

## DNS (Port 53)
Explanation: Converts domain names into IP addresses.  
Usage: Setting up domains, fixing unreachable services, internal service discovery.

---

# File Transfer and Mail Protocols

## FTP (Port 21)
Explanation: Older protocol for transferring files, not encrypted.  
Usage: Used mainly in legacy systems or migrations.

## SFTP (Port 22)
Explanation: Secure file transfer built on SSH.  
Usage: Moving files securely between environments or servers.

## SMTP (Port 25)
Explanation: Protocol for sending emails.  
Usage: App notifications, alerts from pipelines or monitoring tools.

## IMAP / POP3 (Ports 143 / 110)
Explanation: Protocols for retrieving emails.  
Usage: Basic mail server setups and alert systems.

---

# Database and Cache Protocols

## MySQL (Port 3306)
Explanation: Default communication port for MySQL database.  
Usage: Application-to-database connections, migrations, testing DB connectivity.

## PostgreSQL (Port 5432)
Explanation: Default port for PostgreSQL.  
Usage: Microservice database connections, scaling databases, secure VPC access.

## Redis (Port 6379)
Explanation: In-memory store used for caching and sessions.  
Usage: Speeding up APIs, managing sessions, running queues.

---

# DevOps Tools Ports

## Docker
Ports: Varies. Common daemon ports are 2375 (non-TLS) and 2376 (TLS enabled).  
Usage: Managing containers and Docker daemon communication.

## Kubernetes
Ports: 6443 for the API server, other ports vary for internal components.  
Usage: Managing clusters, interacting with the Kubernetes API, scheduling workloads.

## Prometheus
Port: 9090  
Usage: Scraping metrics, querying time-series data, alerting.

## Grafana
Port: 3000  
Usage: Visualizing dashboards, monitoring infrastructure and applications.

## GitHub / Git
Ports: 22 (SSH) and 443 (HTTPS)  
Usage: Accessing repositories, running CI/CD jobs, cloning code securely.

## Jenkins
Port: 8080 (default)  
Usage: Accessing the Jenkins UI and managing CI/CD pipelines.

## Docker Registry (Private registry)
Port: 5000 (default)  
Usage: Pushing and pulling container images inside private environments.

---

# Final Insight

You don’t need to memorize every port, but you should recognize the important ones and what services rely on them.  
Knowing the core web, SSH, DNS, database, caching, and DevOps tool ports is enough to troubleshoot most connectivity issues you’ll face.
