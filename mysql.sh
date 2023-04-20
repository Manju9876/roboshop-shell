
echo -e "\e[31m >>>>>>>>>>>>>>>>>>>>>>>>> installing mysql <<<<<<<<<<<<<<<<<<<<<<<<<<\e[0m"
echo -e "\e[31m >>>>>>>>>>>>>>>>>>>>>>>>> diableing the mysql default version <<<<<<<<<<<<<<<<<<<<<<<<<<\e[0m"
dnf module disable mysql -y

echo -e "\e[31m >>>>>>>>>>>>>>>>>>>>>>>>> copying the repo file  <<<<<<<<<<<<<<<<<<<<<<<<<<\e[0m"
cp /home/centos/roboshop-shell/mysql.repo /etc/yum.repos.d/mysql.repo

echo -e "\e[31m >>>>>>>>>>>>>>>>>>>>>>>>> installign the mysql community verison <<<<<<<<<<<<<<<<<<<<<<<<<<\e[0m"
yum install mysql-community-server -y

echo -e "\e[31m >>>>>>>>>>>>>>>>>>>>>>>>> enabling and starting the mysql  <<<<<<<<<<<<<<<<<<<<<<<<<<\e[0m"
systemctl enable mysqld
systemctl start mysqld

echo -e "\e[31m >>>>>>>>>>>>>>>>>>>>>>>>>reset  mysql passwd <<<<<<<<<<<<<<<<<<<<<<<<<<\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1

echo -e "\e[31m >>>>>>>>>>>>>>>>>>>>>>>>> checking the new passwd is working are not  <<<<<<<<<<<<<<<<<<<<<<<<<<\e[0m"
mysql -uroot -pRoboShop@1