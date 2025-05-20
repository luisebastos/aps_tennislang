#ifndef RUNTIME_H
#define RUNTIME_H

// protótipos das funções de execução imediata
void shout(const char *msg);
void play_move(const char *player, const char *expr);
void let_shot(const char *cond);
void challenge(const char *cond, int with_replay);
void rally(const char *cond);
void ace(void);
void double_fault(void);
void tiebreak_case(const char *cond);
void strategy_begin(const char *id);
void strategy_end(void);
void strategy_call(const char *id);
void coach_tip(const char *text);

#endif // RUNTIME_H