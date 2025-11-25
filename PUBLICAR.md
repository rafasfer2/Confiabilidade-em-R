# Numeração automática das legendas

Para que as legendas das figuras sejam numeradas automaticamente, use sempre o formato:
```markdown
![Legenda da figura](caminho/para/imagem.png){#fig:algum-id fig-cap="Legenda da figura"}
```
O Quarto adiciona a numeração (ex: Figura 1.1) automaticamente.
O parâmetro `number-sections: true` já está ativado no `_quarto.yml`.
Não use HTML `<img>` ou `<div>` para figuras.

# Publicação automática do Quarto Book no GitHub Pages

## Fluxo recomendado

1. **Renderize o livro Quarto:**
   ```bash
   quarto render
   ```
2. **Adicione e faça commit das alterações:**
   ```bash
   git add .
   git commit -m "Atualização do livro"
   ```
3. **Envie para o GitHub:**
   ```bash
   git push
   ```

## Configuração do GitHub Pages
- Vá em *Settings > Pages* no repositório do GitHub.
- Selecione:
  - **Branch:** `main`
  - **Pasta:** `/docs`
- Salve as configurações.

## Resultado
- O site será publicado automaticamente após cada `git push`.
- Não é necessário mexer no branch `gh-pages`.

---

## Script automático (opcional)
Crie um arquivo chamado `atualizar-livro.sh` com o conteúdo abaixo:

```bash
#!/bin/bash
quarto render && git add . && git commit -m "Atualização automática do livro" && git push
```

Depois, torne o script executável:
```bash
chmod +x atualizar-livro.sh
```

E rode sempre que quiser atualizar:
```bash
./atualizar-livro.sh
```

---

**Pronto! O fluxo está automatizado e fácil.**
