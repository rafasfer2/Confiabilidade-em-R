#!/bin/bash
# Script para desativar extensões desnecessárias no workspace QuartoBook
# Execute com: bash disable-extensions.sh

echo "Desativando extensões não necessárias para QuartoBook..."

# Python/Jupyter (não usado neste projeto)
code --disable-extension ms-python.python
code --disable-extension ms-python.vscode-pylance
code --disable-extension ms-python.debugpy
code --disable-extension ms-python.vscode-python-envs

# Blender (não relacionado)
code --disable-extension jacqueslucke.blender-development

# ESLint/Prettier (frontend JavaScript - não usado)
code --disable-extension dbaeumer.vscode-eslint
code --disable-extension esbenp.prettier-vscode
code --disable-extension stylelint.vscode-stylelint

# C++ (não usado)
code --disable-extension ms-vscode.cpptools

# Azure (muitas extensões para um projeto simples de livro)
code --disable-extension ms-azure-load-testing.microsoft-testing
code --disable-extension ms-azuretools.vscode-azureappservice
code --disable-extension ms-azuretools.vscode-azurecontainerapps
code --disable-extension ms-azuretools.vscode-azurefunctions
code --disable-extension ms-azuretools.vscode-azurestaticwebapps
code --disable-extension ms-azuretools.vscode-azurestorage
code --disable-extension ms-azuretools.vscode-azurevirtualmachines
code --disable-extension ms-azuretools.vscode-cosmosdb
code --disable-extension ms-vscode.vscode-node-azure-pack
code --disable-extension vscjava.migrate-java-to-azure
code --disable-extension vscjava.vscode-java-upgrade

# SQL Server (não usado neste projeto)
code --disable-extension ms-mssql.mssql
code --disable-extension ms-mssql.data-workspace-vscode
code --disable-extension ms-mssql.sql-bindings-vscode
code --disable-extension ms-mssql.sql-database-projects-vscode
code --disable-extension mtxr.sqltools
code --disable-extension qwtel.sqlite-viewer

# Windows AI Studio (não necessário)
code --disable-extension ms-windows-ai-studio.windows-ai-studio
code --disable-extension teamsdevapp.vscode-ai-foundry

# Shiny frameworks extras
code --disable-extension davidrsch.shinyframeworks
code --disable-extension posit.shinyuieditor

echo ""
echo "✅ Extensões desativadas!"
echo ""
echo "Extensões MANTIDAS (essenciais para QuartoBook):"
echo "  - quarto.quarto (Quarto)"
echo "  - reditorsupport.r (R)"
echo "  - reditorsupport.r-syntax (R Syntax)"
echo "  - rdebugger.r-debugger (R Debug)"
echo "  - ikuyadeu.r-pack (R Package)"
echo "  - posit.shiny (Shiny - opcional)"
echo "  - yzhang.markdown-all-in-one (Markdown)"
echo "  - davidanson.vscode-markdownlint (Markdown Lint)"
echo "  - mechatroner.rainbow-csv (CSV)"
echo "  - github.copilot (GitHub Copilot)"
echo "  - github.copilot-chat (Copilot Chat)"
echo "  - github.vscode-github-actions (GitHub Actions)"
echo "  - github.vscode-pull-request-github (GitHub PRs)"
echo "  - eamodio.gitlens (GitLens)"
echo "  - ms-azuretools.vscode-azure-github-copilot (Azure Copilot)"
echo "  - ms-azuretools.azure-dev (Azure Dev - se usar)"
echo "  - ms-azuretools.vscode-azure-mcp-server (Azure MCP)"
echo "  - ms-azuretools.vscode-azureresourcegroups (Azure Resources - se usar)"
echo "  - ms-azuretools.vscode-containers (Docker - se usar)"
echo "  - ms-vscode.live-server (Live Server - útil)"
echo "  - ms-ceintl.vscode-language-pack-pt-br (Português)"
echo ""
echo "Para reativar alguma extensão:"
echo "  code --enable-extension <extension-id>"
