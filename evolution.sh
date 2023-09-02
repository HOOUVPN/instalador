#!/bin/bash

# Função para exibir o banner
show_banner() {
    # Define a cor verde e o reset
    green="\e[32m"
    reset="\e[0m"

    # Limpa a tela
    clear

    # Imprime o banner centralizado
    echo -e "$green"
    center_text "▄████████ ▄██   ▄      ▄████████     ███        ▄████████   ▄▄▄▄███▄▄▄▄"
    center_text "███    ███ ███   ██▄   ███    ███ ▀█████████▄   ███    ███ ▄██▀▀▀███▀▀▀██▄"
    center_text "███    █▀  ███▄▄▄███   ███    █▀     ▀███▀▀██   ███    █▀  ███   ███   ███"
    center_text "███        ▀▀▀▀▀▀███   ███            ███   ▀  ▄███▄▄▄     ███   ███   ███"
    center_text "▀███████████ ▄██   ███ ▀███████████     ███     ▀▀███▀▀▀     ███   ███   ███"
    center_text "         ███ ███   ███          ███     ███       ███    █▄  ███   ███   ███"
    center_text "   ▄█    ███ ███   ███    ▄█    ███     ███       ███    ███ ███   ███   ███"
    center_text " ▄████████▀   ▀█████▀   ▄████████▀     ▄████▀     ██████████  ▀█   ███   █▀"
    center_text "By SystemHelp MOD V. 0.0.1"
    echo -e "$reset"
}

# Função para centralizar o texto
center_text() {
    local text="$1"
    local padding_width=$(( ($max_width - ${#text}) / 2 ))
    printf "%${padding_width}s%s%${padding_width}s\n" "" "$text" ""
}

# Função para exibir um menu rápido
quick_menu() {
    echo "MENU RÁPIDO PARA CONFIGURAR O EVOLUTION"
    echo "---------------------------------------"
    echo "Você pode usar um IP ou um DOMÍNIO"
    echo "1 - IP da VPS"
    echo "2 - Usar SEU DOMÍNIO"
    echo "---------------------------------------"
    read -p "Escolha uma opção: " choice

    case $choice in
        1)
            read -p "Por favor, insira o IP da VPS: " ip
            edit_env_file "$ip"
            install_evolution
            ;;
        2)
            read -p "Por favor, insira seu DOMÍNIO: " domain
            read -p "Por favor, insira seu endereço de e-mail: " email
            edit_env_file "$domain"
            install_evolution
            configure_proxy "$domain" "8081"  # Altere a porta conforme necessário
            configure_certbot "$email" "$domain"
            ;;
        *)
            echo "Opção inválida. Escolha 1 para IP ou 2 para domínio."
            ;;
    esac
}

# Função para editar o arquivo env.yml
edit_env_file() {
    local ip_or_domain=$1
    local env_file="/root/SystemHelp/evolution/src/env.yml"
    local dev_env_file="/root/SystemHelp/evolution/src/dev-env.yml"

    if [ -f "$env_file" ]; then
        # Se env.yml existe, edite-o diretamente
        sed -i "s/URL: localhost/URL: http:\/\/$ip_or_domain/g" "$env_file"
        echo "Arquivo env.yml editado com sucesso. A URL foi atualizada com o IP ou domínio fornecido."
    elif [ -f "$dev_env_file" ]; then
        # Se env.yml não existe, mas dev-env.yml existe, renomeie dev-env.yml para env.yml e depois edite-o
        mv "$dev_env_file" "$env_file"
        sed -i "s/URL: localhost/URL: http:\/\/$ip_or_domain/g" "$env_file"
        echo "Arquivo dev-env.yml renomeado para env.yml e editado com sucesso. A URL foi atualizada com o IP ou domínio fornecido."
    else
        echo "O arquivo env.yml não foi encontrado no caminho especificado."
        echo "Verifique o caminho do arquivo ou forneça um arquivo válido."
    fi
}

# Função para instalar o Evolution
install_evolution() {
    echo "Iniciando a instalação do Evolution..."
    cd /root/SystemHelp/evolution
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt-get install -y nodejs
    npm install -g npm@latest
    npm install -g pm2@latest
    apt-get install -y git zip unzip nload snapd curl wget sudo
    apt update && apt -y upgrade
    npm install
   # npm run start:prod
    pm2 start 'npm run start:prod' --name ApiEvolution
    pm2 startup
    pm2 save --force
    sudo apt update -y && sudo apt upgrade -y && apt install docker-compose -y && sudo apt update -y && sudo apt install nginx -y && sudo apt update -y && sudo apt install certbot -y && sudo apt install python3-certbot-nginx -y && sudo apt update -y 
    echo "Instalação do Evolution concluída."
}

# Função para configurar o proxy reverso
configure_proxy() {
    local domain=$1
    local porta=$2

    echo "Configurando o proxy reverso para $domain na porta $porta..."

    echo "server {" > /etc/nginx/sites-available/api

    cat <<EOL >> /etc/nginx/sites-available/api
  server_name $domain;

  location / {
    proxy_pass http://127.0.0.1:$porta;
    proxy_http_version 1.1;
    proxy_set_header Upgrade \$http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host \$host;
    proxy_set_header X-Real-IP \$remote_addr;
    proxy_set_header X-Forwarded-Proto \$scheme;
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    proxy_cache_bypass \$http_upgrade;
  }
}
EOL

    #######################################################
    clear
    cd

    sudo ln -s /etc/nginx/sites-available/api /etc/nginx/sites-enabled

    systemctl reload nginx
}

# Função para configurar o Certbot
configure_certbot() {
    local email=$1
    local domain=$2

    echo "Configurando o Certbot para $domain..."

    sudo certbot --nginx --email $email --redirect --agree-tos -d $domain

     # Exibindo informações de acesso ao Evolution
    echo "Acesse o painel Evolution em https://$domain/manager"
    echo "Sua chave de acesso é: 6ceffd5b7fb7fd7d991ed3de5d8f6430"

    # Após concluir as operações, volte ao script alto.sh
    exec ./alto.sh 
}

# Define a largura máxima do terminal
max_width=$(tput cols)

# Chama a função show_banner para exibir o banner
show_banner

# Chame a função de menu rápido
quick_menu
