#!/bin/sh

#Включаем логгирование скрипта
LOG_PIPE=log_ai.pipe
rm -f LOG_PIPE
mkfifo ${LOG_PIPE}
LOG_FILE=log_aiBash.txt
rm -f LOG_FILE
tee < ${LOG_PIPE} ${LOG_FILE} &
exec  > ${LOG_PIPE}
exec  2> ${LOG_PIPE}

# Цвета
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
phpVer="7.4"

MKC_txt() {
	printf "\033[1;32m$@\033[0m\n"
}

install_complected() {
  clear
  MKC_txt "${red}Пожалуйста, оцените работу скрипта!"
	MKC_txt "${red}Пожалуйста, попробуйте безлимитный хостинг! ${yellow}https://clck.ru/SQZXC"
	MKC_txt "${red}Очень дешёвые домены по одной цене с продлением! ${yellow}https://clck.ru/SQZXC"
	MKC_txt "${red}Вечный хостинг PHP+MySQL! ${yellow}https://clck.ru/SQZXC"
	MKC_txt
		MKC_txt "${green}Author: t.me/${red}MiKillCrafter"
		MKC_txt "${red}Сайт установлен по этому пути:"
    MKC_txt "${blue}$INSTALL_DIR"
    MKC_txt "${yellow}http://$DOMAIN/${red}phpmyadmin"
    MKC_txt
		  MKC_txt "${red}Логин:"
		    MKC_txt "${yellow} (--->  root  <---)"
		  MKC_txt "${red}Пароль:"
		    MKC_txt "${yellow} (--->  $MySQL_Password  <---)"
		MKC_txt
	MKC_txt "Всё готово [All done]"
	  MKC_txt "1 – Меню [Menu]"
	  MKC_txt "0 – Выход [Exit]"
	MKC_txt
	read -p "${blue}Введи номер [Input number]: " case
	case $case in
	  1) menu;;
	  0) exit;;
	esac
}

setup_server() {
  clear
    MKC_txt "Подготовка к установке:"
  sleep 3

  MKC_txt
    check_os_update
  sleep 3

  MKC_txt

	MKC_txt "Выполняю: apt-get install apt -y"
	  apt-get install apt -y
	MKC_txt "Выполнено"

  MKC_txt

	MKC_txt "Выполняю: apt autoremove -y"
	  apt autoremove -y
	MKC_txt "Выполнено"

	MKC_txt

	MKC_txt "Выполняю: apt clean"
	  apt -y clean
	MKC_txt "Выполнено"

	MKC_txt

	MKC_txt "Выполняю: apt -y install --fix-missing"
	  apt -y install --fix-missing
	MKC_txt "Выполнено"
  sleep 5

	clear
	  MKC_txt ">> Устанавливаю важные пакеты..."
	sleep 3

	MKC_txt

	MKC_txt "${blue}[INSTALL]:${green} sudo"
	    apt-get install -y sudo
	MKC_txt "${blue}[COMPLECTED]:${green} sudo"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} apt"
	    apt-get install -y apt
	MKC_txt "${blue}[COMPLECTED]:${green} apt"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} wget"
	    apt-get install -y wget
	MKC_txt "${blue}[COMPLECTED]:${green} wget"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} apt-utils"
	    apt-get install -y apt-utils
  MKC_txt "${blue}[COMPLECTED]:${green} apt-utils"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} software-properties-common"
	    apt-get install -y software-properties-common
	MKC_txt "${blue}[COMPLECTED]:${green} software-properties-common"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} pwgen"
	    apt-get install -y pwgen
	MKC_txt "${blue}[COMPLECTED]:${green} pwgen"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} dialog"
	    apt-get install -y dialog
	MKC_txt "${blue}[COMPLECTED]:${green} dialog"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} ssh"
		sudo apt-get install -y ssh
		sleep 2
	MKC_txt "${blue}[COMPLECTED]:${green} ssh"

	MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} mc"
		sudo apt-get install -y mc
		sleep 2
	MKC_txt "${blue}[COMPLECTED]:${green} mc"

	MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} zip"
		sudo apt-get install -y zip
		sleep 2
	MKC_txt "${blue}[COMPLECTED]:${green} zip"

	MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} unzip"
		sudo apt-get install -y unzip
		sleep 2
	MKC_txt "${blue}[COMPLECTED]:${green} unzip"

	MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} htop"
		sudo apt-get install -y htop
		sleep 2
	MKC_txt "${blue}[COMPLECTED]:${green} htop"

	MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} net-tools"
		sudo apt-get install -y net-tools
		sleep 2
	MKC_txt "${blue}[COMPLECTED]:${green} net-tools"

	MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} python-pip"
	  apt-get install -y python-pip
	MKC_txt "${blue}[COMPLECTED]:${green} python-pip"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} python"
	  apt-get install -y python
	MKC_txt "${blue}[COMPLECTED]:${green} python"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} python3"
	  apt-get install -y python3
	MKC_txt "${blue}[COMPLECTED]:${green} python3"
  sleep 3

  clear
	  MKC_txt "${green} >> Команда: ${red}Установка важных пакетов${green} завершена. ${yellow}Продолжаем..."
	sleep 5

	MKC_txt

	MKC_txt "${red}Генерируем временные пароли для MySQL ${green}"
    MySQL_Password=$(pwgen -cns -1 20)
	MKC_txt "Пароли сгенерированы!"

	MKC_txt

	MKC_txt "${green}Записываю пароли в ${red}MySQL Server"
	    echo mysql-server mysql-server/root_password select "$MySQL_Password" | debconf-set-selections
	    echo mysql-server mysql-server/root_password_again select "$MySQL_Password" | debconf-set-selections
	MKC_txt "${green}Пароли записаны"

	MKC_txt

	MKC_txt "Устанавливаю репозитории phpmyadmin"
    sudo add-apt-repository -y ppa:phpmyadmin/ppa
  MKC_txt "Репозитории добавлены"
  sleep 3

  check_os_update

  clear
    MKC_txt "Устанавливаю серверные приложения"
  sleep 3

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} nginx"
	  sudo apt-get install -y nginx
	MKC_txt "${blue}[COMPLECTED]:${green} nginx"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} php$phpVer-fpm"
	  sudo apt-get install -y php$phpVer-fpm
	MKC_txt "${blue}[COMPLECTED]:${green} php$phpVer-fpm"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} php$phpVer-mysql"
	  sudo apt-get install -y php$phpVer-mysql
	MKC_txt "${blue}[COMPLECTED]:${green} php$phpVer-mysql"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} php$phpVer-mbstring"
	  sudo apt-get install -y php$phpVer-mbstring
	MKC_txt "${blue}[COMPLECTED]:${green} php$phpVer-mbstring"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} php$phpVer-gettext"
	  sudo apt-get install -y php$phpVer-gettext
	MKC_txt "${blue}[COMPLECTED]:${green} php$phpVer-gettext"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} php$phpVer-json"
	  apt-get install -y php$phpVer-json
	MKC_txt "${blue}[COMPLECTED]:${green} php$phpVer-json"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} php$phpVer-curl"
	  apt-get install -y php$phpVer-curl
	MKC_txt "${blue}[COMPLECTED]:${green} php$phpVer-curl"

	MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} mysql-server"
	  apt-get install -y mysql-server
	MKC_txt "${blue}[COMPLECTED]:${green} mysql-server"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} mysql-client"
	  apt-get install -y mysql-client
	MKC_txt "${blue}[COMPLECTED]:${green} mysql-client"

  MKC_txt
	  MKC_txt "Приложения установлены"
	sleep 3

	MKC_txt "${green}Настройка: PHPMyAdmin"
	  echo "phpmyadmin phpmyadmin/internal/skip-preseed boolean true" | debconf-set-selections
	  echo "phpmyadmin phpmyadmin/dbconfig-install boolean false" | debconf-set-selections
	  echo "phpmyadmin phpmyadmin/mysql/admin-user string root" | debconf-set-selections
	  echo "phpmyadmin phpmyadmin/mysql/admin-pass password $MySQL_Password" | debconf-set-selections
	  echo "phpmyadmin phpmyadmin/mysql/app-pass password $MySQL_Password" |debconf-set-selections
	  echo "phpmyadmin phpmyadmin/app-password-confirm password $MySQL_Password" | debconf-set-selections
	  echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect" | debconf-set-selections
	MKC_txt "Команда: Настройка: PHPMyAdmin ${red}Выполнена ${green}"
	sleep 5

	MKC_txt

	MKC_txt "${blue}[INSTALL]:${yellow} phpmyadmin"
	  sudo apt-get install -y phpmyadmin
	MKC_txt "${blue}[COMPLECTED]:${yellow} phpmyadmin"

	MKC_txt

	MKC_txt "Всё ещё работаю..."
	  MKC_txt
	  MKC_txt ">> sudo mkdir -p /etc/nginx/sites-available"
	  MKC_txt
	  sudo mkdir -p /etc/nginx/sites-available
	MKC_txt
	sleep 3

	MKC_txt "Отчёт: ufw app list"
	  sudo ufw app list
	MKC_txt
	sleep 5

	MKC_txt "Разрешаю внешнее соединение: ufw allow 'Nginx HTTP'"
	  sudo ufw allow 'Nginx HTTP'
	MKC_txt
	sleep 3

	MKC_txt "Отчёт: sudo ufw status"
	  sudo ufw status
	MKC_txt
	sleep 5

	MKC_txt "Удаляю стандартный файл настроек: default"
	  sudo rm -rf /etc/nginx/sites-available/default
	  sudo rm -rf /etc/nginx/sites-enabled/default
	MKC_txt
	sleep 3

	MKC_txt "Указываю путь к файлу конфигураций"
	  configFile='/etc/nginx/sites-available/phpmyadmin.conf'
	MKC_txt
	sleep 2

  MKC_txt "Вношу изменения в файл конфигурации сервера. LISTEN_PORT:80"

	echo "# -- // -- Default server file: Generated by aiBash script">>$configFile
	echo "# -- // -- Author + referral_link: https://clck.ru/SQZXC">>$configFile
	echo "server {">>$configFile
	echo "    listen 80 default_server;">>$configFile
	echo "    listen [::]:80 default_server;">>$configFile
	echo "    root $INSTALL_DIR/default;">>$configFile
	echo "    server_name $DOMAIN;">>$configFile
	echo "    index index.php index.html index.htm index.nginx-debian.html;">>$configFile
	echo "">>$configFile
	echo "        location /phpmyadmin {">>$configFile
	echo "        alias /usr/share/phpmyadmin/;">>$configFile
	echo "">>$configFile
	echo "        location ~ \.php$ {">>$configFile
	echo "            fastcgi_pass unix:/run/php/php$phpVer-fpm.sock;">>$configFile
	echo "            fastcgi_index index.php;">>$configFile
	echo '            fastcgi_param SCRIPT_FILENAME $request_filename;'>>$configFile
	echo "            include fastcgi_params;">>$configFile
	echo "            fastcgi_ignore_client_abort off;">>$configFile
	echo "        }">>$configFile
	echo "">>$configFile
	echo "        location ~* \.(js|css|png|jpg|jpeg|gif|ico)$ {">>$configFile
	echo "            access_log    off;">>$configFile
	echo "            log_not_found    off;">>$configFile
	echo "            expires 1M;">>$configFile
	echo "        }">>$configFile
	echo "    }">>$configFile
	echo "">>$configFile
	echo "    location ~ \.php$ {">>$configFile
	echo "        fastcgi_pass unix:/var/run/php/php$phpVer-fpm.sock;">>$configFile
	echo "        fastcgi_index index.php;">>$configFile
	echo '        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;'>>$configFile
	echo "        include fastcgi_params;">>$configFile
	echo "    }">>$configFile
	echo "}">>$configFile

	MKC_txt

  cd ~
	  MKC_txt "Конфигурация внесена"
	sleep 5

	MKC_txt

  cd ~
	  MKC_txt "Создаю симлинк файла"
	  sudo ln -s /etc/nginx/sites-available/phpmyadmin.conf /etc/nginx/sites-enabled/
	sleep 3

	MKC_txt ">> cd ~"
    cd ~
  MKC_txt

  MKC_txt "Создаю, подключаю и очищаю каталог, где будет хранится сайт: ${red}$INSTALL_DIR${green}"
	  mkdir -p "$INSTALL_DIR/default"
	  sudo chmod 777 "$INSTALL_DIR/default"
	  cd "$INSTALL_DIR/default"
	  rm -Rfv *
	MKC_txt "Каталог создан и подключен"
	sleep 5

	MKC_txt

	MKC_txt "Теперь создаю тестовый файл index.php"
    echo "<?php phpinfo(); ?>" >> index.php
    MKC_txt "Выдаю права 777. Измените обязательно!"
    sudo chmod 777 ./*
    MKC_txt "Тестовый файл создан"
  sleep 5

	MKC_txt

	MKC_txt "Возвращаемся в домашний каталог"
	cd ~

	MKC_txt

	MKC_txt "Перезапускаю модули Nginx и MySQL"
	nginx -s reload
	service mysql restart
	MKC_txt "Команды перезапуска служб выполнены"
	sleep 5

	install_complected
}

################################################################################################

check_os_update() {
  MKC_txt "Обновляем пакеты"
    apt-get update -y
    apt-get upgrade -y
  MKC_txt "Завершаем обновление"
}

menu()
{
		MKC_txt "${blue}Menu:"
		  MKC_txt "${green} - 1 – Настроить сервер [Setup server]"
		  MKC_txt "${green} - 2 – Вернутся и изменить IP-адрес или папку для сайта [Back & replace IP or folder for the site]"
		  MKC_txt
		  MKC_txt "${red} - 0 – Выход [Exit]"
		MKC_txt
		read -p "${blue}Введи номер [Input number]: " case
		case $case in
			1) setup_server;;
			2) InputArrayData;;
			0) exit;;
	esac
}

InputArrayData()
{
	clear
	MKC_txt "${blue}[Инфо]${green}: Введите путь к папке с сайтом"
	MKC_txt "${blue}[INFO]${green}: Enter the path to the directory with the site"
	MKC_txt
	MKC_txt "${green} (Пример | Example): ${yellow}/var/www ${green}"
	MKC_txt
	read -p "${green}Введи путь до сайта: ${yellow}" INSTALL_DIR
	clear
	sudo ifconfig
	MKC_txt "${green}Enter ${red}domain ${green}or ${red}IP:"
	read -p "${green}Введи ${red}домен ${green}или ${red}IP: ${green}" DOMAIN
	clear
	menu
}

start()
{
	clear
	if [ "$USER" = "root" ]; then
		MKC_txt "${blue}Ты точно хочешь запустить настройку Linux для Nginx, MySQL, PHP$phpVer?"
		MKC_txt "${blue}Are you sure u want to start setup the Linux for Nginx, MySQL, PHP$phpVer?"
		MKC_txt
		  MKC_txt "${green} - 1 - ДА – YES ✔"
		  MKC_txt "${red} - 0 - НЕT – NO ✔"
		MKC_txt
		MKC_txt "${blue}Want to continue? (Input: ${green}1 or ${red}0${blue}):"
		read -p "${blue}Хотите продолжить? (Введи: ${green}1 или ${red}0${blue}): " case
		case $case in
			1) InputArrayData;;
			0) exit;;
		esac; clear
	else clear; MKC_txt "${red}You are not a root | Вы не root"; fi
}

start