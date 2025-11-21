# 📚 Setup do Projeto Quarto Book

## ✅ Pré-requisitos Instalados

- **Quarto CLI**: 1.6.39
- **R**: 4.5.1
- **VS Code Extensions**:
  - Quarto (quarto.quarto)
  - R (reditorsupport.r)
  - R Debugger (rdebugger.r-debugger)
  - GitLens (eamodio.gitlens)

## 📁 Estrutura do Projeto

```
QuartoBook/
├── .vscode/
│   └── settings.json       # Configurações VS Code
├── .Rprofile              # Configurações R
├── .gitignore             # Arquivos ignorados
├── _quarto.yml            # Configuração do book
├── index.qmd              # Homepage
├── intro.qmd              # Introdução
├── summary.qmd            # Análises
├── references.qmd         # Referências
├── references.bib         # Bibliografia
├── README.md              # Documentação principal
├── SETUP.md               # Este arquivo
└── _book/                 # Output (não versionado)
```

## 🚀 Comandos Principais

### Preview (Hot Reload)

```bash
quarto preview
```

Abre no navegador e recarrega automaticamente a cada mudança.

### Renderizar

```bash
# HTML
quarto render

# PDF (requer LaTeX)
quarto render --to pdf

# Todos os formatos
quarto render --to all
```

### Limpar Cache

```bash
rm -rf _book/ .quarto/ *_cache/ *_files/
```

### Verificar Instalação

```bash
quarto check
```

## ✏️ Workflow de Desenvolvimento

### 1. Adicionar Novo Capítulo

```bash
# Criar arquivo
touch novo-capitulo.qmd

# Editar conteúdo
code novo-capitulo.qmd
```

Adicionar em `_quarto.yml`:

```yaml
book:
  chapters:
    - index.qmd
    - novo-capitulo.qmd  # <-- aqui
    - references.qmd
```

### 2. Escrever Conteúdo

Exemplo de `.qmd`:

```markdown
# Título do Capítulo

## Introdução

Texto explicativo...

## Análise com R

```{r}
#| label: analise
#| fig-cap: "Gráfico de exemplo"
#| echo: true

library(ggplot2)
ggplot(mtcars, aes(mpg, hp)) +
  geom_point() +
  theme_minimal()
```

## Conclusão

Mais texto...
```

### 3. Preview e Ajustar

1. Execute: `quarto preview`
2. Edite os arquivos `.qmd`
3. Salve → browser recarrega automaticamente

## 🎨 Personalização

### Temas Disponíveis

**Light**: cosmo, flatly, journal, litera, lumen, materia, minty, morph, pulse, sandstone, simplex, sketchy, spacelab, united, yeti, zephyr

**Dark**: cyborg, darkly, slate, solar, superhero, vapor

Editar em `_quarto.yml`:

```yaml
format:
  html:
    theme:
      light: flatly
      dark: darkly
```

### Opções de Código

```yaml
execute:
  echo: true          # Mostrar código
  warning: false      # Esconder warnings
  message: false      # Esconder mensagens
  cache: true         # Usar cache
  freeze: auto        # Congelar outputs
```

## 🔧 Integração com RStudio Desktop

### Workflow Recomendado

1. **RStudio Desktop**: Desenvolver e testar código R
   - Console interativo
   - Debugging
   - Visualização de dados

2. **VS Code**: Editar e gerenciar o book
   - Preview do Quarto
   - Git/GitHub
   - GitHub Copilot

### Passos

1. Abrir RStudio Desktop
2. Abrir VS Code neste diretório
3. Desenvolver código no RStudio
4. Copiar para `.qmd` no VS Code
5. Preview com `quarto preview`

## 📦 Pacotes R Recomendados

```r
install.packages(c(
  # Essenciais
  "knitr",
  "rmarkdown",
  
  # Manipulação de dados
  "dplyr",
  "tidyr",
  "readr",
  
  # Visualização
  "ggplot2",
  "plotly",
  
  # Tabelas
  "kableExtra",
  "DT"
))
```

## 🌐 Publicação

### GitHub Pages

```bash
# Configurar remoto GitHub primeiro
git remote add origin https://github.com/SEU_USER/SEU_REPO.git
git push -u origin master

# Publicar
quarto publish gh-pages
```

### Netlify

```bash
# Renderizar
quarto render

# Fazer deploy da pasta _book/ no Netlify
```

### Como PDF

```bash
# Instalar TinyTeX (se necessário)
quarto install tinytex

# Renderizar
quarto render --to pdf
```

## 💡 Dicas

### Atalhos VS Code

- `Ctrl+Shift+K` → Preview do documento
- `Ctrl+Enter` → Executar linha/chunk atual
- `Ctrl+Shift+Enter` → Executar chunk completo

### Hot Reload

- Salve o arquivo `.qmd`
- Browser recarrega automaticamente
- Não precisa rerenderizar manualmente

### Performance

- Use `cache: true` para chunks demorados
- Use `freeze: auto` para evitar re-execução desnecessária
- Limpe cache periodicamente: `rm -rf *_cache/`

## 🐛 Troubleshooting

### Preview não funciona

```bash
quarto check
```

### Erro ao renderizar

```bash
# Limpar tudo
rm -rf _book/ .quarto/ *_cache/ *_files/

# Tentar novamente
quarto render --verbose
```

### Pacotes R faltando

```r
# No console R
install.packages("nome_do_pacote")
```

## 📚 Recursos

- [Quarto Documentation](https://quarto.org/)
- [Quarto Books Guide](https://quarto.org/docs/books/)
- [Quarto Gallery](https://quarto.org/docs/gallery/)
- [R Markdown Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/)
- [R for Data Science](https://r4ds.hadley.nz/)

## 🎯 Próximos Passos

- [ ] Adicionar mais conteúdo aos capítulos
- [ ] Criar análises com dados reais
- [ ] Personalizar tema
- [ ] Configurar GitHub Pages
- [ ] Criar GitHub Actions para deploy automático

---

**Data de Criação**: 21/11/2025  
**Versão Quarto**: 1.6.39  
**Versão R**: 4.5.1
