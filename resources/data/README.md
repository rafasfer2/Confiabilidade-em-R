# Datasets do Livro

## Arquivos Disponíveis

### falhas.csv
Dados básicos de falhas para exemplos introdutórios.

**Colunas:**
- `ativo`: Identificador do equipamento
- `tempo_ate_falha`: Tempo até falha (horas)
- `censura`: 0 = falha observada, 1 = censurado

### falhas_bombas.csv
Histórico detalhado de falhas em bombas industriais.

**Colunas:**
- `equipamento`: ID da bomba
- `data_instalacao`: Data de instalação
- `data_falha`: Data da falha (NA se censurado)
- `horas_operacao`: Horas de operação
- `tipo_falha`: Tipo (mecânica, elétrica, hidráulica)
- `severidade`: Nível (baixa, média, alta)
- `custo_reparo`: Custo em R$

### sensores_compressor.csv
Dados de sensores para manutenção preditiva.

**Colunas:**
- `timestamp`: Data e hora da leitura
- `temperatura`: Temperatura (°C)
- `vibracao`: Nível de vibração (mm/s)
- `pressao`: Pressão (bar)
- `corrente`: Corrente elétrica (A)
- `status`: Status do equipamento

## Uso

```r
# Carregar dados
library(readr)
dados <- read_csv("resources/data/falhas.csv")

# Ou com caminho relativo
library(here)
dados <- read_csv(here("resources/data/falhas.csv"))
```

## Fonte

Dados sintéticos gerados para fins educacionais.
