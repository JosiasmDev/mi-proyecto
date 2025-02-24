#!/bin/sh

# Si no se ha especificado el puerto, usar el puerto 8000 como valor por defecto
PORT=${PORT:-8000}

# Ejecutar gunicorn con el puerto especificado
exec gunicorn mi_proyecto.wsgi:application --bind 0.0.0.0:$PORT