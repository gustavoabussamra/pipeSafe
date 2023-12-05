#!/bin/bash

echo "Executando service.sh"

# Configura variaveis de ambiente
#export JAVA_HOME=/opt/jdk
echo $JAVA_HOME

# echo "Quem sou eu?"
# whoami

# echo "-------------------"
# echo "Listagem da pasta /opt/tomcat/conf/"
# ls -i /opt/tomcat/conf/

# echo "-------------------"

# Chamada do executavel
/opt/tomcat/bin/catalina.sh run
