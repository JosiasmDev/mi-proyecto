#!/bin/sh

# Imprimir el valor del puerto para ver si está siendo pasado correctamente
echo "Puerto usado: $PORT"

# Usa un valor por defecto si no se ha establecido el puerto
PORT=${PORT:-8080}

# Ejecuta gunicorn usando el puerto especificado
exec gunicorn mi_proyecto.wsgi:application --bind 0.0.0.0:$PORT
