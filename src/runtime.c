// #include <stdio.h>

// void shout(const char *msg) {
//     printf("🎾 %s\n", msg);
//     fflush(stdout);
// }

#include <stdio.h>
#include "runtime.h"

void shout(const char *msg) {
    printf("🎾 SHOUT: %s\n", msg);
    fflush(stdout);
}

void play_move(const char *player, const char *expr) {
    printf("🎾 %s HIT: %s\n", player, expr);
    fflush(stdout);
}

void let_shot(const char *cond) {
    printf("🎾 LET SHOT (cond: %s)\n", cond);
    fflush(stdout);
}

void challenge(const char *cond, int with_replay) {
    printf("🎾 CHALLENGE (cond: %s)%s\n",
           cond, with_replay ? " [with replay]" : "");
    fflush(stdout);
}

void rally(const char *cond) {
    printf("🎾 RALLY (cond: %s)\n", cond);
    fflush(stdout);
}

void ace(void) {
    printf("🎾 ACE!\n");
    fflush(stdout);
}

void double_fault(void) {
    printf("🎾 DOUBLE FAULT!\n");
    fflush(stdout);
}

void tiebreak_case(const char *cond) {
    printf("🎾 TIEBREAK CASE (cond: %s)\n", cond);
    fflush(stdout);
}

void strategy_begin(const char *id) {
    printf("🎾 STRATEGY %s BEGIN\n", id);
    fflush(stdout);
}

void strategy_end(void) {
    printf("🎾 STRATEGY END\n");
    fflush(stdout);
}

void strategy_call(const char *id) {
    printf("🎾 STRATEGY CALL %s\n", id);
    fflush(stdout);
}

void coach_tip(const char *text) {
    printf("🎾 COACH TIP: %s\n", text);
    fflush(stdout);
}
