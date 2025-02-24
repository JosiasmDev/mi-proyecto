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

# Exponer el puerto. Usamos un valor fijo o la variable de entorno
EXPOSE 8000

# Comando para iniciar Django con gunicorn
CMD ["gunicorn", "mi_proyecto.wsgi:application", "--bind", "0.0.0.0:8000"]

# Establece la variable de entorno DJANGO_SETTINGS_MODULE
ENV DJANGO_SETTINGS_MODULE=mi_proyecto.settings
