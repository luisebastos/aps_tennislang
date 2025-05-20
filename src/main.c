#include <stdio.h>
#include "codegen.h"

extern int yyparse();
extern FILE *yyin;

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Uso: %s <arquivo.tenis>\\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("fopen");
        return 1;
    }

    init_codegen("out.ll");

    if (yyparse() != 0) {
        fprintf(stderr, "Erros de sintaxe detectados. Abortando.\\n");
        finalize_codegen();
        fclose(yyin);
        return 1;
    }

    finalize_codegen();

    fclose(yyin);

    return 0;
}
