FROM python:3.11-slim

# Instalar Chrome e ChromeDriver
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    curl \
    chromium-driver \
    chromium \
    && apt-get clean

RUN mkdir -p /tmp/chrome && chmod -R 777 /tmp/chrome


# Definir variáveis para o Chrome no Selenium
ENV ROBOT_OPTIONS="--variable BROWSER:Chrome"

# Instalar bibliotecas Python
COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt

# Copiar código do projeto para dentro da imagem
COPY . /app

# Comando padrão
CMD ["robot", "--outputdir", "output", "tests/functional-tests"]
