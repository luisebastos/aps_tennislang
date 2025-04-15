programa      ::= "aquecimento" { comando } "fim" ;

comando       ::= declaracao | atribuicao | condicional | loop | imprimir ;

declaracao    ::= "jogador" IDENT "é" tipo ";" ;
atribuicao    ::= IDENT "recebe" expressao ";" ;
condicional   ::= "desafio" "(" expressao ")" "saque" bloco [ "replay" bloco ] ;
loop          ::= "rally" "(" expressao ")" "saque" bloco ;
bloco         ::= "[" { comando } "devolve" ] ;

imprimir      ::= "grita" "(" expressao ")" ";" ;

expressao     ::= termo { ("+" | "-" | "ou") termo } ;
termo         ::= fator { ("*" | "/" | "e") fator } ;
fator         ::= NUMBER | STRING | BOOL | IDENT | "(" expressao ")" ;

tipo          ::= "ponto" | "fala" | "marca" ;

IDENT         ::= letras { letras | digitos | "_" } ;
NUMBER        ::= digitos ;
STRING        ::= '"' { qualquer_caractere } '"' ;
BOOL          ::= "sim" | "nao" ;

letras        ::= "a" | "b" | ... | "z" | "A" | "B" | ... | "Z" ;
digitos       ::= "0" | "1" | ... | "9" ;
