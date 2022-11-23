#!/bin/bash
PACKAGE_URL=https://ftp.postgresql.org/pub/source/v15.1/postgresql-15.1.tar.bz2

echo $(date) 'Fetching postgresql version 15...'
wget "$PACKAGE_URL"
echo 'DÉCOMPRESSING package...'
tar xf postgresql-15.1.tar.bz2
cd postgresql-15.1
echo 'CONFIGURING package...'
./configure
echo 'MAKE package...'
make 
echo 'INSTALLING package...'
sudo make install
echo $(date) 'DONE'
echo 'ENTERING USR/LOCAL/PGSQL/BIN DIR...'
cd /usr/local/pgsql/bin
echo 'ATTRIBUTING PRIVILEGES TO USER POSTGRES...'
sudo chown postgres /usr/local/pgsql/
echo 'INITILIALIZING DATABASE...'
./initdb -D /usr/local/pgsql/data
echo 'STARTING DB...'
./pg_ctl -D /usr/local/pgsql/data start
echo 'done :p'