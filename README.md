# 📚 Confiabilidade e Manutenção: Aplicações em R

📖 Livro interativo sobre análise de confiabilidade e estratégias de manutenção usando R

[![Deploy Book](https://github.com/seu-usuario/QuartoBook/actions/workflows/publish.yml/badge.svg)](https://github.com/seu-usuario/QuartoBook/actions/workflows/publish.yml)

## 📖 Sobre o Livro

Este livro oferece uma abordagem **prática e aplicada** sobre **confiabilidade** e **manutenção industrial**, com implementações completas em **R**. Todos os exemplos são reproduzíveis e incluem código completo.

### Conteúdo

**Parte I: Contexto e Aplicação em Mineração**
- Introdução à Confiabilidade na Mineração
- Performance de Equipamentos de Mineração
- Fatores Moderadores da Confiabilidade

**Parte II: Fundamentos de Confiabilidade**
- Fundamentos de Confiabilidade
- Distribuições de Probabilidade para Vida Útil
- Estimação de Parâmetros e Inferência
- Análise de Dados de Falha com R
- Modelagem Weibull na Prática
- Análise de Sobrevivência e Modelos de Cox

**Parte III: Estratégias de Manutenção**
- Manutenção Preventiva e Otimização de Políticas
- Manutenção Preditiva com Dados de Sensores

**Parte IV: Tópicos Avançados**
- Modelos de Confiabilidade de Sistemas
- Simulação Monte Carlo
- Estudos de Caso Industriais
- Governança de Dados e Boas Práticas

**Público-alvo:** Engenheiros de confiabilidade, analistas de manutenção, cientistas de dados, estudantes e profissionais da indústria.

## 🚀 Quick Start

### 1. Instalar Dependências

```bash
# Instalar pacotes R
Rscript resources/install_packages.R
```

### 2. Visualizar Livro

```bash
quarto preview
```

Abre automaticamente no navegador com hot reload.

### 3. Renderizar Completo

```bash
# HTML (padrão)
quarto render

# PDF (requer LaTeX)
quarto render --to pdf
```

## 📁 Estrutura

```
QuartoBook/
├── _quarto.yml              # Configuração do livro
├── index.qmd                # Página inicial
├── preface.qmd              # Prefácio
├── requirements.qmd         # Como usar
├── setup.qmd                # Instalação
├── chapters/                # 15 capítulos principais
│   ├── 01-introducao.qmd
│   ├── 02-performance-mineracao.qmd
│   ├── 03-fatores-moderadores.qmd
│   ├── 04-fundamentos.qmd
│   ├── 05-distribuicoes.qmd
│   ├── 06-estimacao.qmd
│   ├── 07-analise-falhas.qmd
│   ├── 08-weibull.qmd
│   ├── 09-sobrevivencia.qmd
│   ├── 10-manutencao-preventiva.qmd
│   ├── 11-manutencao-preditiva.qmd
│   ├── 12-sistemas.qmd
│   ├── 13-simulacao.qmd
│   ├── 14-estudos-caso.qmd
│   └── 15-governanca.qmd
├── appendices/              # Apêndices
│   ├── A-pacotes.qmd
│   ├── B-templates.qmd
│   └── C-cheatsheet.qmd
├── resources/               # Scripts e dados
│   ├── data/               # Dados de exemplo
│   ├── scripts/            # Scripts R auxiliares
│   └── images/             # Figuras
├── docs/                    # Output renderizado
├── summary.qmd              # Considerações finais
├── references.qmd           # Referências
└── README.md                # Este arquivo
```

## ✏️ Adicionar Capítulo

1. Criar arquivo `.qmd`:

```bash
touch novo-capitulo.qmd
```

2. Adicionar conteúdo:

```markdown
# Título do Capítulo

## Seção

Texto aqui...

```{r}
# Código R
library(ggplot2)
ggplot(mtcars, aes(mpg, hp)) + geom_point()
```
```

3. Registrar em `_quarto.yml`:

```yaml
book:
  chapters:
    - index.qmd
    - novo-capitulo.qmd  # <-- adicionar aqui
    - references.qmd
```

## 🎨 Personalizar

### Tema

Edite `_quarto.yml`:

```yaml
format:
  html:
    theme: cosmo  # flatly, litera, minty, etc.
```

### Opções de Código

```yaml
execute:
  echo: true          # mostrar código
  warning: false      # esconder warnings
  cache: true         # usar cache
```

## 📦 Pacotes R Necessários

```r
install.packages(c(
  "knitr",
  "rmarkdown",
  "dplyr",
  "ggplot2"
))
```

## 🌐 Hospedagem

Este livro pode ser hospedado em várias plataformas:

### GitHub Pages (Recomendado)

```bash
# 1. Criar repositório no GitHub
# 2. Push do código
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/rafasfer2/QuartoBook.git
git push -u origin main

# 3. Habilitar GitHub Pages
# Settings → Pages → Source: GitHub Actions
```

O GitHub Actions renderiza e publica automaticamente em: `https://rafasfer2.github.io/QuartoBook/`

### Quarto Pub

```bash
quarto publish quarto-pub
```

### Netlify

```bash
# 1. Criar conta em netlify.com
# 2. Conectar repositório GitHub
# 3. Configurar:
#    Build command: quarto render
#    Publish directory: docs
```

### Vercel

```bash
# 1. Criar conta em vercel.com
# 2. Import repositório
# 3. Configurar:
#    Build command: quarto render
#    Output directory: docs
```

## 🔗 Links Úteis

- [Quarto Documentation](https://quarto.org/)
- [Quarto Books Guide](https://quarto.org/docs/books/)
- [R for Data Science](https://r4ds.hadley.nz/)

## 💻 Desenvolvimento

### Com RStudio Desktop

- Desenvolver código R no RStudio
- Editar `.qmd` no VS Code
- Preview automático

### Atalhos VS Code

- `Ctrl+Shift+K` - Preview
- `Ctrl+Enter` - Executar chunk/linha
- `Ctrl+Shift+Enter` - Executar chunk completo

---

**Versões:**
- Quarto: 1.6.39
- R: 4.5.1
- Criado: 21/11/2025
