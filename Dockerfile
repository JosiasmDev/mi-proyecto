# Usa una imagen base de Python
FROM python:3.10

# Establece el directorio de trabajo
WORKDIR /app

# Copia solo el archivo requirements.txt y luego instala las dependencias
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copia el resto del código del proyecto (incluye start.sh que está en la raíz)
COPY . .

# Copia el script de inicio a una ubicación específica y dale permisos
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Exponer el puerto
EXPOSE 8080

# Establece variables de entorno (comentarios separados en líneas distintas)
ENV DJANGO_SETTINGS_MODULE=mi_proyecto.settings
# Valor por defecto para local
ENV PORT=8080

# Usa el script de inicio
CMD ["/app/start.sh"]