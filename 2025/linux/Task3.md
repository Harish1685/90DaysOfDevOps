# Task 3 – Log File Analysis using grep, awk, and sed

## Objective
Analyze a Linux system log file and extract useful insights using standard Linux text-processing tools.

Tasks performed:
- Search for error-related entries using `grep`
- Extract timestamps and infer log levels using `awk`
- Mask IP addresses for security using `sed`
- (Bonus) Identify the most frequent log messages

---

## Step 1: Download the Log File

Clone the LogHub repository:
```bash
git clone https://github.com/logpai/loghub.git
```
Navigate to the Linux logs directory:
```bash
cd loghub/Linux
```
Verify the log file:
```bash
ls -l Linux_2k.log
```
---

## Step 2: Log Analysis
### 2.1 Search for Errors using grep
Search for lines containing the word error(case-insensitive)::
```bash
grep -i "error" Linux_2k.log
```
Result:
- No direct matches for the keyword error were found in the log file.
  
---

### 2.2 Extract Timestamps and Log Levels using awk
Extract date/time fields and classify log levels based on message patterns:
```bash
awk '{
  timestamp = $1 " " $2 " " $3;
  if ($0 ~ /authentication failure/) level="ERROR";
  else if ($0 ~ /ALERT/) level="ALERT";
  else level="INFO";
  print timestamp, level;
}' Linux_2k.log
```
sample output:
```bash
Jun 14 15:16:01 ERROR
Jun 15 04:06:18 INFO
Jun 15 04:06:20 ALERT
```
---

### 2.3 Mask IP Addresses using sed
Replace all IPv4 addresses with [REDACTED]:
```bash
sed -E 's/([0-9]{1,3}\.){3}[0-9]{1,3}/[REDACTED]/g' Linux_2k.log
```
sample output:
```text
connection from [REDACTED] at Fri Jun 17 07:07:00 2005
```
---

### Bonus: Most Frequent Log Entries
Extract log messages and find the top 10 most frequent entries:
```bash
awk '{for (i=5; i<=NF; i++) printf $i " "; print ""}' Linux_2k.log \
| sort | uniq -c | sort -nr | head -10
```
sample output:
```text
43 logrotate: ALERT exited abnormally with [1]
16 named[2306]: notify question section contains no SOA
7 syslogd 1.4.1: restart.
```
---

## Result
- Log data analyzed successfully
- Sensitive IP information masked
- Frequent system events identified
- Core Linux text-processing tools applied effectively
