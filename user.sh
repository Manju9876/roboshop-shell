echo -e "\e[32m>>>>>>>>>>>>>> download the repo file  <<<<<<<<<<<<<<<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[32m>>>>>>>>>>>>>> install node js  <<<<<<<<<<<<<<<<<<<\e[0m"
yum install nodejs -y

echo -e "\e[32m>>>>>>>>>>>>>> crate a user  <<<<<<<<<<<<<<<<<<<\e[0m"
useradd roboshop

echo -e "\e[32m>>>>>>>>>>>>>> crate app directory <<<<<<<<<<<<<<<<<<<\e[0m"
rm -rf /app
mkdir /app

echo -e "\e[32m>>>>>>>>>>>>>> downloading and unziping the content tp /app directory <<<<<<<<<<<<<<<<<<<\e[0m"
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip

echo -e "\e[32m>>>>>>>>>>>>>> installing the dependencies  <<<<<<<<<<<<<<<<<<<\e[0m"
npm install

echo -e "\e[32m>>>>>>>>>>>>>> copying the configuration file to systemd <<<<<<<<<<<<<<<<<<<\e[0m"
cp /home/centos/roboshop-shell/user.service /etc/systemc/system/user.service

echo -e "\e[32m>>>>>>>>>>>>>> reloading the schema <<<<<<<<<<<<<<<<<<<\e[0m"
systemctl daemon-reload

echo -e "\e[32m>>>>>>>>>>>>>> starting and enabling the schema <<<<<<<<<<<<<<<<<<<\e[0m"
systemctl enable user
systemctl start user

echo -e "\e[32m>>>>>>>>>>>>>> copying the repo file of mongodb to yum.repos.d <<<<<<<<<<<<<<<<<<<\e[0m"
cp /home/centos/roboshop-shell/mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[32m>>>>>>>>>>>>>> installing the mongodb client<<<<<<<<<<<<<<<<<<<\e[0m"
yum install mongodb-org-shell -y

echo -e "\e[32m>>>>>>>>>>>>>> loading the schema to mongoddb server <<<<<<<<<<<<<<<<<<<\e[0m"
mongo --host mongodb-dev.manju-devops.online </app/schema/user.js
