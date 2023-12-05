FROM openjdk:11
#FROM openjdk:11-jdk-slim
#FROM tomcat:9.0.17-jre11

RUN apt-get update
RUN apt-get install -y curl

ARG ARTIFACT_URL

ENV ARTIFACT_URL=http://10.41.28.164:8080/io.cronapp.apps.safetymoment-1.0-SNAPSHOT.war

RUN echo "ARTIFACT_URL = $ARTIFACT_URL"

# Pega arquivos em resources
COPY resources /opt/

# Pega scripts da imagem e executa
COPY scripts /opt/scripts/

# Muda permissoes
RUN chmod u+x /opt/scripts/*.sh
#RUN chown app:app /opt/scripts/service.sh

# Executa setup.sh
RUN /opt/scripts/setup.sh

# Executa deploy.sh
RUN /opt/scripts/deploy.sh

# Executa service.sh
#USER app
CMD ["/opt/scripts/service.sh"]

# Porta do servico
EXPOSE 8080
