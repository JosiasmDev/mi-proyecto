# Usa una imagen base de Python
FROM python:3.10

# Establece el directorio de trabajo
WORKDIR /app

# Copia solo el archivo requirements.txt y luego instala las dependencias
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copia el resto del código del proyecto
COPY . .

# Ejecuta collectstatic para los archivos estáticos (opcional)
# RUN python manage.py collectstatic --noinput

# Exponer el puerto dinámico proporcionado por Railway o por un entorno de Docker
EXPOSE $PORT

# Comando para iniciar Django con gunicorn
CMD ["sh", "-c", "gunicorn mi_proyecto.wsgi:application --bind 0.0.0.0:$PORT"]


# Establece la variable de entorno DJANGO_SETTINGS_MODULE
ENV DJANGO_SETTINGS_MODULE=mi_proyecto.settings
