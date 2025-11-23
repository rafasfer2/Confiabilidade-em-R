# Funções Auxiliares para Análise de Confiabilidade
# Autor: Rafael da Silva Fernandes
# Data: 2025-11-23

# Carregar bibliotecas necessárias
suppressPackageStartupMessages({
  library(survival)
  library(flexsurv)
  library(ggplot2)
  library(dplyr)
})

# Função: Calcular MTBF (Mean Time Between Failures)
calcular_mtbf <- function(tempos_falha, censurados = NULL) {
  if (is.null(censurados)) {
    censurados <- rep(0, length(tempos_falha))
  }
  
  # Considerar apenas falhas completas
  falhas_completas <- tempos_falha[censurados == 0]
  
  if (length(falhas_completas) == 0) {
    warning("Nenhuma falha completa encontrada")
    return(NA)
  }
  
  mtbf <- mean(falhas_completas)
  return(mtbf)
}

# Função: Calcular taxa de falha instantânea
calcular_taxa_falha <- function(tempo, shape, scale) {
  # Para distribuição Weibull
  taxa <- (shape / scale) * (tempo / scale)^(shape - 1)
  return(taxa)
}

# Função: Plotar análise Weibull
plot_weibull <- function(dados, tempo_col = "tempo", censura_col = "censura") {
  # Preparar dados
  surv_obj <- Surv(dados[[tempo_col]], dados[[censura_col]] == 0)
  
  # Ajustar modelo Weibull
  fit <- flexsurvreg(surv_obj ~ 1, dist = "weibull")
  
  # Extrair parâmetros
  shape <- fit$res["shape", "est"]
  scale <- fit$res["scale", "est"]
  
  # Criar gráfico
  p <- ggplot(dados, aes(x = .data[[tempo_col]])) +
    geom_histogram(aes(y = after_stat(density)), 
                   bins = 20, fill = "steelblue", alpha = 0.6) +
    stat_function(fun = dweibull, 
                  args = list(shape = shape, scale = scale),
                  color = "red", linewidth = 1.2) +
    labs(
      title = "Análise de Weibull",
      subtitle = sprintf("Shape = %.2f, Scale = %.0f", shape, scale),
      x = "Tempo até Falha",
      y = "Densidade"
    ) +
    theme_minimal()
  
  return(list(plot = p, shape = shape, scale = scale, fit = fit))
}

# Função: Calcular confiabilidade em t
calcular_confiabilidade <- function(t, shape, scale) {
  R_t <- exp(-(t / scale)^shape)
  return(R_t)
}

# Função: Determinar intervalo ótimo de manutenção preventiva
otimizar_manutencao <- function(shape, scale, custo_preventivo, custo_corretivo) {
  # Grid de tempos
  t_grid <- seq(1, scale * 2, length.out = 100)
  
  # Calcular custo esperado para cada t
  custos <- sapply(t_grid, function(t) {
    R_t <- calcular_confiabilidade(t, shape, scale)
    custo_esperado <- (custo_preventivo * R_t + custo_corretivo * (1 - R_t)) / t
    return(custo_esperado)
  })
  
  # Encontrar mínimo
  idx_min <- which.min(custos)
  t_otimo <- t_grid[idx_min]
  custo_min <- custos[idx_min]
  
  return(list(
    tempo_otimo = t_otimo,
    custo_minimo = custo_min,
    tempos = t_grid,
    custos = custos
  ))
}

# Função: Criar tabela de vida
criar_tabela_vida <- function(dados, tempo_col, censura_col, intervalos = 10) {
  # Criar intervalos
  breaks <- seq(0, max(dados[[tempo_col]]), length.out = intervalos + 1)
  
  # Criar objeto de sobrevivência
  surv_obj <- Surv(dados[[tempo_col]], dados[[censura_col]] == 0)
  
  # Ajustar modelo de Kaplan-Meier
  km_fit <- survfit(surv_obj ~ 1)
  
  # Extrair informações
  tabela <- data.frame(
    tempo = km_fit$time,
    n_risco = km_fit$n.risk,
    n_eventos = km_fit$n.event,
    sobrevivencia = km_fit$surv,
    erro_padrao = km_fit$std.err
  )
  
  return(tabela)
}

cat("✅ Funções de confiabilidade carregadas com sucesso!\n")
cat("Funções disponíveis:\n")
cat("  - calcular_mtbf()\n")
cat("  - calcular_taxa_falha()\n")
cat("  - plot_weibull()\n")
cat("  - calcular_confiabilidade()\n")
cat("  - otimizar_manutencao()\n")
cat("  - criar_tabela_vida()\n")
