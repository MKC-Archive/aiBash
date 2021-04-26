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
	MKC_txt "${red}Пожалуйста, оцените работу скрипта! ${yellow}https://clck.ru/N9mux"
	MKC_txt
		MKC_txt "${green} t.me/${red}MiKillCrafter"
	  MKC_txt "${green} ${blue}https://MiKillCrafter.ru/aiBash"
	  MKC_txt
		MKC_txt "${red}Сайт установлен по этому пути:"
    MKC_txt "${blue}$INSTALL_DIR"
      MKC_txt
        MKC_txt "${yellow}http://$DOMAIN/${red}phpmyadmin"
      MKC_txt
		MKC_txt "${red}Логин${green}: ${yellow}root"
		MKC_txt "${red}Пароль${green}: ${yellow}$MySQL_Password"
		MKC_txt
		MKC_txt
	MKC_txt
	MKC_txt "Всё готово [All done]"
	  MKC_txt "1 – Установить бесплатный SSL [Install free SSL]"
	  MKC_txt "2 – Меню [Menu]"
	  MKC_txt "0 – Выход [Exit]"
	MKC_txt
	read -p "Введи 0 чтобы завершить: " case
	case $case in
	  1) installCertificate;;
	  2) menu;;
	  0) exit;;
	esac
}

setup_server() {
  clear
    MKC_txt "Подготовка к установке:"
  sleep 3

  MKC_txt

  MKC_txt ">> a2dismod php$phpVer"
	a2dismod php$phpVer

	MKC_txt

  MKC_txt ">> service php$phpVer stop"
	service php$phpVer stop

  MKC_txt

	MKC_txt ">> /etc/init.d/apache2 stop"
	/etc/init.d/apache2 stop

	MKC_txt

  MKC_txt ">> service apache2 stop"
	service apache2 stop

	MKC_txt

  MKC_txt ">> systemctl stop apache2"
	systemctl stop apache2

	MKC_txt

  sleep 5
    check_os_update
  sleep 3

  MKC_txt

	MKC_txt "Выполняю: apt autoremove -y"
	  apt-get autoremove -y
	MKC_txt "Выполнено"

	MKC_txt

	MKC_txt "Выполняю: apt clean"
	  apt-get -y clean
	MKC_txt "Выполнено"

	MKC_txt

	MKC_txt "Выполняю: apt -y install --fix-missing"
	  apt-get -y install --fix-missing
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

  MKC_txt "${blue}[INSTALL]:${green} screen"
		sudo apt-get install -y screen
		sleep 2
	MKC_txt "${blue}[COMPLECTED]:${green} screen"

	MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} mc"
		sudo apt-get install -y mc
		sleep 2
	MKC_txt "${blue}[COMPLECTED]:${green} mc"

	MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} cpulimit"
		sudo apt-get install -y cpulimit
		sleep 2
	MKC_txt "${blue}[COMPLECTED]:${green} cpulimit"

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

	MKC_txt

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
  MKC_txt

  check_os_update

  clear
    MKC_txt "Устанавливаю серверные приложения"
  sleep 3

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} php$phpVer-cli"
	  sudo apt-get install -y php$phpVer-cli
	MKC_txt "${blue}[COMPLECTED]:${green} php$phpVer-cli"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} php$phpVer-mbstring"
	  sudo apt-get install -y php$phpVer-mbstring
	MKC_txt "${blue}[COMPLECTED]:${green} php$phpVer-mbstring"

	MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} apache2"
	  apt-get install -y apache2
	MKC_txt "${blue}[COMPLECTED]:${green} apache2"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} php$phpVer-mbstring"
	  apt-get install -y php$phpVer-mbstring
	MKC_txt "${blue}[COMPLECTED]:${green} php$phpVer-mbstring"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} libapache2-mod-php$phpVer"
	  apt-get install -y libapache2-mod-php$phpVer
	MKC_txt "${blue}[COMPLECTED]:${green} libapache2-mod-php$phpVer"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} mysql-server"
	  apt-get install -y mysql-server
	MKC_txt "${blue}[COMPLECTED]:${green} mysql-server"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} mysql-client"
	  apt-get install -y mysql-client
	MKC_txt "${blue}[COMPLECTED]:${green} mysql-client"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} php$phpVer-json"
	  apt-get install -y php$phpVer-json
	MKC_txt "${blue}[COMPLECTED]:${green} php$phpVer-json"

  MKC_txt

  MKC_txt "${blue}[INSTALL]:${green} php$phpVer-curl"
	  apt-get install -y php$phpVer-curl
	MKC_txt "${blue}[COMPLECTED]:${green} php$phpVer-curl"

	MKC_txt

	MKC_txt "Приложения установлены "
	sleep 5

	MKC_txt "${green}Настройка: PHPMyAdmin "
	  echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
	  echo "phpmyadmin phpmyadmin/mysql/admin-user string root" | debconf-set-selections
	  echo "phpmyadmin phpmyadmin/mysql/admin-pass password $MySQL_Password" | debconf-set-selections
	  echo "phpmyadmin phpmyadmin/mysql/app-pass password $MySQL_Password" |debconf-set-selections
	  echo "phpmyadmin phpmyadmin/app-password-confirm password $MySQL_Password" | debconf-set-selections
	  echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections
	MKC_txt "Команда: Настройка: PHPMyAdmin ${red}Выполнена ${green}"

	MKC_txt

	MKC_txt "${blue}[INSTALL]:${yellow} phpmyadmin"
	  sudo apt-get install -y phpmyadmin
	MKC_txt "${blue}[COMPLECTED]:${yellow} phpmyadmin"

	MKC_txt

	MKC_txt "Настраиваю Apache сервер"
	  STRING=$(apache2 -v | grep Apache/2.4)
	MKC_txt "Apache настроен"

	MKC_txt

	MKC_txt "Вношу изменения в файл конфигурации сервера"
	if [ "$STRING" = "" ]; then
		FILE='/etc/apache2/conf.d/aiBash'
		echo "<VirtualHost *:80>">$FILE
		echo "ServerName $DOMAIN">>$FILE
		echo "DocumentRoot $INSTALL_DIR">>$FILE
		echo "<Directory $INSTALL_DIR/>">>$FILE
		echo "Options Indexes FollowSymLinks MultiViews">>$FILE
		echo "AllowOverride All">>$FILE
		echo "Order allow,deny">>$FILE
		echo "allow from all">>$FILE
		echo "</Directory>">>$FILE
		echo "ErrorLog \${APACHE_LOG_DIR}/error.log">>$FILE
		echo "LogLevel warn">>$FILE
		echo "CustomLog \${APACHE_LOG_DIR}/access.log combined">>$FILE
		echo "</VirtualHost>">>$FILE
	else
		FILE='/etc/apache2/conf-enabled/aiBash.conf'
		cd /etc/apache2/sites-available
		sed -i "/Listen 80/d" *
		cd ~
		echo "Listen 80">$FILE
		echo "<VirtualHost *:80>">$FILE
		echo "ServerName $DOMAIN">>$FILE
		echo "DocumentRoot $INSTALL_DIR">>$FILE
		echo "<Directory $INSTALL_DIR/>">>$FILE
		echo "AllowOverride All">>$FILE
		echo "Require all granted">>$FILE
		echo "</Directory>">>$FILE
		echo "ErrorLog \${APACHE_LOG_DIR}/error.log">>$FILE
		echo "LogLevel warn">>$FILE
		echo "CustomLog \${APACHE_LOG_DIR}/access.log combined">>$FILE
		echo "</VirtualHost>">>$FILE
	fi
	MKC_txt "Конфигурация внесена"
	sleep 8

	MKC_txt

	clear
	  MKC_txt "Выполнение команд:"
	sleep 3

	MKC_txt

	MKC_txt ">> a2enmod rewrite"
	a2enmod rewrite

	MKC_txt

	MKC_txt ">> /etc/init.d/apache2 restart"
	/etc/init.d/apache2 restart

	MKC_txt

	MKC_txt ">> service apache2 restart"
	service apache2 restart

	MKC_txt

	MKC_txt ">> systemctl restart apache2"
	systemctl restart apache2

	MKC_txt

	MKC_txt ">> a2enmod php$phpVer"
	a2enmod php$phpVer

	MKC_txt

	MKC_txt ">> cd ~"
  cd ~

  MKC_txt

  MKC_txt "Выполнение команд завершено"
  sleep 5

  MKC_txt

  MKC_txt "Создаю, подключаю и очищаю каталог, где будет хранится сайт: ${red}$INSTALL_DIR${green} "
	  mkdir "$INSTALL_DIR"/
	  sudo chmod 777 "$INSTALL_DIR"/
	  cd "$INSTALL_DIR"/
	  rm -Rfv *
	MKC_txt "Каталог создан и подключен"
	sleep 5

	MKC_txt

	MKC_txt "Теперь создаю тестовый файл index.php "
    echo "<?php phpinfo(); ?>" > index.php
    MKC_txt "Выдаю права 777. Измените обязательно! "
    sudo chmod 777 ./*
    MKC_txt "Тестовый файл создан"
  sleep 5

	MKC_txt

	MKC_txt "Возвращаемся в домашний каталог"
	cd ~

	MKC_txt

	MKC_txt "${green}Задаю часовой пояс серверу: ${yellow}Europe/Moscow"
	  MKC_txt "${green} >> ${yellow}Europe/Moscow ${green}в ${yellow}/etc/timezone ${green}"
	    echo "Europe/Moscow" > /etc/timezone
	      dpkg-reconfigure tzdata -f noninteractive
	    MKC_txt "${green} >> Update: ${yellow}/etc/php/$phpVer/cli/php.ini ${green}"
        sudo sed -i -r 's~^;date\.timezone =$~date.timezone ="Europe/Moscow"~' /etc/php/$phpVer/cli/php.ini
	    #MKC_txt "${green}  >> Update: ${yellow}/etc/php/$phpVer/apache2/php.ini ${green}"
        #sudo sed -i -r 's~^;date\.timezone =$~date.timezone ="Europe/Moscow"~' /etc/php/$phpVer/apache2/php.ini
	  MKC_txt
	MKC_txt "${red}Часовой пояс установлен: Europe/Moscow"
	sleep 5

	MKC_txt

	MKC_txt "Перезапускаю модули Apache2 и MySQL"
	service apache2 restart
	service mysql restart
	MKC_txt "Команды перезапуска выполнены"
	sleep 5

	MKC_txt

	install_complected
}

################################################################################################

check_os_update() {
  MKC_txt "Обновляем пакеты"
    apt-get update -y
    apt-get upgrade -y
  MKC_txt "Завершаем обновление"
}

installCertificate()
{
	clear
	  check_os_update
	sleep 3

	MKC_txt

	MKC_txt "Добавляю репозиторий universe"
	  add-apt-repository -y universe
	MKC_txt "Репозиторий успешно добавлен"

	MKC_txt

	MKC_txt "Добавляю репозиторий certbot"
	  sudo add-apt-repository -y ppa:certbot/certbot
	MKC_txt "Репозиторий успешно добавлен"

	MKC_txt

	MKC_txt "Устанавливаю certbot && python-certbot-apache"
	  apt-get install -y certbot python-certbot-apache
	MKC_txt "Выполнено"

	MKC_txt

	MKC_txt "Устанавливаем только сертификат для Apache"
	  sudo certbot certonly --webroot -w "$INSTALL_DIR" -d "$DOMAIN" -d www."$DOMAIN"
	MKC_txt "Сертификат установлен"

	clear

	MKC_txt "[Ручная установка №1]: Введите публичный Email для аккаунта ACME и пройдите опрос"
	MKC_txt "${red}НАПОМИНАНИЕ:"
	MKC_txt "${red}Сайт установлен по этому пути: ${blue}$INSTALL_DIR"
	MKC_txt "${red}Ваш адрес сайта: ${yellow}http://$DOMAIN"
	sleep 10
	  sudo certbot certonly --standalone -d "$DOMAIN" -d www."$DOMAIN"
	  MKC_txt "Если всё прошло успешно, сертификат тут: /etc/letsencrypt/live/$DOMAIN/"
	MKC_txt "[Ручная установка №1]: Завершена"

	MKC_txt

	MKC_txt "Создаю сертификат"
	  MKC_txt "Введите цифру нужного домена или несколько цифр, разделённых запятой."
	  MKC_txt "Утилита сама установит всё, что нужно, а затем спросит вас,"
	  MKC_txt "нужно ли перенаправлять http-трафик на https:"
	  sleep 10
	  sudo certbot run --apache
	MKC_txt "Сертификат создан"

	MKC_txt

	MKC_txt "Обновляю сертификат"
	  sudo certbot certonly --apache -n -d "$DOMAIN" -d www."$DOMAIN"
	MKC_txt "Обновление завершено"

	MKC_txt

	MKC_txt "${green} Выполнение: ${blue}certbot renew --dry-run ${green}запушено:"
	  sudo certbot renew --dry-run
	MKC_txt "${green} Выполнение: ${blue}certbot renew --dry-run ${green}завершено"

	MKC_txt

	MKC_txt "${green}Installation complected"

	menu
}

updateCertificate()
{
  clear

	MKC_txt "Update cert only"
	  sudo certbot certonly --apache -n -d "$DOMAIN" -d www."$DOMAIN"
	  sudo certbot renew #--dry-run
	MKC_txt

	MKC_txt "Обновление завершено"
	menu
}

menu()
{
		MKC_txt
		MKC_txt "${red}Пожалуйста, оцените работу скрипта!"
		MKC_txt "${blue}Menu:"
		  MKC_txt "${green} - 1 – Настроить сервер [Setup server]"
		  MKC_txt "${green} - 2 – ${red}[beta] ${green}Установить бесплатный SSL {НЕ ПРОТЕСТИРОВАНО} [Install free SSL {NOT TESTED}]"
		  MKC_txt "${green} - 3 – ${red}[beta] ${green}Обновить истёкший SSL сертификат {НЕ ПРОТЕСТИРОВАНО} [Update an expired SSL certificate {NOT TESTED}]"
		  MKC_txt "${green} - 4 – Вернутся и изменить IP-адрес или папку для сайта [Back & replace IP or folder for the site]"
		  MKC_txt
		  MKC_txt "${red} - 0 – Выход [Exit]"
		MKC_txt
		read -p"${blue}Введи номер [Input number]: " case
		case $case in
			1) setup_server;;
			2) installCertificate;;
			3) updateCertificate;;
			4) InputArrayData;;
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
	MKC_txt "${green}Enter ${red}domain ${green}or ${red}IP: "
	read -p "${green}Введи ${red}домен ${green}или ${red}IP: ${green}" DOMAIN
	clear
	menu
}

start()
{
	clear
	if [ "$USER" = "root" ]; then
		MKC_txt "${blue}Ты точно хочешь запустить настройку Linux для Apache2, MySQL, PHP$phpVer?"
		MKC_txt "${blue}Are you sure u want to start setup the Linux for Apache2, MySQL, PHP$phpVer?"
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