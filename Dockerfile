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
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Exponer el puerto 8000
EXPOSE 8000

# Comando para ejecutar el script de inicio
CMD ["/app/start.sh"]

# Establece la variable de entorno DJANGO_SETTINGS_MODULE
ENV DJANGO_SETTINGS_MODULE=mi_proyecto.settings
