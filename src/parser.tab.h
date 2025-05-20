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
     WARMUP = 258,
     MATCHPOINT = 259,
     PLAYER = 260,
     IS = 261,
     HITS = 262,
     SHOUT = 263,
     CHALLENGE = 264,
     RALLY = 265,
     ACE = 266,
     DOUBLEFAULT = 267,
     LETSHOT = 268,
     TIEBREAK = 269,
     GLOSSARY = 270,
     STRATEGY = 271,
     COACH = 272,
     CROWD = 273,
     NET = 274,
     EQUAL = 275,
     GREATER = 276,
     LESS = 277,
     OR = 278,
     AND = 279,
     IF = 280,
     REPLAY = 281,
     SERVE = 282,
     SMASH = 283,
     TYPE = 284,
     ID = 285,
     NUMBER = 286,
     BOOLEAN = 287,
     STRING = 288
   };
#endif
/* Tokens.  */
#define WARMUP 258
#define MATCHPOINT 259
#define PLAYER 260
#define IS 261
#define HITS 262
#define SHOUT 263
#define CHALLENGE 264
#define RALLY 265
#define ACE 266
#define DOUBLEFAULT 267
#define LETSHOT 268
#define TIEBREAK 269
#define GLOSSARY 270
#define STRATEGY 271
#define COACH 272
#define CROWD 273
#define NET 274
#define EQUAL 275
#define GREATER 276
#define LESS 277
#define OR 278
#define AND 279
#define IF 280
#define REPLAY 281
#define SERVE 282
#define SMASH 283
#define TYPE 284
#define ID 285
#define NUMBER 286
#define BOOLEAN 287
#define STRING 288




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 15 "src/parser.y"
{
    char *str;
}
/* Line 1529 of yacc.c.  */
#line 119 "src/parser.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

