# TenisLang

**TenisLang** é uma linguagem de programação temática de tênis que permite modelar partidas de tênis com comandos (“warmup”, “player”, “hits”, “ace”, “strategy” etc.) e gerar duas saídas simultâneas:

1. **IR textual** em `out.ll`, registrando cada passo do script.  
2. **Execução “ao vivo”** no console, chamando funções de runtime que imprimem jogadas, dicas de técnico, aces, rallies etc.

---

## 🛠 Pré-requisitos

- **GNU Make**  
- **GCC** (C99 ou superior)  
- **Flex**  
- **Bison**  

No macOS:
```bash
brew install flex bison
