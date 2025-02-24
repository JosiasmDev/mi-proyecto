#!/bin/bash

# Imprime el valor de PORT para depurar
echo "PORT is set to: $PORT"

# Usa el valor de $PORT si existe, o 8080 como fallback
PORT=${PORT:-8080}

# Imprime el valor final de PORT
echo "Final PORT value: $PORT"

# Inicia Gunicorn
gunicorn mi_proyecto.wsgi:application --bind 0.0.0.0:$PORT --workers 2