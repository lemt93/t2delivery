#!/bin/bash
PROJECT_NAME='t2delivery'
SOURCE_PATH=/home/ubuntu/github/$PROJECT_NAME
NGINX_SITE_PATH=/var/www/$PROJECT_NAME

echo "Application start"
cd $SOURCE_PATH
yarn install
yarn run build
sudo cp -Rf $SOURCE_PATH/dist/. $NGINX_SITE_PATH
sudo cp $SOURCE_PATH/aws-codedeploy/nginx/nginx.conf /etc/nginx/nginx.conf
sudo cp $SOURCE_PATH/aws-codedeploy/nginx/$PROJECT_NAME.conf /etc/nginx/conf.d/$PROJECT_NAME.conf
sudo service nginx restart
