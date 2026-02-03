# Windows 11 Classic Context Menu

Bring back the Windows 10 style right-click menu to Windows 11.

[Türkçe](README_TR.md) | English

---

## What is this?

Windows 11 has a new context menu that hides many options behind "Show more options". This tool restores the classic Windows 10 menu with all options visible immediately.
![Context Menu Comparison](context-menu-comparison.png)
**Simple. Safe. Reversible.**

---

## How to use

### Enable Classic Menu
1. Download `enable-classic-menu.bat`
2. Right-click → **Run as administrator**
3. Done!

### Go Back to Modern Menu
1. Run `restore-modern-menu.bat` as administrator
2. Done!

---

## How it works

The scripts modify one registry key:
```
HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32
```

- **Enable**: Creates the key
- **Restore**: Deletes the key
- Windows Explorer restarts automatically

---

## Requirements

- Windows 11
- Administrator rights

---

## Safety

✅ Only changes user registry (HKCU)  
✅ No system files touched  
✅ Easily reversible  
✅ Open source - check the code yourself

---

## Manual method

**Enable classic menu:**
```batch
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
taskkill /f /im explorer.exe
start explorer.exe
```

**Restore modern menu:**
```batch
reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
taskkill /f /im explorer.exe
start explorer.exe
```

---

## License

MIT License - Free to use and modify

---

⭐ **Star this repo if it helped you!**

