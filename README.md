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

Build e execução para rodar toda a Suíte de Testes  :
```bash
brew install flex bison
make
make test
make clean
```

## 📝 Gramática da Linguagem (EBNF) 

```ebnf
<program> ::= "warmup" { <command> } "matchPoint"

<command> ::= <setup>
            | <playMove>
            | <print>
            | <challenge>
            | <rally>
            | <specialServe>
            | <tiebreak>
            | <letShot>
            | <glossaryDeclaration>
            | <strategyDeclaration>
            | <strategyCall>
            | <coachTip>

<setup> ::= "player" <id> "is" <type> ";"

<playMove> ::= <id> "hits" <expression> ";"

<print> ::= "shout" "(" <expression> ")" ";"

<challenge> ::= "challenge" "(" <relational> ")" "serve" <rallyBlock>
                [ "replay" <rallyBlock> ]

<rally> ::= "rally" "(" <relational> ")" "serve" <rallyBlock>

<specialServe> ::= "ace" <rallyBlock>
                 | "doubleFault" <rallyBlock>

<tiebreak> ::= "tiebreak" "{" { <case> } "}"
<case>     ::= "if" <relational> ":" <rallyBlock>

<letShot> ::= "letShot" "(" <relational> ")" "serve" <rallyBlock>

<glossaryDeclaration> ::= "glossary" <id> "{" { <entry> } "}"
<entry>               ::= <string> ":" <string> ";"

<strategyDeclaration> ::= "strategy" <id> "()" <rallyBlock>
<strategyCall>        ::= "strategy" <id> "();"

<coachTip> ::= "coach" "(" <string> ")" ";"

<rallyBlock> ::= "serve" { <command> } "smash"

<relational> ::= <expression> [ ("equal" | "greater" | "less") <expression> ]

<expression> ::= <term> { ("+" | "-" | "or") <term> }
<term>       ::= <factor> { ("*" | "/" | "and") <factor> }
<factor>     ::= <number>
               | <boolean>
               | <string>
               | <id>
               | "crowd()"
               | "net()"
               | "(" <relational> ")"
               | "+" <factor>
               | "-" <factor>

<type>    ::= "point" | "speech" | "flag"
<boolean> ::= "in" | "out"
<number>  ::= [ "-" ] <digit> { <digit> }
<string>  ::= "\"" { any_non_quote_character } "\""
<id>      ::= <letter> { <letter> | <digit> | "_" }
```

## Tabela de Equivalencia Lexical

## Equivalência Léxica

| Categoria Lexical Tradicional          | Token TenisLang    |
|----------------------------------------|--------------------|
| Identificador                          | `<id>`             |
| Tipo (`point`, `speech`, `flag`)       | `TYPE`             |
| Booleano (`in`, `out`)                 | `BOOLEAN`          |
| Número (sequência de dígitos)          | `NUMBER`           |
| String literal (`"texto"`)             | `STRING`           |
| Palavra reservada `warmup`             | `WARMUP`           |
| Palavra reservada `matchPoint`         | `MATCHPOINT`       |
| Palavra reservada `player`             | `PLAYER`           |
| Palavra reservada `is`                 | `IS`               |
| Palavra reservada `hits`               | `HITS`             |
| Palavra reservada `shout`              | `SHOUT`            |
| Palavra reservada `challenge`          | `CHALLENGE`        |
| Palavra reservada `rally`              | `RALLY`            |
| Palavra reservada `ace`                | `ACE`              |
| Palavra reservada `doubleFault`        | `DOUBLEFAULT`      |
| Palavra reservada `letShot`            | `LETSHOT`          |
| Palavra reservada `tiebreak`           | `TIEBREAK`         |
| Palavra reservada `glossary`           | `GLOSSARY`         |
| Palavra reservada `strategy`           | `STRATEGY`         |
| Palavra reservada `coach`              | `COACH`            |
| Palavra reservada `serve`              | `SERVE`            |
| Palavra reservada `smash`              | `SMASH`            |
| Palavra reservada `if`                 | `IF`               |
| Palavra reservada `replay`             | `REPLAY`           |
| Relacional `equal`                     | `EQUAL`            |
| Relacional `greater`                   | `GREATER`          |
| Relacional `less`                      | `LESS`             |
| Lógico `or`                            | `OR`               |
| Lógico `and`                           | `AND`              |
| Ponto‐e‐vírgula                        | `;`                |
| Dois‐pontos                            | `:`                |
| Parêntese esquerdo                     | `(`                |
| Parêntese direito                      | `)`                |
| Chave esquerda                         | `{`                |
| Chave direita                          | `}`                |
| Built-in `crowd()`                     | `CROWD`            |
| Built-in `net()`                       | `NET`              |



