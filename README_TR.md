# Windows 11 Klasik Sağ Tık Menüsü

Windows 10 tarzı sağ tık menüsünü Windows 11'e geri getirin.

Türkçe | [English](README.md)

---

## Nedir bu?

Windows 11'de yeni menü birçok seçeneği "Daha fazla seçenek göster" arkasına gizliyor. Bu araç, tüm seçeneklerin hemen görüldüğü klasik Windows 10 menüsünü geri getirir.

**Basit. Güvenli. Geri alınabilir.**

---

## Nasıl kullanılır?

### Klasik Menüyü Aktifleştir
1. `enable-classic-menu.bat` dosyasını indir
2. Sağ tık → **Yönetici olarak çalıştır**
3. Tamam!

### Modern Menüye Geri Dön
1. `restore-modern-menu.bat` dosyasını yönetici olarak çalıştır
2. Tamam!

---

## Nasıl çalışır?

Scriptler tek bir registry anahtarını değiştirir:
```
HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32
```

- **Aktifleştir**: Anahtarı oluşturur
- **Geri al**: Anahtarı siler
- Windows Explorer otomatik yeniden başlar

---

## Gereksinimler

- Windows 11
- Yönetici yetkisi

---

## Güvenlik

✅ Sadece kullanıcı registry'sini değiştirir (HKCU)  
✅ Sistem dosyalarına dokunmaz  
✅ Kolayca geri alınabilir  
✅ Açık kaynak - kodu kendiniz kontrol edebilirsiniz

---

## Manuel yöntem

**Klasik menü:**
```batch
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
taskkill /f /im explorer.exe
start explorer.exe
```

**Modern menü:**
```batch
reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
taskkill /f /im explorer.exe
start explorer.exe
```

---

## Lisans

MIT Lisansı - Özgürce kullanabilir ve değiştirebilirsiniz

---

⭐ **İşinize yaradıysa yıldız verin!**

