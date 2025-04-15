# TenisLang

Linguagem de programacao tematica de tenis 

## EBNF 

```
<program>           ::= "warmup" { <command> } "gameOver"

<command>           ::= <declaration>
                      | <assignment>
                      | <print>
                      | <conditional>
                      | <loop>

<declaration>       ::= "player" <id> "is" <type> ";"

<assignment>        ::= <id> "gets" <relational> ";"

<print>             ::= "shout" "(" <relational> ")" ";"

<conditional>       ::= "challenge" "(" <relational> ")" 
                        "serve" <block> 
                        [ "replay" <block> ]

<loop>              ::= "rally" "(" <relational> ")" 
                        "serve" <block>

<block>             ::= "[" { <command> } "return" ]

<relational>        ::= <expression> [ ("equal" | "greater" | "less") <expression> ]

<expression>        ::= <term> { ("+" | "-" | "or") <term> }

<term>              ::= <factor> { ("*" | "/" | "and") <factor> }

<factor>            ::= <number>
                      | <boolean>
                      | <string>
                      | <id>
                      | "crowd()" 
                      | "(" <relational> ")"
                      | "+" <factor>
                      | "-" <factor>

<type>              ::= "point" | "speech" | "flag"

<boolean>           ::= "in" | "out"

<number>            ::= [ "-" ] <digit> { <digit> }

<string>            ::= "\"" { any_non_quote_character } "\""

<id>                ::= <letter> { <letter> | <digit> | "_" }

<letter>            ::= "a" | ... | "z" | "A" | ... | "Z"
<digit>             ::= "0" | ... | "9"

```

---


