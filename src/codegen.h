#include "runtime.h"

void init_codegen(const char *filename);
void finalize_codegen();

void emit_player(const char *name, const char *type);
void emit_play_move(const char *player, const char *expr);
void emit_shout(const char *expr);
void emit_let_shot(const char *cond);
void emit_challenge(const char *cond, const char *has_replay);
void emit_rally(const char *cond);
void emit_ace();
void emit_double_fault();

void emit_tiebreak_start();
void emit_tiebreak_case(const char *cond);
void emit_tiebreak_end();

void emit_glossary_decl(const char *id);
void emit_glossary_entry(const char *key, const char *value);

void emit_strategy_decl(const char *id);
void emit_strategy_end();
void emit_strategy_call(const char *id);

void emit_coach_tip(const char *text);

// Se precisar montar strings de expressão:
char *make_expr(const char *left, const char *op, const char *right);