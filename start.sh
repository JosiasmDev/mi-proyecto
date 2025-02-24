#!/bin/sh

# Usa un valor por defecto si no se ha establecido el puerto
PORT=${PORT:-8000}

# Ejecuta gunicorn usando el puerto especificado
exec gunicorn mi_proyecto.wsgi:application --bind 0.0.0.0:$PORT
