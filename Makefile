CC       := gcc
CFLAGS   := -g -Wall -I src
YACC     := bison -d -o src/parser.tab.c src/parser.y
LEX      := flex -o src/lex.yy.c src/lexer.l

SRCS     := src/main.c \
            src/parser.tab.c \
            src/lex.yy.c \
            src/codegen.c \
            src/runtime.c

TARGET   := tenis

TESTS    := $(wildcard testes/*.tenis)

.PHONY: all clean run test

all: $(TARGET)

$(TARGET): src/parser.tab.c src/lex.yy.c $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -o $(TARGET)

src/parser.tab.c src/parser.tab.h: src/parser.y
	$(YACC)

src/lex.yy.c: src/lexer.l src/parser.tab.h
	$(LEX)

clean:
	rm -f src/lex.yy.c src/parser.tab.c src/parser.tab.h \
          $(TARGET) out.ll

run: $(TARGET)
	@./$(TARGET) exemplo.tenis


test: $(TARGET)
	@echo "====== Executando suíte de testes ======"
	@for script in $(TESTS); do \
	  echo ""; \
	  echo "---- $$script ----"; \
	  ./$(TARGET) $$script; \
	done
	@echo ""; \
	echo "====== Fim dos testes ======"