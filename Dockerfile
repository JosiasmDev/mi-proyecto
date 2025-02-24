# Usa una imagen base de Python
FROM python:3.10

# Establece el directorio de trabajo
WORKDIR /app

# Copia solo el archivo requirements.txt y luego instala las dependencias
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copia el resto del código del proyecto
COPY . .

# Copia el script de inicio
COPY start.sh /mi_proyecto/start.sh
RUN chmod +x /mi_proyecto/start.sh

# Exponer el puerto 8080
EXPOSE 8080

# Establece la variable de entorno DJANGO_SETTINGS_MODULE
ENV DJANGO_SETTINGS_MODULE=mi_proyecto.settings

# Comando para ejecutar el servidor Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]