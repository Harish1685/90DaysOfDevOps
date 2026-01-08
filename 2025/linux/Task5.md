# Task 5 – Process Management & Monitoring

## Objective
Run a background process, monitor it using common Linux tools, and terminate it safely.

Tasks:
- Start a background process
- Monitor it using `ps`, `top`, and `htop`
- Kill the process and confirm termination

---

## Step 1: Start a Background Process

```bash
ping google.com > ping_test.log &
```
This command:
- Runs ping continuously
- Redirects output to a file
- Executes the process in the background
Example output:
```bash
[1] 460849
```
460849 is the Process ID (PID).

## Step 2: Monitor the Process
### Using ps
```bash
ps aux | grep ping
```
## Sample output:
```text
soumo  460849  0.1  0.0  11212  1276 pts/0  S  12:05  0:00 ping google.com
```
### Using top
```bash
top
```
- Press Shift + P → sort by CPU
- Press Shift + M → sort by memory
- Press q → exit
## Using htop (Optional)
Install if not already available:
```bash
sudo apt update -y
sudo apt install htop
```
Run:
```bash
htop
```
- Use arrow keys to navigate
- Press F3 and search for ping

## Step 3: Terminate the Process
Kill using PID:
```bash
kill 460849
```
Or kill by process name:
```bash
pkill ping
```

Force kill (if required):
```bash
kill -9 460849
```
## Step 4: Verify Process Termination
```bash
ps aux | grep ping
```
If only the grep command appears, the process has been successfully stopped.

## Result
- Background process started and monitored
- Process terminated successfully
- Verification confirms the process is no longer running
