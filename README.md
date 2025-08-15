# 🧩 Guessing Game — Shell Script

Um jogo interativo em **Bash** para adivinhar quantos **arquivos regulares** existem no diretório atual.  
Este projeto é ideal para quem quer praticar **loops, funções, condicionais, manipulação de arquivos e cores no terminal**.

---

## 📜 Descrição

O script `guessinggame.sh` desafia o usuário a descobrir o número exato de arquivos em um diretório.  

- Contabiliza **arquivos regulares**, incluindo ocultos.  
- **Diretórios não são contados**.  
- Fornece **dicas de proximidade** para ajudar o usuário.  
- Exibe o **número de tentativas** ao acertar.  
- Suporta **diretório opcional como argumento**.

---

## ⚙️ Funcionalidades

- Contador de arquivos regulares via função.  
- Validação de entrada para aceitar apenas números inteiros não negativos.  
- Mensagens coloridas e interativas (vermelho, verde, amarelo).  
- Dicas de proximidade: “bem longe” ou “quase lá”.  
- Contador de tentativas.  
- Argumento opcional para especificar o diretório:  
  ```bash
  ./guessinggame.sh /caminho/do/diretorio

## 📂 Estrutura do Projeto

guessinggame/
│
├── guessinggame.sh # Script principal do jogo
└── README.md # Documentação do projeto
