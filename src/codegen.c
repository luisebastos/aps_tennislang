#include "codegen.h"
#include "runtime.h"   
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static FILE *out;

void init_codegen(const char *filename) {
    out = fopen(filename, "w");
    if (!out) {
        perror("fopen out.ll");
        exit(1);
    }
    fprintf(out, "; --- TenisLang IR ---\n");
}

void finalize_codegen() {
    if (out) {
        fprintf(out, "; --- Fim do IR ---\n");
        fclose(out);
    }
}

void emit_player(const char *name, const char *type) {
    fprintf(out, "player %s is %s\n", name, type);
    // se você quiser rodar algo no runtime aqui, crie player_setup(name,type)
}

void emit_play_move(const char *player, const char *expr) {
    fprintf(out, "%s hits %s\n", player, expr);
    play_move(player, expr);
}

void emit_shout(const char *expr) {
    fprintf(out, "shout %s\n", expr);
    shout(expr);
}

void emit_let_shot(const char *cond) {
    fprintf(out, "letShot %s\n", cond);
    let_shot(cond);
}

void emit_challenge(const char *cond, const char *has_replay) {
    fprintf(out, "challenge %s%s\n", cond, has_replay ? " with replay" : "");
    challenge(cond, has_replay != NULL);
}

void emit_rally(const char *cond) {
    fprintf(out, "rally %s\n", cond);
    rally(cond);
}

void emit_ace() {
    fprintf(out, "ace\n");
    ace();
}

void emit_double_fault() {
    fprintf(out, "doubleFault\n");
    double_fault();
}

void emit_tiebreak_start() {
    fprintf(out, "tiebreak_start\n");
}

void emit_tiebreak_case(const char *cond) {
    fprintf(out, "tiebreak_case %s\n", cond);
    tiebreak_case(cond);
}

void emit_tiebreak_end() {
    fprintf(out, "tiebreak_end\n");
}

void emit_glossary_decl(const char *id) {
    fprintf(out, "glossary %s\n", id);
}

void emit_glossary_entry(const char *key, const char *value) {
    fprintf(out, "  %s: %s\n", key, value);
}

void emit_strategy_decl(const char *id) {
    fprintf(out, "strategy %s begin\n", id);
    strategy_begin(id);
}

void emit_strategy_end() {
    fprintf(out, "strategy end\n");
    strategy_end();
}

void emit_strategy_call(const char *id) {
    fprintf(out, "strategy call %s\n", id);
    strategy_call(id);
}

void emit_coach_tip(const char *text) {
    fprintf(out, "coach %s\n", text);
    coach_tip(text);
}

char *make_expr(const char *left, const char *op, const char *right) {
    size_t n = strlen(left) + strlen(op) + strlen(right) + 4;
    char *buf = malloc(n);
    if (!buf) {
        perror("malloc");
        exit(1);
    }
    snprintf(buf, n, "%s %s %s", left, op, right);
    return buf;
}
