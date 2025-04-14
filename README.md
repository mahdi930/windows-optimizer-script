# ⚡ Windows RAM & Performance Optimizer | Clean, Kill, Boost

> ⚠️ **Use at your own risk. For educational purposes only.**

A powerful and lightweight Windows optimization tool for advanced users, gamers, and anyone suffering from lag or memory hogs. This script disables unnecessary services, cleans memory and temp files, and integrates with RAMMap64 to clear standby RAM.

Ideal for **low-end systems**, **older laptops**, or **performance-hungry gaming rigs** like ASUS ROG.

---

## 🧰 Features

- ❌ Disables Windows Updates _(optional & reversible)_
- 🛃 Cleans system temp folders
- 📊 Monitors and trims RAM usage in real-time
- ❌ Kills background apps and bloatware
- ♻️ Loops automatically every 10 seconds
- 🚿 Uses [RAMMap64](https://learn.microsoft.com/en-us/sysinternals/downloads/rammap) to clear standby memory
- 🧠 Designed to work with **RAMMap64.exe** and a silent launcher

---

## 📁 Folder Structure

Your folder should look like this:

```
.
├── RAMMap/                  # (Optional) Additional RAMMap files
├── clear_ram_loop.bat       # Main optimization script with looping (Right click -> Run as admin)
├── run_invisible.vbs        # VBScript launcher for silent background execution (Double click to execute)
├── RAMMap64.exe             # Download from Microsoft Sysinternals
├── README.md                # This file
├── LICENSE                  # MIT license
├── revert.bat               # (Optional) Undo script for updates
└── screenshots/             # (Optional visuals)
```

---

## ⚙️ How to Use

1. 📄 Clone or download this repository.
2. 💾 Download [RAMMap64](https://learn.microsoft.com/en-us/sysinternals/downloads/rammap) (optional, as it's already included in the repository for convenience). However, if you'd like to verify its authenticity, feel free to download it directly from the official Microsoft Sysinternals site and place it in the same folder.
3. ▶️ Double-click `run_invisible.vbs` for silent background execution.
4. ✅ **Right-click** `clear_ram_loop.bat` or `.vbs` and select **Run as Administrator** _(IMPORTANT!)_

---

### ⚠️ Run As Administrator

> Always **right-click** the script or VBS launcher and select **Run as Administrator** to unleash the full power! Without Admin rights, many services and background tasks **won’t be stopped**.

---

## 🚪 Processes It Kills

- OneDrive.exe
- Teams.exe
- AdobeIPCBroker.exe, AdobeCollabSync.exe
- ArmouryCrate.UserSessionHelper.exe, GameSDK.exe, AuraService.exe, NahimicService.exe
- Suggested Extras for generic laptops:

```batch
taskkill /f /im YourPhone.exe
taskkill /f /im SearchUI.exe
taskkill /f /im Cortana.exe
taskkill /f /im XboxGameBar.exe
taskkill /f /im HPHotkeyMonitor.exe
taskkill /f /im DellSupportAssistRemedation.exe
taskkill /f /im LenovoVantageService.exe
```

---

## 🚨 Warning & Disclaimer

- ❗ **Disables Windows Updates** via Services, Registry, and Task Scheduler.
- 🔐 Periodically re-enable updates manually to install security patches.
- 💻 Intended for **personal** and **non-enterprise** systems.
- 🤝 You're welcome to modify and use, but we take **no responsibility** for issues caused.
- 🧑‍💼 Use responsibly and **only on systems you own or have permission to modify**.

---

## ⚠️ Important Notes & Disclaimer (Detailed)

- ❗ This script disables Windows Updates and modifies registry entries. We recommend enabling updates occasionally to ensure security patches and driver updates are installed.
- 💻 Best used on non-enterprise, personal machines where update control is desired.
- 🔐 You are responsible for any changes this script makes. Test on a non-critical system before applying to your main device.
- 👨‍⚖️ For educational and performance tuning purposes only.
- 🚫 Do not use this in a managed environment (e.g., office or school systems).

---

## ↩️ Undo / Revert Script

To restore Windows Update, run:

```cmd
sc config wuauserv start= auto
sc start wuauserv
```

Or manually remove registry keys and re-enable scheduled tasks.

Want a full `revert.bat`? It's included in the root folder for convenience (Always remember to Run as administrator).

---

## 🌟 Screenshots

_(Optional: Add before & after RAM usage images here)_
![clear_ram_loop.bat UI](image.png)

---

## 📆 License

[MIT License](LICENSE)

---

### 💡 Tips

- 🧪 Run once per boot or let it run in loop mode.
- 🕹️ Perfect for gaming sessions to free RAM.
- 🧩 Customize background apps to kill for your specific setup.

---

## 🌚 Tags

```
batch-script, windows-optimizer, ram-cleaner, rammap, gaming-boost, disable-windows-update, temp-cleaner, bloatware-remover, windows10, windows11, rog-optimizer, sysinternals
```

---

## 👊 Support

Like this tool? Give it a ⭐ and share it with your friends!

PRs, suggestions, or issues are always welcome. Let’s make Windows faster, together.
