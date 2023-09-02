#########################################################

loading() {
    local duration=2
    local width=$2 
    local interval=0.02
    local progress=0     

    while [ $progress -le 100 ]; do
        local bar=$(printf "[%-${width}s]" $(printf "=%.0s" $(seq 1 $(($progress * $width / 100)))))
        printf "\rCarregando... $bar%3d%%" $progress
        sleep $interval
        progress=$((progress + 1))
    done

    clear
}

width=100 

#########################################################

clear

            # Define a largura máxima do terminal
            max_width=$(tput cols)

            # Função para centralizar o texto
            center_text() {
                local text="$1"
                local padding_width=$(( ($max_width - ${#text}) / 2 ))
                printf "%${padding_width}s%s%${padding_width}s\n" "" "$text" ""
            }

            # Define a cor verde e o reset
            green="\e[32m"
            reset="\e[0m"

            # Limpa a tela
            clear

            # Imprime o banner centralizado
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
            echo -e "$reset"


loading 2 $width

#########################################################

while true; do

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

#########################################################

    echo "Digite o número da opção desejada"
    echo ""
    echo "1 - Chatwoot 3.0"
    echo "2 - Evolution 1.5"
    echo "3 - Typebot (Corrigidos bugs da última versão)"
    #echo "4 - Quepasa (Estamos arrumando os erros)"
    echo "9 - Sair do Auto Instalador"
    echo ""
    read -p "Escolha uma opção: " choice

case $choice in
        1)
            chmod +x 1-chatwoot.sh
            ./1-chatwoot.sh
            ;;
        2)
            chmod +x evolution.sh
            ./evolution.sh
            ;;
        3)
            chmod +x typebot.sh
            ./typebot.sh
            ;;
        4)
            chmod +x evolution.sh
            ./evolution.sh
            ;;
        9)
            echo "Encerrando o Auto Instalador."
            echo ""
            clear 

            # Define a largura máxima do terminal
            max_width=$(tput cols)

            # Função para centralizar o texto
            center_text() {
                local text="$1"
                local padding_width=$(( ($max_width - ${#text}) / 2 ))
                printf "%${padding_width}s%s%${padding_width}s\n" "" "$text" ""
            }

            # Define a cor verde e o reset
            green="\e[32m"
            reset="\e[0m"

            # Limpa a tela
            clear

            # Imprime o banner centralizado
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
            echo -e "$reset"
            sleep 2
            exit 0
            ;;
        *)
            echo "Opção inválida. Digite um número de 1 a 8."
            sleep 2
            ;;
    esac
    read -p "Pressione Enter para continuar..."
done