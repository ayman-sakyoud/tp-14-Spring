#!/bin/bash
LOG_FILE="logs/app.log"

echo "--- Affichage des 30 dernières lignes de : $LOG_FILE ---"

if [ -f "$LOG_FILE" ]; then
    tail -n 30 "$LOG_FILE"
else
    echo "Erreur : Le fichier $LOG_FILE est introuvable."
    exit 1
fi