# Sistema de Rastreabilidade Agrícola

## Grupo 07

Integrantes:

- Mariana Padilha
- Leonardo Garcia
- Luis Calone

---

## Descrição

Este projeto implementa um sistema de rastreabilidade agrícola utilizando PostgreSQL.

O sistema permite:

- cadastro de usuários;
- gerenciamento de produtos agrícolas;
- controle de lotes;
- aplicação de insumos;
- movimentações logísticas;
- histórico de rastreabilidade.

---

## Pré-requisitos

Necessário possuir instalado:

- Docker
- Docker Compose

---

## PostgreSQL utilizado

Versão:

```text
PostgreSQL 16
```

---

## Estrutura do projeto

```text
projeto_db/

README.md
compose.yaml

sql/
│
├── 01_schema.sql
├── 02_dados.sql
├── 03_consultas.sql
└── 04_validacao.sql

diagramas/
│
├── modelo_conceitual.pdf
└── modelo_relacional.pdf
```

---

## Credenciais

Banco:

```text
rastreabilidade_agricola
```

Usuário:

```text
admin
```

Senha:

```text
admin123
```

Porta:

```text
5432
```

---

## Inicialização

Criar e iniciar ambiente:

```bash
docker compose up -d
```

Verificar execução:

```bash
docker compose ps
```

---

## Executar consultas

```bash
docker compose exec db psql -U admin -d rastreabilidade_agricola -c \
"\i /docker-entrypoint-initdb.d/03_consultas.sql"
```

---

## Executar validações

```bash
docker compose exec db psql -U admin -d rastreabilidade_agricola -c \
"\i /docker-entrypoint-initdb.d/04_validacao.sql"
```

---
## Encerrar ambiente

```bash
docker compose down
```

---

## Remover volumes

```bash
docker compose down -v
```

---

## Ordem de execução dos scripts

1. 01_schema.sql
2. 02_dados.sql
3. 03_consultas.sql
4. 04_validacao.sql

---

## Limitações conhecidas

- Não possui integração com sensores IoT;
- Não possui QR Codes dinâmicos;
- Não contempla monitoramento climático;
- Não contempla certificações agrícolas.

---

## Uso de Inteligência Artificial

Ferramenta utilizada:

ChatGPT (OpenAI)

Etapas utilizadas:

- Revisão textual;
- sugestões de modelagem;
- revisão de consultas SQL;
- auxílio na documentação.

Todo conteúdo gerado foi revisado e validado pelos integrantes do grupo.
