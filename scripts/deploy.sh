#!/bin/bash

echo "Executando deploy.sh"

# Pasta alvo padrao para artefato
cd /opt/deploy

echo $ARTIFACT_URL

# Pega artefato pela URL temporaria e renomeia para ROOT.war
curl -k -o ROOT.war $(echo $ARTIFACT_URL)

echo "Artefato baixado." 

# Move artefato para pagina de aplicacoes do TOMCAT
mv ROOT.war /opt/tomcat/webapps/

# Muda permissoes para usuario de servico do container
#chown -R app:app /opt/tomcat/webapps
