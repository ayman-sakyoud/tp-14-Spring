#!/bin/bash

APP_NAME="mon-application-spring-boot.jar"

echo "Compilation du projet Spring Boot..."
mvn clean package -DskipTests

echo "Déploiement de la nouvelle version..."

echo "Arrêt de l'instance précédente de $APP_NAME..."
pgrep -f "$APP_NAME" | xargs kill -9 2>/dev/null

nohup java -jar target/*.jar > logs/deploy.log 2>&1 &

echo "Nouvelle version déployée avec succès (PID : $!)"