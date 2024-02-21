#!/bin/bash

#warna-warna
b="\033[1;36m"
h="\e[92;1m"
hm='\e[32m'
org='\e[38;5;208m'
nc='\e[0m'
ipvps=$(curl -sS ipv4.icanhazip.com)
clear

#cek user root
clear
echo ""
echo -e "
${b}╔═══════════════════════════════════════════════╗
║         ${h}SCRIPT CREATED BY: ${org}ALAWI VPN          ${b}║
╚═══════════════════════════════════════════════╝
╔═══════════════════════════════════════════════╗
║           ${h}CHECKING USER ${org}ROOT ${h}OR ${org}NO            ${b}║
╠═══════════════════════════════════════════════╣
║ ${nc}[${b}01${nc}] Jika user bukan root maka masuklah       ${b}║
║      ${nc}Menggunakan user root ketik ${nc}(${b}sudo su${nc})    ${b}║
║                                               ║
║ ${nc}[${b}02${nc}] Jika user adalah root maka akan otomatis ${b}║
║      ${nc}melanjutkan proses                       ${b}║
╚═══════════════════════════════════════════════╝${nc}"
echo -e ""
# script cek user
if [ $(id -u) -eq 0 ]; then
    echo "User kamu sudah root"
    sleep 3
    clear
    # Ubah password root
    echo ""
    echo -e "
${b}╔═══════════════════════════════════════════════╗
║         ${h}SCRIPT CREATED BY: ${org}ALAWI VPN          ${b}║
╚═══════════════════════════════════════════════╝
╔═══════════════════════════════════════════════╗
║           ${h}CREATE NEW PASSWORD ROOT            ${b}║
╠═══════════════════════════════════════════════╣
║ • ${nc}Masukkan Password root kamu                 ${b}║
║                                               ║
║ • ${nc}Otomatis melanjutkan prosses                ${b}║
╚═══════════════════════════════════════════════╝${nc}"
    echo -e ""
    printf "Masukkan password baru : "
    read newpassword
    echo -e "$newpassword\n$newpassword" | sudo passwd root
    echo -e ""
    clear

    # Ubah isi dari sshd_config
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
    clear
    #hasil akhir
    apt install curl -y
    clear
    echo ""
    echo -e "
${b}╔═══════════════════════════════════════════════╗
║         ${h}SCRIPT CREATED BY: ${org}ALAWI VPN          ${b}║
╚═══════════════════════════════════════════════╝
╔═══════════════════════════════════════════════╗
║           ${h}DETAIL NEW PASSWORD ROOT            ${b}║
╠═══════════════════════════════════════════════╝
║ • ${nc}Password root = $newpassword
${b}║
║ • ${nc}Silahkan login dengan user ${h}root ${nc} ya!
${b}╚════════════════════════════════════════════════${nc}"
    echo -e ""
    rm -rf setup.sh
else
    clear
    echo -e "${org}User kamu bukan root ${nc}silahkan ketik ${h}sudo su"
    rm -rf setup.sh
fi
