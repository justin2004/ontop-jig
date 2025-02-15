FROM debian:12.8
RUN apt-get update && apt-get install -y openjdk-17-jre
RUN apt-get install -y wget unzip netcat-traditional
WORKDIR /app
RUN wget 'https://github.com/ontop/ontop/releases/download/ontop-5.2.1/ontop-cli-5.2.1.zip' && unzip ontop-cli-5.2.1.zip
WORKDIR /app/lib
RUN wget 'https://repo1.maven.org/maven2/io/trino/trino-jdbc/470/trino-jdbc-470.jar'
RUN wget 'https://jdbc.postgresql.org/download/postgresql-42.7.4.jar'
COPY ./logback.xml /app/log/logback.xml
WORKDIR /app
