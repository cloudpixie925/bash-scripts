# System Administration & Automation Scripts

A centralized repository containing a collection of Bash scripts designed for Linux system administration, automated log management, user provisioning, and stream processing.

## 🗂 Project Directory

### 1. [D-Clutter](./d-clutter/)
A lightweight utility for automated log parsing and archive management.
* **Core Skills:** File system navigation, conditional archiving, text extraction.
* **Functionality:** Scans target directories for log files, extracts `ERROR`, `CRITICAL`, `FATAL`, and `WARNING` flags into a consolidated incident report, and safely compresses the raw logs into a `.zip` archive while strictly preserving disk space.

### 2. [Aksess](./aksess/)
A system provisioning and workspace configuration tool requiring root privileges.
* **Core Skills:** User/Group management, ownership (`chown`), permission modification (`chmod`), network retrieval (`wget`), and text stream manipulation (`sed`, `grep`, `diff`).
* **Functionality:** Idempotently provisions a development team (users and groups), configures a secure shared workspace with strict numeric permissions, fetches remote assets, physically manipulates text streams in-place, and generates difference logs.

---

## 🚀 Setup & Execution

### Prerequisites
* A Linux/Unix environment (or WSL).
* Appropriate privileges (Some scripts like `aksess.sh` require execution via `sudo`).
* Standard utilities installed (`zip`, `wget`, `grep`, `sed`, `awk`).

### Running a Script
1. Clone the repository to your local machine:
   ```bash
   git clone [https://github.com/yourusername/bash-scripts.git](https://github.com/yourusername/bash-scripts.git)
   cd bash-scripts
   ```
2. Navigate to the desired project directory:
   ```bash
   cd aksess
   ```
3. Grant execution permissions:
   ```bash
   chmod +x aksess.sh
   ```
4. Execute the script:
   ```bash
   sudo ./aksess.sh
   ```
