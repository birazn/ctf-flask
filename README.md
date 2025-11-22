# CTF Flask

> **Aviso:** este repositório é **apenas para fins educativos**. Não use as técnicas aqui descritas para invadir, explorar ou comprometer sistemas sem autorização explícita. Este repositório é um *fork* do projeto [`birazn/ctf-flask`](https://github.com/birazn/ctf-flask) e contém 4 desafios intencionais para prática de segurança web.

## Visão geral

O projeto é uma pequena aplicação Flask com **4 desafios** (Fase 1 a Fase 4) destinados a exercitar vulnerabilidades comuns: HTML Injection, Access Control, SQL Injection e IDOR. A aplicação está containerizada em Docker para facilitar o uso local.

---

## Como instalar e executar

### Pré-requisitos

* [Docker](https://docs.docker.com/) (ou Python 3.8+ se preferir rodar localmente sem container)

### Usando Docker

1. Clonar o repositório:

```bash
git clone https://github.com/gustavogordoni/ctf-flask.git
cd ctf-flask
```

2. Construir a imagem Docker (opcional — pode já existir uma `Dockerfile`):

```bash
docker build -t ctf-flask .
```

3. Executar o container expondo a porta 5000 (padrão Flask):

```bash
docker run --rm -p 5000:5000 --name ctf-flask ctf-flask
```

Agora a aplicação estará disponível em `http://localhost:5000`.

---

## Estrutura dos desafios e *minhas resoluções*

> Abaixo estão minhas anotações e resoluções. Elas descrevem o comportamento observado e os passos para explorar cada vulnerabilidade.

[Resolução](RESOLUTION.md)
