#######################################################
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


sleep 3
#######################################################

read -p "Seu dominio para o typebot  (ex: typebot.seudominio.com): " builder
echo ""
read -p "Porta do para seu typebot (padrão: 3333): " portabuilder #novo
echo ""
read -p "Seu dominio para o boot do typebot (ex: bot.seudominio.com): " viewer
echo ""
read -p "Porta para o boot do typebot (padrão: 3102): " portaviewer #novo
echo ""
read -p "Seu dominio para o armazenamento (ex: storage.seudominio.com): " storage
echo ""
read -p "Porta para o armazenamento (padrão: 9100): " portastorage #novo
echo ""
read -p "Seu Email PARA O LINK MAGICO (ESSE INSTLADOR USOU GMAIL ENTAO SOMENTE ELE FUNCIONA ) (ex: contato@gmail.com): " email
echo ""
read -p "Senha do seu GMAIL APLICATIVO (SE NAO SOUBER PARE AQUI E PESQUISE )( precisa ser a senha de aplicativo): " senha
echo ""
read -p "SMTP do seu email (coloque  smtp.gmail.com): " smtp
echo ""
read -p "Porta SMTP (do GMAIL sempre vai ser  587): " portasmtp #novo
echo ""
read -p "SMTP_SECURE (,digite false): " SECURE #novo
echo ""
read -p "use essa chave ou gere uma nova de 32 ( 9b6c625184177106275086ddbfa0f8b9): " key

#######################################################

echo ""
echo ""
echo ""

echo "Atualizando a VPS + Instalando Docker Compose + Nginx + Certbot"

sleep 3

cd
cd

clear

sudo apt update -y
sudo apt upgrade -y

apt install docker-compose -y
sudo apt update

sudo apt install nginx -y
sudo apt update

sudo apt install certbot -y
sudo apt install python3-certbot-nginx -y
sudo apt update

mkdir typebot.io
cd typebot.io
echo ""
echo ""
echo "Atualizado/Instalado com Sucesso"

sleep 3

clear

#######################################################

echo "Criando arquivo docker-compose.yml"

sleep 3

cat > docker-compose.yml << EOL
version: '3.3'
services:
  typebot-db:
    image: postgres:13
    restart: always
    volumes:
      - db_data:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=typebot
      - POSTGRES_PASSWORD=typebot
  typebot-builder:
    ports:
      - $portabuilder:3000
    image: baptistearno/typebot-builder:2.15.2
    restart: always
    depends_on:
      - typebot-db
    environment:
      - DATABASE_URL=postgresql://postgres:typebot@typebot-db:5432/typebot
      - NEXTAUTH_URL=https://$builder
      - NEXT_PUBLIC_VIEWER_URL=https://$viewer

      - ENCRYPTION_SECRET=$key

      - ADMIN_EMAIL=$email

      - SMTP_SECURE=$SECURE

      - SMTP_HOST=$smtp
      - SMTP_PORT=$portasmtp
      - SMTP_USERNAME=$email
      - SMTP_PASSWORD=$senha
      - NEXT_PUBLIC_SMTP_FROM='Suporte Typebot' <$email>

      - S3_ACCESS_KEY=minio
      - S3_SECRET_KEY=minio123
      - S3_BUCKET=typebot
      - S3_ENDPOINT=$storage
  typebot-viewer:
    ports:
      - $portaviewer:3000
          - $portaviewer:3000
    image: baptistearno/typebot-viewer:main
    restart: always
    environment:
      - DATABASE_URL=postgresql://postgres:typebot@typebot-db:5432/typebot
      - NEXT_PUBLIC_VIEWER_URL=https://$viewer
      - ENCRYPTION_SECRET=$key

      - S3_ACCESS_KEY=minio
      - S3_SECRET_KEY=minio123
      - S3_BUCKET=typebot
      - S3_ENDPOINT=$storage
  mail:
    image: bytemark/smtp
    restart: always
  minio:
    labels:
      virtual.host: '$storage'
      virtual.port: '$portastorage'
      virtual.tls-email: '$email'
    image: minio/minio
    command: server /data
    ports:
      - '$portastorage:$portastorage'
    environment:
      MINIO_ROOT_USER: minio
      MINIO_ROOT_PASSWORD: minio123
    volumes:
      - s3_data:/data
  createbuckets:
    image: minio/mc
    depends_on:
      - minio
    entrypoint: >
      /bin/sh -c "
      sleep 10;
      /usr/bin/mc config host add minio http://minio:$portastorage minio minio123;
      /usr/bin/mc mb minio/typebot;
      /usr/bin/mc anonymous set public minio/typebot/public;
      exit 0;
      "
volumes:
  db_data:
  s3_data:
EOL

echo "Criado e configurado com sucesso"

sleep 3

clear

###############################################

echo "Iniciando Conteiner"

sleep 3

docker-compose up -d

echo "Typebot Instaldo... Realizando Proxy Reverso"

sleep 3

clear

###############################################

cd

cat > typebot << EOL
server {

  server_name $builder;

  location / {

    proxy_pass http://127.0.0.1:$portabuilder;

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

###############################################

sudo mv typebot /etc/nginx/sites-available/

sudo ln -s /etc/nginx/sites-available/typebot /etc/nginx/sites-enabled

###############################################

cd

cat > bot << EOL
server {

  server_name $viewer;

  location / {

    proxy_pass http://127.0.0.1:$portaviewer;

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

###############################################

sudo mv bot /etc/nginx/sites-available/

sudo ln -s /etc/nginx/sites-available/bot /etc/nginx/sites-enabled

##################################################

cd

cat > storage << EOL
server {

  server_name $storage;

  location / {

    proxy_pass http://127.0.0.1:$portastorage;

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

###############################################

sudo mv storage /etc/nginx/sites-available/

sudo ln -s /etc/nginx/sites-available/storage /etc/nginx/sites-enabled

###############################################

sudo certbot --nginx --email $email --redirect --agree-tos -d $builder -d $viewer -d $storage

###############################################

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
echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32mAcesse o Builder através do link: https://$builder\e[0m"
echo -e "\e[32m\e[0m"
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
