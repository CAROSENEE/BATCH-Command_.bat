# BATCH-Command_.bat

# 🛡️ Carosine Security Toolkit v1.0

A **multi-function Windows batch script toolkit** — system info, network scanning, file operations, logging, backup, and startup scanning — all in one tool!

> ⚠️ **For educational purposes only.** Built as a batch programming learning project.

---

## ✨ Features

| Option | Feature | Description |
|--------|---------|-------------|
| 1 | System Information | Computer name, username, OS version, RAM info |
| 2 | Network Scanner | Ping, active connections, open ports, IP config |
| 3 | File Operations | Create notes, view notes, list files, delete files |
| 4 | Logger System | Write, view, clear logs (with date/time stamps) |
| 5 | Backup Tool | Folder backup → compressed ZIP file |
| 6 | Startup Scanner | Check startup folder + scheduled tasks |
| 7 | Exit | Graceful exit with goodbye popup |

---

## 📋 Requirements

- Windows 7 / 8 / 10 / 11
- No additional software required (uses built-in PowerShell)
- The System Info option may take 10–20 seconds (`systeminfo` command)

---

## 🚀 Usage

### Method 1: Double-click
Double-click `Class_08/carosine_toolkit.bat` to run it.

### Method 2: Command Prompt
```cmd
cd /d "path\to\Class_08"
carosine_toolkit.bat
```

### Method 3: VS Code Terminal
```
Press Ctrl + ` → type carosine_toolkit.bat
```

---

## 🛠️ Technology

- **Batch Script (cmd.exe)** — core structure
- **PowerShell** — ZIP compression (backup) & extra features
- **mshta (HTA)** — popup messages

---

## 📁 Project Structure

```
BATCH-Command_.bat/
├── README.md
├── Class_01/   ← Basics: echo, set, variables (variable.bat, basic_batch.bat, ...)
├── Class_02/   ← Conditions & goto (if.bat, login-system.bat, ...)
├── Class_03/   ← Loops & delayed expansion (basic-for_loop.bat, ...)
├── Class_04/   ← File read/write/append (file-write.bat, create-CSV_file.bat, ...)
├── Class_05/   ← Temp/hidden files & startup (temp-file.bat, windows-startup.bat, ...)
├── Class_06/   ← schtasks, keylogger concepts, autorun scanner
├── Class_07/   ← PowerShell integration (powershell-in-bat.bat, ...)
├── Class_08/   ← Encryption, compression, backup + carosine_toolkit.bat (v1.0)
├── Class_10/   ← Functions, choice, shift, error handling + Modular_Toolkit-main.bat
└── Class_11/   ← Array task manager, port scanner, Ultimate Toolkit v2.0
```

---

## 📚 Learning Topics Covered

- `@echo off`, `echo`, `pause`, `cls`
- Variables: `set` / `set /p` / `set /a`
- Conditional logic: `if` / `else` / operators
- `goto` labels, menu systems & login system
- `for` loops, ranges & Delayed Expansion
- File read/write/append (`>`, `>>`), hidden files, temp files
- System variables: `%date%`, `%time%`, `%random%`, `%computername%`
- Commands: `schtasks`, `netstat`, `ipconfig`, `ping`, `attrib`
- PowerShell & mshta integration
- Error handling: `%errorlevel%`, `2>nul`, `if exist`
- Functions with `call :label`, multi-script projects with `call` / `start`
- Encryption concepts (Base64), compression & backup automation
- Persistence concepts (startup folder) — for defensive understanding

---

## 🔒 Security Note

- The backup tool creates `C:\backups` — you can change the path in the code
- Fully open source — customize it to your needs
- Use only on your own system

---

## 📌 Roadmap (Future Updates)

- [x] Array simulation & task manager (Class_11/array-task-manager.bat)
- [x] Local port scanner (educational) (Class_11/port-scanner.bat)
- [x] Ultimate Toolkit v2.0 (Class_11/carosine-ultimate-toolkit-v2.bat)
- [ ] GUI version (PowerShell/WPF)
- [ ] Log rotation

---

## 👨‍💻 Author

**Carosine (Md. Moshiur Rahman Sajol)** — built as part of a batch programming learning journey

---

## 📄 License

This project is **for educational purposes** — free to use, modify, and share.

---

## 🙏 Thanks

This is my first complete project. Suggestions are always welcome!
