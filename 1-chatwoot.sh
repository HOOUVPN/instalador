#########################################################
#
# LOADING
#

loading() {
    local duration=2
    local width=$2 
    local interval=0.02
    local progress=0     

    while [ $progress -le 100 ]; do
        local bar=$(printf "[%-${width}s]" $(printf "=%.0s" $(seq 1 $(($progress * $width / 100)))))
        printf "\rCarregando Auto Instalador... $bar%3d%%" $progress
        sleep $interval
        progress=$((progress + 1))
    done

    clear
}

width=100

loading1() {
    local duration=2
    local width=$2 
    local interval=0.02
    local progress=0     

    while [ $progress -le 100 ]; do
        local bar=$(printf "[%-${width}s]" $(printf "=%.0s" $(seq 1 $(($progress * $width / 100)))))
        printf "\rIniciando Instalação... $bar%3d%%" $progress
        sleep $interval
        progress=$((progress + 1))
    done

    clear
}

#
# FIM DE LOADING
#
#########################################################
#
# CREDITOS
#

clear

echo -e "$green"
echo -e "\e[32m▄████████ ▄██   ▄      ▄████████     ███        ▄████████   ▄▄▄▄███▄▄▄▄\e[0m"
echo -e "\e[32m███    ███ ███   ██▄   ███    ███ ▀█████████▄   ███    ███ ▄██▀▀▀███▀▀▀██▄\e[0m"
echo -e "\e[32m███    █▀  ███▄▄▄███   ███    █▀     ▀███▀▀██   ███    █▀  ███   ███   ██▄\e[0m"
echo -e "\e[32m███        ▀▀▀▀▀▀███   ███            ███   ▀  ▄███▄▄▄     ███   ███   ██▄\e[0m"
echo -e "\e[32m▀███████████ ▄██   ███ ▀███████████     ███     ▀▀███▀▀▀     ███   ███   ██▄\e[0m"
echo -e "\e[32m         ███ ███   ███          ███     ███       ███    █▄  ███   ███   ██▄\e[0m"
echo -e "\e[32m   ▄█    ███ ███   ███    ▄█    ███     ███       ███    ███ ███   ███   ██▄\e[0m"
echo -e "\e[32m ▄████████▀   ▀█████▀   ▄████████▀     ▄████▀     ██████████  ▀█   ███   █▀\e[0m"
echo -e "\e[32m           By SystemHelp MOD V. 0.0.1\e[0m"
echo -e "\e[32m                          APOIA AQUI ESTA O PIX CNPJ: 48.590.314/0001-18 \e[0m"
echo -e "\e[32m                          Telegram https://t.me/+FGzk0EiNths1N2Nh \e[0m"
echo -e "\e[32m                          YOUTUBE https://www.youtube.com/@SYSTEMHELP\e[0m"
echo -e "\e[32m                          APOIA AQUI ESTA O PIX CNPJ: 48.590.314/0001-18 \e[0m"

loading 2 $width

#
# FIM DE CREDITOS
#
#########################################################
#
# NOME DO PROGRAMA
#

clear

echo -e "$green"
echo -e "\e[32m▄████████ ▄██   ▄      ▄████████     ███        ▄████████   ▄▄▄▄███▄▄▄▄\e[0m"
echo -e "\e[32m███    ███ ███   ██▄   ███    ███ ▀█████████▄   ███    ███ ▄██▀▀▀███▀▀▀██▄\e[0m"
echo -e "\e[32m███    █▀  ███▄▄▄███   ███    █▀     ▀███▀▀██   ███    █▀  ███   ███   ██▄\e[0m"
echo -e "\e[32m███        ▀▀▀▀▀▀███   ███            ███   ▀  ▄███▄▄▄     ███   ███   ██▄\e[0m"
echo -e "\e[32m▀███████████ ▄██   ███ ▀███████████     ███     ▀▀███▀▀▀     ███   ███   ██▄\e[0m"
echo -e "\e[32m         ███ ███   ███          ███     ███       ███    █▄  ███   ███   ██▄\e[0m"
echo -e "\e[32m   ▄█    ███ ███   ███    ▄█    ███     ███       ███    ███ ███   ███   ██▄\e[0m"
echo -e "\e[32m ▄████████▀   ▀█████▀   ▄████████▀     ▄████▀     ██████████  ▀█   ███   █▀\e[0m"
echo -e "\e[32m           By SystemHelp MOD V. 0.0.1\e[0m"
echo -e "\e[32m                          APOIA AQUI ESTA O PIX CNPJ: 48.590.314/0001-18 \e[0m"
echo -e "\e[32m                          Telegram https://t.me/+FGzk0EiNths1N2Nh \e[0m"
echo -e "\e[32m                          YOUTUBE https://www.youtube.com/@SYSTEMHELP\e[0m"
echo -e "\e[32m                          APOIA AQUI ESTA O PIX CNPJ: 48.590.314/0001-18 \e[0m"
echo -e "$reset"                                                                        


#
# FIM DE NOME DO PROGRAMA
#
#########################################################


clear

echo -e "$green"
echo -e "\e[32m▄████████ ▄██   ▄      ▄████████     ███        ▄████████   ▄▄▄▄███▄▄▄▄\e[0m"
echo -e "\e[32m███    ███ ███   ██▄   ███    ███ ▀█████████▄   ███    ███ ▄██▀▀▀███▀▀▀██▄\e[0m"
echo -e "\e[32m███    █▀  ███▄▄▄███   ███    █▀     ▀███▀▀██   ███    █▀  ███   ███   ██▄\e[0m"
echo -e "\e[32m███        ▀▀▀▀▀▀███   ███            ███   ▀  ▄███▄▄▄     ███   ███   ██▄\e[0m"
echo -e "\e[32m▀███████████ ▄██   ███ ▀███████████     ███     ▀▀███▀▀▀     ███   ███   ██▄\e[0m"
echo -e "\e[32m         ███ ███   ███          ███     ███       ███    █▄  ███   ███   ██▄\e[0m"
echo -e "\e[32m   ▄█    ███ ███   ███    ▄█    ███     ███       ███    ███ ███   ███   ██▄\e[0m"
echo -e "\e[32m ▄████████▀   ▀█████▀   ▄████████▀     ▄████▀     ██████████  ▀█   ███   █▀\e[0m"
echo -e "\e[32m           By SystemHelp MOD V. 0.0.1\e[0m"
echo -e "\e[32m                          APOIA AQUI ESTA O PIX CNPJ: 48.590.314/0001-18 \e[0m"
echo -e "\e[32m                          Telegram https://t.me/+FGzk0EiNths1N2Nh \e[0m"
echo -e "\e[32m                          YOUTUBE https://www.youtube.com/@SYSTEMHELP\e[0m"
echo -e "\e[32m                          APOIA AQUI ESTA O PIX CNPJ: 48.590.314/0001-18 \e[0m"

loading1 2 $width

#
# FIM DE MENSAGEM DE INSTALANDO
#
#########################################################
#
# INSTALANDO DEPENDENCIAS
#

cd

sudo apt update

apt upgrade -y

sudo timedatectl set-timezone America/Sao_Paulo

#
# FIM DE INSTALANDO DEPENDENCIAS
#
#########################################################
#
# BAIXANDO CHATWOOT E EXECUTANDO
#
wget https://get.chatwoot.app/linux/install.sh

chmod +x install.sh

clear

sudo ./install.sh --install

#
# FIM DE BAIXANDO CHATWOOT E EXECUTANDO
#
#########################################################
#
# EDITANDO .ENV + GUARDANDO POSTGRES
#



systemctl daemon-reload && systemctl restart chatwoot.target

#
# FIM DE EDITANDO .ENV + GUARDANDO POSTGRES
#
#########################################################
#
# HABILITANDO CONFIGURAÇÕES OCULTAS DO CHATWOOT
#

sudo -u postgres psql -d chatwoot_production -c "UPDATE installation_configs SET locked = false;"

#
# FIM DE HABILITANDO CONFIGURAÇÕES OCULTAS DO CHATWOOT
#
#########################################################
#
# MENSAGEM DE INSTLADO + DADOS
#

cd
cd
cd
echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m _                             _              _        \e[0m"
echo -e "\e[32m| |                _          | |            | |       \e[0m"
echo -e "\e[32m| | ____    ___  _| |_  _____ | |  _____   __| |  ___  \e[0m"
echo -e "\e[32m| ||  _ \  /___)(_   _)(____ || | (____ | / _  | / _ \ \e[0m"
echo -e "\e[32m| || | | ||___ |  | |_ / ___ || | / ___ |( (_| || |_| |\e[0m"
echo -e "\e[32m|_||_| |_|(___/    \__)\_____| \_)\_____| \____| \___/ \e[0m"
echo -e "\e[32m                                                       \e[0m"              
echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"
eecho -e "$green"
echo -e "\e[32m▄████████ ▄██   ▄      ▄████████     ███        ▄████████   ▄▄▄▄███▄▄▄▄\e[0m"
echo -e "\e[32m███    ███ ███   ██▄   ███    ███ ▀█████████▄   ███    ███ ▄██▀▀▀███▀▀▀██▄\e[0m"
echo -e "\e[32m███    █▀  ███▄▄▄███   ███    █▀     ▀███▀▀██   ███    █▀  ███   ███   ██▄\e[0m"
echo -e "\e[32m███        ▀▀▀▀▀▀███   ███            ███   ▀  ▄███▄▄▄     ███   ███   ██▄\e[0m"
echo -e "\e[32m▀███████████ ▄██   ███ ▀███████████     ███     ▀▀███▀▀▀     ███   ███   ██▄\e[0m"
echo -e "\e[32m         ███ ███   ███          ███     ███       ███    █▄  ███   ███   ██▄\e[0m"
echo -e "\e[32m   ▄█    ███ ███   ███    ▄█    ███     ███       ███    ███ ███   ███   ██▄\e[0m"
echo -e "\e[32m ▄████████▀   ▀█████▀   ▄████████▀     ▄████▀     ██████████  ▀█   ███   █▀\e[0m"
echo -e "\e[32m           By SystemHelp MOD V. 0.0.1\e[0m"
echo -e "\e[32m                          APOIA AQUI ESTA O PIX CNPJ: 48.590.314/0001-18 \e[0m"
echo -e "\e[32m                          Telegram https://t.me/+FGzk0EiNths1N2Nh \e[0m"
echo -e "\e[32m                          YOUTUBE https://www.youtube.com/@SYSTEMHELP\e[0m"
echo -e "\e[32m                          APOIA AQUI ESTA O PIX CNPJ: 48.590.314/0001-18 \e[0m"

#
# FIM DE MENSAGEM DE INSTLADO + DADOS
#
#########################################################
#
# USUARIO PREENCHEU DADOS ERRADOS
#

elif [ "$confirma1" == "n" ]; then
    echo "Encerrando a instalação, por favor, inicie a instalação novamente."
    exit 0
else
    echo "Resposta inválida. Digite 'y' para confirmar ou 'n' para encerrar a instalação."
    exit 1
fi

#
# FIM DE USUARIO PREENCHEU DADOS ERRADOS
#
#########################################################