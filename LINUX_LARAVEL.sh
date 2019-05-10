# UPDATE PHP FROM 5.6 TO 7.2
sudo yum remove php56* -y
sudo yum install php72* -y

#INSTALL COMPOSER
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash\_file('SHA384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP\_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer


# INSTALL LARAVEL:
composer create-project laravel/laravel
shopt -s expand_aliases
alias laravel="cd ~/environment/laravel"

# INSTALL WORKING NODE PACKAGES:
rm -rf ~/node_modules
laravel
npm install

# CREATE SQLITE DATABASE. CONFIGURE .ENV
touch  database/database.sqlite
printf '%s\n' ':%s/DB_CONNECTION=mysql/DB_CONNECTION=sqlite/g' 'x'  | sudo ex .env
printf '%s\n' ':%s/DB_HOST=127.0.0.1/#  DB_HOST=127.0.0.1/g' 'x'  | sudo ex .env
printf '%s\n' ':%s/DB_PORT=3306/#  DB_PORT=3306/g' 'x'  | sudo ex .env
printf '%s\n' ':%s/DB_DATABASE=homestead/#  DB_DATABASE=homestead/g' 'x'  | sudo ex .env
printf '%s\n' ':%s/DB_USERNAME=homestead/#  DB_USERNAME=homestead/g' 'x'  | sudo ex .env
printf '%s\n' ':%s/DB_PASSWORD=secret/#  DB_PASSWORD=/g' 'x'  | sudo ex .env
rm -rf ~/environment/LINUX_LARAVEL.sh
# LAUNCH LARAVEL:
php artisan migrate
php artisan serve --port=8080
# from the AWS Cloud9 console menu choose Preview --> Preview Running Application

#Edited by Bretfelean Sorin Cristian

