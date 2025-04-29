%{
#include "tenislang.tab.h"
#include <string.h>
%}

%%
"warmup"        { return WARMUP; }
"matchPoint"    { return MATCHPOINT; }
"player"        { return PLAYER; }
"is"            { return IS; }
"hits"          { return HITS; }
"shout"         { return SHOUT; }
"challenge"     { return CHALLENGE; }
"rally"         { return RALLY; }
"ace"           { return ACE; }
"doubleFault"   { return DOUBLEFAULT; }
"tiebreak"      { return TIEBREAK; }
"letShot"       { return LETSHOT; }
"strategy"      { return STRATEGY; }
"glossary"      { return GLOSSARY; }
"coach"         { return COACH; }
"serve"         { return SERVE; }
"smash"         { return SMASH; }
"replay"        { return REPLAY; }
"equal"         { return EQUAL; }
"greater"       { return GREATER; }
"less"          { return LESS; }
"or"            { return OR; }
"and"           { return AND; }
"in"            { return IN; }
"out"           { return OUT; }
"point"         { return POINT; }
"speech"        { return SPEECH; }
"flag"          { return FLAG; }

[0-9]+          { yylval.num = atoi(yytext); return NUMBER; }
\"[^\"]*\"      { yylval.str = strdup(yytext); return STRING; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.str = strdup(yytext); return ID; }

";"             { return SEMICOLON; }
":"             { return COLON; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }

[ \t\n\r]       { /* ignorar espaços */ }
.               { printf("Erro léxico: %s\n", yytext); exit(1); }

%%

int yywrap() {
    return 1;
}
