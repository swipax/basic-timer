#!/bin/bash

black="\033[1;30m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
blue="\033[1;34m"
purple="\033[1;35m"
cyan="\033[1;36m"
violate="\033[1;37m"
nc="\033[00m"

logo=$(echo "                     
$(figlet TIMER | lolcat)
")
echo -e "$logo"
# Kullanıcıdan Sebep al
echo -e ${purple}"Ney için Zamanlayıcı oluşturmak istiyorsunuz?"
echo -n "Zamanlayıcı: "
read input

# Kullanıcıdan bekleme süresini al
echo -e ${blue}"\nKaç dakika beklemek istiyorsunuz?"
echo -n "dakika: "
read duration

duration_in_seconds=$((duration*60))
remaining_duration=$duration

# Süreyi beklet
while [ $remaining_duration -gt 0 ]
do
  clear
  echo -e "${green}$input için Kalan Süre: $((remaining_duration / 60)) dakika $((remaining_duration % 60)) saniye${nc}"
  sleep 1
  remaining_duration=$((remaining_duration - 1))
done
play ding.wav >/dev/null 2>&1

# Zenity ile pop-up mesaj kutusu görüntüleme
zenity --info --text="$input\n\nBitti "

