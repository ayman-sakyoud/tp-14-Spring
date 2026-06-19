#!/bin/bash

PORT=8086
PID_FILE="logs/app.pid"
if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    echo "Arrêt du processus $PID identifié dans $PID_FILE..."
    kill -9 "$PID" 2>/dev/null
    rm "$PID_FILE"
    echo "Application arrêtée."
    exit 0
fi
echo "Fichier PID introuvable. Recherche du processus sur le port $PORT..."
PID=$(lsof -t -i:$PORT)

if [ -z "$PID" ]; then
    echo "Aucun processus trouvé sur le port $PORT."
else
    echo "Processus trouvé sur le port $PORT (PID: $PID). Arrêt en cours..."
    kill -9 "$PID"
    echo "Processus $PID arrêté avec succès."
fi