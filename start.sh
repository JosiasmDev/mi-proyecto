#!/bin/bash

# Usa el valor de $PORT si existe, o 8080 como fallback
PORT=${PORT:-8080}

# Inicia Gunicorn
gunicorn mi_proyecto.wsgi:application --bind 0.0.0.0:$PORT --workers 2