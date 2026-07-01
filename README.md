# D-Clutter

A lightweight Bash utility for automated log parsing and archive management. D-Clutter scans specified directories for log files, extracts critical failure data into a consolidated report, and safely archives the raw logs to optimize disk space.

## Features
* **Automated Parsing:** Scans `.log` files for `ERROR`, `CRITICAL`, `FATAL`, and `WARNING` flags.
* **Incident Reporting:** Consolidates all matched flags into a single `incident_report.txt`.
* **Space Optimization:** Compresses processed logs into a `.zip` archive (stripping absolute paths) and removes the raw files.
* **Idempotent Execution:** Clears previous archives before running to prevent corruption.

## Prerequisites
* A Linux/Unix environment (or WSL)
* `zip` utility installed (`sudo apt install zip` for Debian/Ubuntu)

## Setup & Execution

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/yourusername/d-clutter.git](https://github.com/yourusername/d-clutter.git)
   cd d-clutter
   ```

2. **Make the script executable:**
   ```bash
   chmod 744 dclutter.sh
   ```

3. **Configure your target directory:**
   Open `dclutter.sh` and update the `MY_DIR` variable to point to your target log directory.

4. **Run the script:**
   ```bash
   ./dclutter.sh
   ```

## Project Structure
```text
d-clutter/
├── .gitignore             # Ignores raw logs, archives, and local reports
├── dclutter.sh            # The core execution script
└── README.md              # Documentation
```
