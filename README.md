# 🐳 Contenedor Base para CI/CD con Godot (Headless)

Este contenedor Docker proporciona un entorno listo para compilar y ejecutar proyectos en **Godot Engine 4.4** en modo **headless** (sin interfaz gráfica), ideal para pipelines de **CI/CD**.

---

## 📦 ¿Qué hace este Dockerfile?

###  🔹 Imagen base
```
FROM ubuntu:24.04
```
Utiliza **Ubuntu 24.04** como base del sistema operativo.

### 🔹 Evita prompts interactivos durante la instalación
```
ENV DEBIAN_FRONTEND=noninteractive
```
Configura el entorno de instalación de `apt` para que no solicite confirmaciones

### 🔹 Instalación de dependencias
```
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    libx11-6 \
    libxcursor1 \
    libxrandr2 \
    libxi6 \
    libgl1 \
    libfontconfig1 \
    libglib2.0-0 \ 
    && rm -rf /var/lib/apt/lists/*
```

- Actualiza los repositorios de paquetes.
- Instala herramientas necesarias (`wget`, `unzip`) para descargar y preparar Godot.
- Instala librerías del sistema que Godot **requiere** para ejecutarse incluso en modo headless.
- Limpia la caché de `apt` para reducir el tamaño de la imagen final.

### 🔹 Instalación de dependencias
```
RUN wget https://github.com/godotengine/godot/releases/download/4.4-stable/Godot_v4.4-stable_linux.x86_64.zip -O /tmp/godot.zip && \
    unzip /tmp/godot.zip -d /usr/local/bin && \
    rm /tmp/godot.zip && \
    chmod +x /usr/local/bin/Godot_v4.4-stable_linux.x86_64 && \
    ln -s /usr/local/bin/Godot_v4.4-stable_linux.x86_64 /usr/local/bin/godot

```

- Descarga Godot directamente desde GitHub.
- Lo descomprime y lo ubica en /usr/local/bin.
- Otorga permisos de ejecución.
- Crea un alias llamado godot para facilitar su ejecución.

### 🔹 Comando por defecto del contenedor

```
CMD ["godot", "--headless"]
```
Ejecuta Godot en modo **headless**
