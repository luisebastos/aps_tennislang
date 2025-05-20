# Makefile para TenisLang

# Compilador e flags
CC       := gcc
CFLAGS   := -g -Wall -I src

# Ferramentas de geração
YACC     := bison -d -o src/parser.tab.c src/parser.y
LEX      := flex -o src/lex.yy.c src/lexer.l

# Fontes
SRCS     := src/main.c \
            src/parser.tab.c \
            src/lex.yy.c \
            src/codegen.c \
            src/runtime.c

# Alvo final
TARGET   := tenis

.PHONY: all clean run

all: $(TARGET)

# Regra principal: depende de todos os .c gerados e escritos
$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -o $(TARGET)

# Gera parser.tab.c e parser.tab.h a partir de parser.y
src/parser.tab.c src/parser.tab.h: src/parser.y
	$(YACC)

# Gera lex.yy.c a partir de lexer.l (depende do header do parser)
src/lex.yy.c: src/lexer.l src/parser.tab.h
	$(LEX)

# Limpa artefatos de build
clean:
	rm -f src/lex.yy.c src/parser.tab.c src/parser.tab.h \
          $(TARGET) out.ll

# Atalho para rodar o interpretador no seu exemplo
# (presume que exista um arquivo exemplo.tenis na raiz)
run: $(TARGET)
	./$(TARGET) exemplo.tenis
