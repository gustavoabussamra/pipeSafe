#!/bin/bash

echo "Running setup.sh"

# Instala Tomcat
cd /opt
tar zxvf apache*.tar.gz; rm -f *.tar.gz

# Pega nome da pasta de instalacao
TOMCAT_FOLDER_NAME=$(find /opt/ -maxdepth 1 -type d -name 'apache*' -printf '%f\n')

# Cria link estatico
ln -s /opt/$TOMCAT_FOLDER_NAME /opt/tomcat

# Move arquivo de configuracao de memoria
mv setenv.sh /opt/tomcat/bin/

# Remove aplicacoes de exemplo
rm -rf /opt/tomcat/webapps/*

whoami

# Muda permissoes para usuario de servicos do container
#chown -R app:app /opt/$TOMCAT_FOLDER_NAME
# find /opt/tomcat/ -type d -exec chmod 755 {} \;
# find /opt/tomcat/ -type f -exec chmod 644 {} \;
chmod -R 777 /opt/tomcat/
chmod u+x /opt/tomcat/bin/*.sh
#chmod ugo+rx /opt/tomcat/conf/server.xml

# Cria pasta de deploy para artefato
mkdir /opt/deploy
