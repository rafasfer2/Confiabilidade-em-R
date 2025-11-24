#!/bin/bash
# Script para atualização rápida do QuartoBook

echo "🔄 Renderizando livro..."
cd /home/rafasfer2/QuartoBook
quarto render --to html --quiet

if [ $? -eq 0 ]; then
    echo "✅ Renderização concluída!"
    echo ""
    echo "🌐 ACESSE: http://localhost:4200"
    echo "💡 Dica: Use Ctrl+Shift+R no navegador para forçar atualização"
    echo ""
    # Timestamp para confirmar atualização
    echo "⏰ Atualizado em: $(date '+%H:%M:%S')"
else
    echo "❌ Erro na renderização"
    exit 1
fi
