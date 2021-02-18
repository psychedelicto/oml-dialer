#!/bin/bash

RELEASE=main
OMLCOMP=dialer
OMLDIR=/opt/omnileads/
REPO_DIALER=https://github.com/psychedelicto/oml-dialer
REPO_MYSQL=https://github.com/psychedelicto/oml-mysql

# mysql_host=localhost
# mysql_database=wombat
# mysql_username=wombat
# mysql_password=admin123

yum install -y git

cd /var/tmp
git clone $REPO_DIALER
cd oml-dialer
git checkout $RELEASE

if [[ "$mysql_host" == "localhost" ]]
then
git clone $REPO_MYSQL
cd oml-mysql
chmod +x ./mariadb/mariadb.sh
sh ./mariadb/mariadb.sh $mysql_username $mysql_password localhost
fi
chmod +x ./dialer/files/dialer.sh
sh ./dialer/files/dialer.sh $mysql_host $mysql_database $mysql_username $mysql_password

reboot
