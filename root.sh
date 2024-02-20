#!/bin/bash

# Pastikan script dijalankan sebagai root
if [ "$EUID" -ne 0 ]
  then echo "Silakan jalankan script ini sebagai root"
  exit
fi

# Membuat user baru dengan nama "newuser"
read -p "Masukkan nama user baru: " newuser
adduser $newuser

# Menambahkan user baru ke grup sudo (hanya untuk Debian)
usermod -aG sudo $newuser

# Menambahkan user baru ke grup sudo (hanya untuk Ubuntu)
usermod -aG sudo $newuser

# Mengubah password user baru
passwd $newuser

echo "User baru telah berhasil dibuat"
