/* src/parser.y */
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "codegen.h"

extern int yylex();
extern FILE *yyin;
void yyerror(const char *s) {
    fprintf(stderr, "Erro: %s\n", s);
}
%}

%union {
    char *str;
}

%token WARMUP MATCHPOINT
%token PLAYER IS HITS SHOUT CHALLENGE RALLY ACE DOUBLEFAULT LETSHOT TIEBREAK
%token GLOSSARY STRATEGY COACH CROWD NET
%token EQUAL GREATER LESS OR AND IF REPLAY SERVE SMASH

%token <str> TYPE ID NUMBER BOOLEAN STRING

%type <str> relational expression term factor optional_replay

%start program

%left OR
%left AND
%left '+' '-'
%left '*' '/'
%nonassoc EQUAL GREATER LESS

%%

program:
    WARMUP commands MATCHPOINT
    ;

commands:
      /* vazio */
    | commands command
    ;

command:
      setup
    | playMove
    | print
    | challenge
    | rally
    | letShot
    | specialServe
    | tiebreak
    | glossaryDeclaration
    | strategyDeclaration
    | strategyCall
    | coachTip
    ;

setup:
    PLAYER ID IS TYPE ';' {
        emit_player($2, $4);
        free($2); free($4);
    }
    ;

playMove:
    ID HITS relational ';' {
        emit_play_move($1, $3);
        free($1); free($3);
    }
    ;

print:
    SHOUT '(' relational ')' ';' {
        emit_shout($3);
        free($3);
    }
    ;

challenge:
    CHALLENGE '(' relational ')' rallyBlock optional_replay {
        emit_challenge($3, $6);
        free($3);
    }
    ;

rally:
    RALLY '(' relational ')' rallyBlock {
        emit_rally($3);
        free($3);
    }
    ;

letShot:
    LETSHOT '(' relational ')' rallyBlock {
        emit_let_shot($3);
        free($3);
    }
    ;

specialServe:
    ACE rallyBlock {
        emit_ace();
    }
    | DOUBLEFAULT rallyBlock {
        emit_double_fault();
    }
    ;

tiebreak:
    TIEBREAK '{' tiebreak_cases '}' { /* opcional: emit_tiebreak_start()/emit_tiebreak_end() */ }
    ;

tiebreak_cases:
      /* vazio */
    | tiebreak_cases tiebreak_case
    ;

tiebreak_case:
    IF relational ':' rallyBlock {
        emit_tiebreak_case($2);
        free($2);
    }
    ;

glossaryDeclaration:
    GLOSSARY ID '{' glossary_entries '}' {
        emit_glossary_decl($2);
        free($2);
    }
    ;

glossary_entries:
      /* vazio */
    | glossary_entries glossary_entry
    ;

glossary_entry:
    STRING ':' STRING ';' {
        emit_glossary_entry($1, $3);
        free($1); free($3);
    }
    ;

strategyDeclaration:
    STRATEGY ID '(' ')' rallyBlock {
        emit_strategy_decl($2);
        free($2);
        emit_strategy_end();
    }
    ;

strategyCall:
    STRATEGY ID '(' ')' ';' {
        emit_strategy_call($2);
        free($2);
    }
    ;

coachTip:
    COACH '(' STRING ')' ';' {
        emit_coach_tip($3);
        free($3);
    }
    ;

rallyBlock:
    SERVE commands SMASH
    ;

optional_replay:
      /* sem replay */       { $$ = NULL; }
    | REPLAY rallyBlock     { $$ = "replay"; }
    ;

relational:
    expression {
        $$ = $1;
    }
    | expression EQUAL expression {
        $$ = make_expr($1, "==", $3);
        free($1); free($3);
    }
    | expression GREATER expression {
        $$ = make_expr($1, ">", $3);
        free($1); free($3);
    }
    | expression LESS expression {
        $$ = make_expr($1, "<", $3);
        free($1); free($3);
    }
    ;

expression:
    expression '+' term {
        $$ = make_expr($1, "+", $3);
        free($1); free($3);
    }
    | expression '-' term {
        $$ = make_expr($1, "-", $3);
        free($1); free($3);
    }
    | expression OR term {
        $$ = make_expr($1, "or", $3);
        free($1); free($3);
    }
    | term {
        $$ = $1;
    }
    ;

term:
    term '*' factor {
        $$ = make_expr($1, "*", $3);
        free($1); free($3);
    }
    | term '/' factor {
        $$ = make_expr($1, "/", $3);
        free($1); free($3);
    }
    | term AND factor {
        $$ = make_expr($1, "and", $3);
        free($1); free($3);
    }
    | factor {
        $$ = $1;
    }
    ;

factor:
    NUMBER      { $$ = $1; }
    | BOOLEAN   { $$ = $1; }
    | STRING    { $$ = $1; }
    | ID        { $$ = $1; }
    | CROWD     { $$ = strdup("crowd()"); }
    | NET       { $$ = strdup("net()"); }
    | '(' relational ')' { $$ = $2; }
    | '+' factor        { $$ = $2; }
    | '-' factor        {
        size_t len = strlen($2) + 2;
        $$ = malloc(len);
        snprintf($$, len, "-%s", $2);
        free($2);
    }
    ;
%%

/* main() está em src/main.c */
