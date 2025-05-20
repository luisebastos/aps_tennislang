%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h"
%}

%option noyywrap

%%

"warmup"           { return WARMUP; }
"matchPoint"       { return MATCHPOINT; }

"player"           { return PLAYER; }
"is"               { return IS; }
"hits"             { return HITS; }
"shout"            { return SHOUT; }
"challenge"        { return CHALLENGE; }
"rally"            { return RALLY; }
"ace"              { return ACE; }
"doubleFault"      { return DOUBLEFAULT; }
"letShot"          { return LETSHOT; }
"tiebreak"         { return TIEBREAK; }
"glossary"         { return GLOSSARY; }
"strategy"         { return STRATEGY; }
"coach"            { return COACH; }

"crowd()"          { return CROWD; }
"net()"            { return NET; }

"equal"            { return EQUAL; }
"greater"          { return GREATER; }
"less"             { return LESS; }

"or"               { return OR; }
"and"              { return AND; }
"if"               { return IF; }
"replay"           { return REPLAY; }
"serve"            { return SERVE; }
"smash"            { return SMASH; }

"point"            { yylval.str = strdup(yytext); return TYPE; }
"speech"           { yylval.str = strdup(yytext); return TYPE; }
"flag"             { yylval.str = strdup(yytext); return TYPE; }
"in"               { yylval.str = strdup(yytext); return BOOLEAN; }
"out"              { yylval.str = strdup(yytext); return BOOLEAN; }

[0-9]+             { yylval.str = strdup(yytext); return NUMBER; }
\"([^\"\\]|\\.)*\" { yylval.str = strdup(yytext); return STRING; }

[a-zA-Z_][a-zA-Z0-9_]* { yylval.str = strdup(yytext); return ID; }

";"                { return ';'; }
":"                { return ':'; }
"{"                { return '{'; }
"}"                { return '}'; }
"("                { return '('; }
")"                { return ')'; }

[ \t\r\n]+         { /* ignora whitespace */ }
"//".*             { /* ignora comentário */ }

.                  { fprintf(stderr, "Caracter inválido: %s\n", yytext); exit(1); }
%%
