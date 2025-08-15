#!/usr/bin/env bash
# guessinggame.sh — adivinhe quantos arquivos existem no diretório atual
# Regras exigidas: >= 1 função, 1 loop e 1 if; 20–50 linhas de código.

set -o nounset
set -o errexit
set -o pipefail

# Função que conta somente **arquivos regulares** no diretório atual (inclui ocultos)
count_files() {
  find . -maxdepth 1 -type f | wc -l | tr -d ' '
}

# Mensagem inicial
cat <<'EOF'
🧩 Bem-vindo ao Guessing Game!
Tente adivinhar quantos ARQUIVOS existem no diretório atual.
(Dica: considere apenas arquivos regulares. Diretórios não contam.)
EOF

# Valor correto
correct=$(count_files)

# Loop principal
while true; do
  read -r -p "Qual é o seu palpite? " guess

  # Validação: inteiro não negativo
  if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
    echo "Entrada inválida. Digite um número inteiro (ex.: 0, 1, 2...)."
    continue
  fi

  if (( guess < correct )); then
    echo "Muito baixo. Tente novamente."
  elif (( guess > correct )); then
    echo "Muito alto. Tente novamente."
  else
    echo "🎉 Parabéns! Você acertou: existem $correct arquivos no diretório atual."
    break
  fi
done