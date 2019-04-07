/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

#ifndef YY_YY_CSHARPPARSER_TAB_H_INCLUDED
# define YY_YY_CSHARPPARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    USING = 258,
    SEMI_COLON = 259,
    DOT = 260,
    AT = 261,
    AVAILABLE_IDENTIFIER = 262,
    KEYWORD = 263,
    CLASS = 264,
    MODIFIERS = 265,
    COLON = 266,
    OBJECT = 267,
    STRING = 268,
    OPCU = 269,
    CLCU = 270,
    CONST = 271,
    COMMA = 272,
    ASSIGN = 273,
    QUESTION_MARK = 274,
    LOGICAL_OR = 275,
    LOGICAL_AND = 276,
    OR = 277,
    XOR = 278,
    AND = 279,
    RELOP = 280,
    ADDOP = 281,
    MULOP = 282,
    SHORTHAND = 283,
    OPBR = 284,
    CLBR = 285,
    PARTIAL = 286,
    VOID = 287,
    VAR = 288,
    IF = 289,
    ELSE = 290,
    SWITCH = 291,
    CASE = 292,
    DEFAULT = 293,
    WHILE = 294,
    FOR = 295,
    BREAK = 296,
    CONTINUE = 297,
    RETURN = 298,
    BOOL = 299,
    INTEGRAL_TYPE = 300,
    FLOATING_POINT_TYPE = 301,
    NUMBER = 302,
    SIZEOF = 303,
    INCREMENT = 304,
    DECREMENT = 305,
    STRING_LITERAL = 306,
    VERBATIM_STRING_LITERAL = 307,
    CHARACTER_LITERAL = 308,
    NOT = 309,
    NEGATE = 310,
    NAMESPACE = 311,
    OPSQ = 312,
    CLSQ = 313
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_CSHARPPARSER_TAB_H_INCLUDED  */
