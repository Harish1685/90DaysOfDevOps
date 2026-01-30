# Week 4 Challenge - Git & GitHub
## Introduction

This document contains a step-by-step guide on completing the Week 4 Challenge of the #90DaysOfDevOps program. It includes essential Git operations, branching, authentication methods, and advanced tasks like SSH setup. Each step is accompanied by images to help visualize the process.

---

## 🚀 Task 1: Fork and Clone the Repository
### 1️⃣ Fork the Repository
- Navigate to the 90DaysOfDevOps Repository and click Fork.
- This creates a copy under your GitHub account.

### 🖼 Example of Your Forked Repo:
<img width="1798" height="962" alt="image" src="https://github.com/user-attachments/assets/d96ef8f4-ce07-4592-987a-3ae0b6882c9a" />

### 2️⃣ Clone the Forked Repository
```bash
# Replace <your-fork-url> with your forked repository link
git clone <your-fork-url>
cd 90DaysOfDevOps/2025/git/01_Git_and_Github_Basics
```
## 🏗️ Task 2: Initialize a Git Repository & Create a File
### 1️⃣ Initialize Git Repository
```bash
mkdir week-4-challenge
cd week-4-challenge
git init
```
### 2️⃣ Create and Commit a File
```bash
echo "Hello, this is my Git challenge!" > info.txt
git add info.txt
git commit -m "Initial commit: Add info.txt"
```


