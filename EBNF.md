# TenisLang

Linguagem de programacao tematica de tenis 

## EBNF 

```
<program>           ::= "warmup" { <command> } "matchPoint"

<command>           ::= <setup>
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

<setup>             ::= "player" <id> "is" <type> ";"

<letShot>           ::= "letShot" "(" <relational> ")" "serve" <rallyBlock>

<playMove>          ::= <id> "hits" <relational> ";"

<print>             ::= "shout" "(" <relational> ")" ";"

<challenge>         ::= "challenge" "(" <relational> ")" 
                        "serve" <rallyBlock> 
                        [ "replay" <rallyBlock> ]

<rally>             ::= "rally" "(" <relational> ")" 
                        "serve" <rallyBlock>

<specialServe>      ::= "ace" <rallyBlock>
                      | "doubleFault" <rallyBlock>

<tiebreak>          ::= "tiebreak" "{" { <case> } "}"

<case>              ::= "if" <relational> ":" <rallyBlock>

<glossaryDeclaration> ::= "glossary" <id> "{" { <entry> } "}"

<entry>             ::= <string> ":" <string> ";"

<strategyDeclaration> ::= "strategy" <id> "()" <rallyBlock>

<strategyCall>      ::= "strategy" <id> "();"

<coachTip>          ::= "coach" "(" <string> ")" ";"

<rallyBlock>        ::= "serve" { <command> } "smash"

<relational>        ::= <expression> [ ("equal" | "greater" | "less") <expression> ]

<expression>        ::= <term> { ("+" | "-" | "or") <term> }

<term>              ::= <factor> { ("*" | "/" | "and") <factor> }

<factor>            ::= <number>
                      | <boolean>
                      | <string>
                      | <id>
                      | "crowd()" 
                      | "net()" 
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


