#!/bin/bash

# Script para desenvolvedores web e android no Ubuntu/ElementaryOS
# Criado por Willian Justen
# Atualizado por Marcus Silva

# Esse script foi escrito usando o zenity e tem
# o objetivo de agilizar a instalação de programas
# básicos no mundo do desenvolvimento web atual.
# É um script bem básico e rápido, sugestões são bem vindas =)

# Esse script foi escrito usando o zenity e tem o objetivo de agilizar a instalação de programas



zenity --info --title "Script Web Development" --text "Este é um script simples para instalação de ferramentas úteis para Desenvolvimento Web e do ambiente do Ubuntu. \n\natualizado por: Marcus Silva"
resposta=$(zenity  --list  --text "Escolha os pacotes que deseja instalar." --checklist  --column "Instalar" --column "Id" --column "Pacote"\
    FALSE "a" "Restricted-Extras (Codecs de áudio e vídeo, plugin flash, java entre outros)"\
    FALSE "b" "Gimp (Editor de Imagens)"\
    FALSE "c" "Inkscape (Editor de Vetores)"\
    FALSE "d" "Imagemagick (Editor de Imagens via Terminal)"\
    FALSE "e" "Terminator"\
    FALSE "f" "Sublime Text 3"\
    FALSE "g" "Atom"\
    FALSE "h" "Dropbox"\
    FALSE "i" "Google Chromium"\
    FALSE "j" "Google Chrome"\
    FALSE "l" "Mozila Firefox"\
    FALSE "m" "Git e Gitk"\
    FALSE "n" "Filezilla"\
    FALSE "o" "Office 4"\
    FALSE "p" "Pip, Virtualenv e Virtualenvwrapper"\
    FALSE "q" "RVM e Ruby"\
    FALSE "r" "Spotify / Skype"\
    FALSE "s" "Thunderbird"\
    FALSE "t" "Java 8 / JDK 8"\
    FALSE "u" "Android Studio"\
    FALSE "x" "Extras apenas para Elementary OS"\
    FALSE "z" "NodeJS / Yo / Gulp / Bower / Webpack / Nodemon"\
    --separator=":" --width=750 --height=700)


if [[ $resposta =~ "a" ]]; then
    sudo apt-get -y install ubuntu-restricted-extras
fi

if [[ $resposta =~ "b" ]]; then
    sudo apt-get -y install gimp
fi

if [[ $resposta =~ "c" ]]; then
    sudo apt-get -y install inkscape
fi

if [[ $resposta =~ "d" ]]; then
   sudo apt-get -y install imagemagick
fi

if [[ $resposta =~ "e" ]]; then
    sudo add-apt-repository -y ppa:gnome-terminator
    sudo apt-get update
    sudo apt-get install terminator
fi

if [[ $resposta =~ "f" ]]; then
  # adicionando repositório
  sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
  sudo apt-get update
  sudo apt-get -y install sublime-text-installer
fi

if [[ $resposta =~ "g" ]]; then
  # adicionando atom editor
  sudo add-apt-repository -y ppa:webupd8team/atom
  sudo apt-get update
  sudo apt-get -y install atom
fi

if [[ $resposta =~ "h" ]]; then
   sudo apt-get -y install nautilus-dropbox
   #instalando indicador da barra de tarefas
   sudo apt-get -y install libappindicator1
fi

if [[ $resposta =~ "i" ]]; then
   sudo apt-get -y install chromium-browser
fi

if [[ $resposta =~ "j" ]]; then
  # baixando a chave do chrome para adicionar nas chaves de repositórios
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  # adicionando na lista de fontes
  sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
  sudo apt-get update
  sudo apt-get install -y google-chrome-stable
fi

if [[ $resposta =~ "l" ]]; then
  sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa
  sudo apt-get update
  sudo apt-get install firefox
fi

if [[ $resposta =~ "m" ]]; then
  sudo apt-get install -y git-core gitk
fi

if [[ $resposta =~ "n" ]]; then
  sudo apt-get install -y filezilla
fi

if [[ $resposta =~ "o" ]]; then
  # instalando dependências
  sudo apt-get install -y python-software-properties python g++ make
  #Install Libre Office 4
  sudo add-apt-repository ppa:libreoffice/libreoffice-4-0
  sudo apt-get update
  sudo apt-get install libreoffice
fi

if [[ $resposta =~ "p" ]]; then
    sudo apt-get install -y curl
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    curl -sSL https://get.rvm.io | bash -s stable
fi

if [[ $resposta =~ "q" ]]; then
  sudo apt-get install -y python-pip
  sudo pip install virtualenv
  sudo pip install virtualenvwrapper
fi

if [[ $resposta =~ "r" ]]; then
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
  echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
  sudo apt-get update
  sudo apt-get install -y spotify-client
  #Install Skype
  sudo apt-add-repository "deb http://archive.canonical.com/ubuntu/ precise partner"
  sudo apt-get update && sudo apt-get install skype
fi

if [[ $resposta =~ "s" ]]; then
  #Install Thunderbird
  #if you want install Thunderbird instead of Geary Mail
  #first remove Geary Mail
  sudo apt-get purge geary

  sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa
  sudo apt-get update
  sudo apt-get install thunderbird
fi

if [[ $resposta =~ "t"]]; then
  sudo apt-get install oracle-java8-installer
  sudo apt-get install default-jdk  
fi

if [[ $resposta =~ "u"]]; then
  sudo add-apt-repository ppa:paolorotolo/android-studio
  sudo apt-get update
  sudo apt-get install android-studio
fi


if [[ $resposta =~ "x" ]]; then
  #Install Elementary OS extras
  sudo apt-add-repository ppa:versable/elementary-update
  sudo apt-get update

  sudo apt-get install elementary-desktop elementary-tweaks
  sudo apt-get install elementary-dark-theme elementary-plastico-theme elementary-whit-e-theme elementary-harvey-theme
  sudo apt-get install elementary-elfaenza-icons elementary-nitrux-icons
  sudo apt-get install elementary-plank-themes
  sudo apt-get install wingpanel-slim indicator-synapse
fi

if [[ $resposta =~ "z" ]]; then

  # adicionando repositório
  curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
  sudo apt-get update
  sudo apt-get install -y nodejs

  #instalando defaults
  npm install -g yo gulp
  npm install -g bower
  npm install -g babel-cli webpack
fi


# removendo os pacotes não necessários
sudo apt-get autoremove

zenity --info --title "Instalação Finalizada" --text "Instalação Finalizada com sucesso!"
