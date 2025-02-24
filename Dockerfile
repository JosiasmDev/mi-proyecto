# Usa una imagen base de Python
FROM python:3.10

# Establece el directorio de trabajo
WORKDIR /app

# Copia solo el archivo requirements.txt y luego instala las dependencias
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copia el resto del código del proyecto
COPY . .

# Exponer el puerto
EXPOSE 8000

# Establece variables de entorno
ENV DJANGO_SETTINGS_MODULE=mi_proyecto.settings
ENV PORT=8000  # Fallback para local

# No usamos CMD, dejamos que Railway use el Procfile