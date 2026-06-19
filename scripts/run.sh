#!/bin/bash
PORT=8086
LOG_DIR="logs"
LOG_FILE="$LOG_DIR/app.log"

echo "Préparation du lancement sur le port $PORT..."
mkdir -p "$LOG_DIR"

echo "Démarrage de l'application..."
nohup mvn spring-boot:run -Dspring-boot.run.arguments="--server.port=$PORT" > "$LOG_FILE" 2>&1 &

echo $! > "$LOG_DIR/app.pid"

echo "Application démarrée avec succès (PID : $!)"
echo "Les logs sont disponibles dans : $LOG_FILE"