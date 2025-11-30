# Hands-On with Networking Commands

A quick guide to essential networking commands used in DevOps for checking connectivity, DNS, routing, and service reachability.

---

# 1. ping

### Purpose  
Checks if your machine can reach a host and measures basic latency.

### Usage  

ping <hostname or IP>


### What it shows  
Reachability, round-trip time, packet loss.

---

# 2. traceroute / tracert

### Purpose  
Shows the path packets take across networks to reach a destination.

### Usage  
Linux:

traceroute <host>

Windows:

tracert <host>


### What it shows  
Each hop, where delays occur, and where routing fails.

---

# 3. netstat

### Purpose  
Displays active connections and listening ports.

### Usage  

netstat <options>


### Useful options  
`-a` all connections  
`-n` numeric output  
`-t` TCP connections  

### What it shows  
Which services are bound to which ports and active network activity.

---

# 4. curl

### Purpose  
Tests APIs and web services by sending HTTP requests.

### Usage  

curl <URL>


### Useful options  
`-I` headers only  
`-X` request method  
`-H` custom headers  
`-d` data payload  

### What it shows  
Status codes, headers, body responses, and HTTPS behavior.

---

# 5. dig / nslookup

### Purpose  
Queries DNS servers for domain resolution.

### Usage  
Linux:

dig <domain>

Windows/Linux:

nslookup <domain>


### What they show  
DNS records, which server responded, and how a domain resolves.

---

These commands are the basics of network troubleshooting and appear in almost every DevOps workflow.
