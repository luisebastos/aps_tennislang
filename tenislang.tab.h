/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ID = 258,
     STRING = 259,
     NUMBER = 260,
     WARMUP = 261,
     MATCHPOINT = 262,
     PLAYER = 263,
     IS = 264,
     HITS = 265,
     SHOUT = 266,
     CHALLENGE = 267,
     RALLY = 268,
     ACE = 269,
     DOUBLEFAULT = 270,
     TIEBREAK = 271,
     LETSHOT = 272,
     STRATEGY = 273,
     GLOSSARY = 274,
     COACH = 275,
     SERVE = 276,
     SMASH = 277,
     REPLAY = 278,
     EQUAL = 279,
     GREATER = 280,
     LESS = 281,
     OR = 282,
     AND = 283,
     IN = 284,
     OUT = 285,
     POINT = 286,
     SPEECH = 287,
     FLAG = 288,
     SEMICOLON = 289,
     COLON = 290,
     LPAREN = 291,
     RPAREN = 292,
     LBRACE = 293,
     RBRACE = 294
   };
#endif
/* Tokens.  */
#define ID 258
#define STRING 259
#define NUMBER 260
#define WARMUP 261
#define MATCHPOINT 262
#define PLAYER 263
#define IS 264
#define HITS 265
#define SHOUT 266
#define CHALLENGE 267
#define RALLY 268
#define ACE 269
#define DOUBLEFAULT 270
#define TIEBREAK 271
#define LETSHOT 272
#define STRATEGY 273
#define GLOSSARY 274
#define COACH 275
#define SERVE 276
#define SMASH 277
#define REPLAY 278
#define EQUAL 279
#define GREATER 280
#define LESS 281
#define OR 282
#define AND 283
#define IN 284
#define OUT 285
#define POINT 286
#define SPEECH 287
#define FLAG 288
#define SEMICOLON 289
#define COLON 290
#define LPAREN 291
#define RPAREN 292
#define LBRACE 293
#define RBRACE 294




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 13 "tenislang.y"
{
    int num;
    char* str;
}
/* Line 1529 of yacc.c.  */
#line 132 "tenislang.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

