#!/usr/bin/env bash
# guessinggame.sh — adivinhe quantos arquivos existem no diretório atual
# Versão evoluída: contador de tentativas, cores e dica de proximidade

set -o nounset
set -o errexit
set -o pipefail

# Cores
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
NC="\033[0m"

# Função que conta somente arquivos regulares no diretório
count_files() {
  local dir="${1:-.}"
  find "$dir" -maxdepth 1 -type f | wc -l | tr -d ' '
}

# Função de boas-vindas
welcome_message() {
  cat <<'EOF'
🧩 Bem-vindo ao Guessing Game!
Tente adivinhar quantos ARQUIVOS existem no diretório atual.
(Diretórios não contam, arquivos ocultos são incluídos.)
EOF
}

# Função de dica de proximidade
proximity_hint() {
  local diff=$1
  if (( diff >= 5 )); then
    echo -e "${YELLOW}Você está bem longe do número certo.${NC}"
  elif (( diff >= 2 )); then
    echo -e "${YELLOW}Quase lá! Ajuste um pouco seu palpite.${NC}"
  fi
}

# Diretório alvo (opcional via argumento)
dir="${1:-.}"

# Contagem correta
correct=$(count_files "$dir")
attempts=0

welcome_message

# Loop principal
while true; do
  read -r -p "Qual é o seu palpite? " guess

  # Validação: inteiro não negativo
  if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
    echo -e "${RED}Entrada inválida! Digite um número inteiro (ex.: 0, 1, 2...).${NC}"
    continue
  fi

  ((attempts++))
  diff=$(( guess - correct ))
  (( diff < 0 )) && diff=$(( -diff ))

  # Comparação
  if (( guess < correct )); then
    echo "Muito baixo. Tente novamente."
    proximity_hint "$diff"
  elif (( guess > correct )); then
    echo "Muito alto. Tente novamente."
    proximity_hint "$diff"
  else
    echo -e "${GREEN}🎉 Parabéns! Você acertou: existem $correct arquivos no diretório '$dir'.${NC}"
    echo "Tentativas: $attempts"
    break
  fi
done
