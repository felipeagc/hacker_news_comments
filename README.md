# Hacker news comments

Esse é um exemplo de pipeline de dados usando a ferramenta dbt.

A partir de um dataset de comentários do Hacker News, é extraída uma tabela com os últimos 3 meses de dados no dataset.

O sistema de banco de dados [DuckDB](https://duckdb.org/) é utilizado para armazenar os resultados da pipeline.

## Instruções para rodar

### Requisitos

O projeto utiliza a ferramenta de gerenciamento de dependências python [poetry](https://python-poetry.org/).

### Instalação das dependências

Tanto a ferramenta dbt como outras bibliotecas são instaladas com o comando:

```bash
poetry install
```

Após a instalação, pode-se obter uma shell com as dependências configuradas no `PATH` usando o seguinte comando:

```bash
poetry shell
```

### Configurando profile dbt

Precisamos configurar um profile do dbt com o nome `hacker_news_comments` no arquivo `$HOME/.dbt/profiles.yml` para executar os modelos. Exemplo:

```yaml
hacker_news_comments:
  outputs:
    dev:
      type: duckdb
      path: dev.duckdb
      threads: 1

    prod:
      type: duckdb
      path: prod.duckdb
      threads: 4

  target: dev
```

### Obtendo os dados

Os dados crus podem ser obtidos rodando o script `fetch_data.py`:

```bash
python fetch_data.py
```

Os dados serão salvos no arquivo `hacker_news_raw.parquet` na pasta `data/` no formato parquet.

### Rodando a pipeline

Executamos a pipeline com o comando `dbt build` na pasta `hacker_news_comments`.

```bash
cd hacker_news_comments
dbt build
```

Ao executar o comando `dbt build`, os modelos e testes serão executados.

Os resultados da pipeline estarão nos arquivos especificados no profile do dbt.
No caso do profile citado no exemplo, no ambiente dev, os resultados serão armazenados no arquivo `dev.duckdb` na pasta `hacker_news_comments`.
