%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

FILE* output;
int tempVar = 0;

void yyerror(const char *s);
int yylex();
%}

%union {
    int num;
    char* str;
}

%token <str> ID STRING
%token <num> NUMBER
%token WARMUP MATCHPOINT PLAYER IS HITS SHOUT CHALLENGE RALLY ACE DOUBLEFAULT TIEBREAK LETSHOT STRATEGY GLOSSARY COACH SERVE SMASH REPLAY
%token EQUAL GREATER LESS OR AND IN OUT
%token POINT SPEECH FLAG
%token SEMICOLON COLON LPAREN RPAREN LBRACE RBRACE

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
;

setup:
    PLAYER ID IS type SEMICOLON {
        fprintf(output, "%%%s = alloca i32\n", $2);
    }
;

playMove:
    ID HITS NUMBER SEMICOLON {
        fprintf(output, "store i32 %d, i32* %%%s\n", $3, $1);
    }
;

print:
    SHOUT LPAREN ID RPAREN SEMICOLON {
        fprintf(output, "%%tmp%d = load i32, i32* %%%s\n", tempVar, $3);
        fprintf(output, "call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %%tmp%d)\n", tempVar);
        tempVar++;
    }
;

type:
    POINT
    | SPEECH
    | FLAG
;

%%

void yyerror(const char *s) {
    printf("Erro sintático: %s\n", s);
}

int main() {
    output = fopen("programa.ll", "w");
    if (!output) {
        perror("Erro abrindo arquivo");
        exit(1);
    }

    fprintf(output, "declare i32 @printf(i8*, ...)\n");
    fprintf(output, "@.str = private unnamed_addr constant [4 x i8] c\"%%d\\0A\\00\"\n\n");
    fprintf(output, "define i32 @main() {\n");

    yyparse();

    fprintf(output, "ret i32 0\n");
    fprintf(output, "}\n");

    fclose(output);
    return 0;
}

