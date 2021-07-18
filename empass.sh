# Deobfus By X - MrG3P5
# Encrypt" kntle

trap 'store; exit 1;' 2
threads="20"
r="\033[31;1m"
y="\033[33;1m"
yl="\033[1;33m"
g="\033[0;32m"
gl="\033[32;1m"
b="\033[0;36m"
bl="\033[36;1m"
c="\033[36;1m"
p="\033[0;35m"
o="\033[0m"
cek(){
command -v wget > /dev/null 2>&1 || { echo >&2 "wget belum terinstall ketik >> pkg install wget -y .....lalu ketik bash empas"; exit 1; }
command -v pv > /dev/null 2>&1 || { echo >&2 "pv belum terinstall ketik >> pkg install pv -y .....lalu ketik bash empas"; exit 1; }
}
banner(){
clear
echo -e "$g╔══════════════════════════════════════╗    " | pv -qL 600
echo -e "$g║  ${y}Moonton Email Password      $g║"| pv -qL 600
echo -e "$g╚══════════════════════════════════════╝"| pv -qL 600
echo -e "$g╔══════════════════════════════════════════════╗"| pv -qL 600
echo -e "$y Code By : Acep X-Code                                              " | pv -qL 600
echo -e "$y Github  : https://github.com/aceptriana"| pv -qL 600
echo -e "$y YOuTube : Acep X-Code"                  | pv -qL 600
echo -e "$g╚══════════════════════════════════════════════╝"| pv -qL 600
}
mulai (){
wget https://raw.githubusercontent.com/aceptriana/database/main/empass -o done
for anjay in $(shuf empass)
do
echo "$anjay"
sleep 0.3
done
}
empas-fresh (){
wget https://raw.githubusercontent.com/aceptriana/database/main/empas-fresh -o done
for anjayy in $(shuf empas-fresh)
do
echo "$anjayy"
sleep 0.3
done
}
empas-uncheck (){
wget https://raw.githubusercontent.com/aceptriana/database/main/empas-uncheck -o done
for anjayyy in $(shuf empas-uncheck)
do
echo "$anjayyy"
sleep 0.3
done
}
empas-moontod(){
wget https://raw.githubusercontent.com/aceptriana/database/main/empas-monton -o done
for anjayyyy in $(shuf empas-monton)
do
echo "$anjayyyy"
sleep 0.3
done
}
function stor() {
if [[ -n "$threads" ]]; then
printf "\n"
printf "\e[1;91m [*] Waiting threads shutting down...\n\e[0m"
sleep 4
fi
}
function store() {
if [[ -n "$threads" ]]; then
printf "\n"
printf "\e[1;91m [*] Memutuskan program tunggu...\n\e[0m"
rm -rf empass
rm -rf done
rm -rf empas-fresh
rm -rf empas-monton
rm -rf empas-uncheck
sleep 2
echo -e "${g}Selesai${o}"
echo -e "$g╔═╣${y}  Mau lagi gak ? ${g}║"
echo -e "$g║ ╚══════════════════╝"
read -p $'\033[0;32m╚══════>\033[0m ' lagi
if [[ $lagi == 'mau' || $lagi == 'lagi' || $lagi == 'iya' || $lagi == y || $lagi == Y ]]; then
clear
menu
else
exit
fi
fi
}
menu(){
echo -e "$g╔════════════════════════╗"| pv -qL 600
echo -e "$g║$y  Menu Script Saat Ini  $g║"| pv -qL 600
echo -e "$g╚════════════════════════╝"| pv -qL 600
echo -e "${p}"
echo -e "${y}[${g}1${y}]${b} Update Script${o}" | pv -qL 600
echo -e "${y}[${g}2${y}]${b} Langsung Cari Empas${o}" | pv -qL 600
echo -e "${y}[${g}3${y}]${b} Langsung Cari Empas Fresh${o}" | pv -qL 600
echo -e "${y}[${g}4${y}]${b} Langsung Cari Empas Uncheck${o}" | pv -qL 600
echo -e "${y}[${g}5${y}]${b} Langsung Cari Empas Moonton${o}" | pv -qL 600
echo ""
echo -e "$g╔═╣${y}  Silahkan pilih  ${g}║"
echo -e "$g║ ╚══════════════════╝"
read -p $'\033[0;32m╚══════>\033[0m ' pilihan
if [[ $pilihan == 1 ]]; then
git pull origin master
exit
elif [[ $pilihan == 2 ]]; then
mulai
elif [[ $pilihan == 3 ]]; then
empas-fresh
elif [[ $pilihan == 4 ]]; then
empas-uncheck
elif [[ $pilihan == 5 ]]; then
empas-moontod
else
echo -e "${r}Pilih yang ada aja njeng"
banner
menu
fi
}
sandi(){
banner
echo -e "$g╔════════════════════════╗    "
echo -e "$g║    ${y}Script di kunci     $g║"
echo -e "$g╚════════════════════════╝"
echo -e "passwordnya : root"
echo -e "$g  ╔══════════════════════════╗"
echo -e "$g╔═╣  ${y}MASUKAN PASSWORD TOOLS ${g} ║"
echo -e "$g║ ╚══════════════════════════╝"
read -p $'\033[0;32m╚══════> \033[0m' pass
if [[ $pass == root ]]; then
echo -e "${gl}KATA SANDI BENAR!!"
sleep 1.1
banner
menu
elif [[ $pass == sayang ]]; then
echo -e "${gl}KATA SANDI BENAR!!"
sleep 1.1
clear;
banner
menu
else
echo -e "${r}KATA SANDI SALAH!!!"
sleep 1.5
sandi
fi
}
cek
sandi
menu
