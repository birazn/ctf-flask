# Usar uma imagem base oficial do Python
FROM python:3.11-slim

# Definir o diretório de trabalho no contêiner
WORKDIR /app

# Copiar os arquivos de dependências
COPY pyproject.toml uv.lock* ./

# Instalar as dependências
# Primeiro, instalamos o pip para garantir que temos uma versão recente
RUN pip install --upgrade pip
# Instalar as dependências do projeto
RUN pip install .

# Copiar o restante do código da aplicação para o diretório de trabalho
COPY . .

# Expor a porta em que a aplicação Flask roda
EXPOSE 5000

# Definir a variável de ambiente para o Flask
ENV FLASK_APP=app.py

# Comando para iniciar a aplicação
CMD ["flask", "run", "--host=0.0.0.0"]
