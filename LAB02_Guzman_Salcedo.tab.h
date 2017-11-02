/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

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

#ifndef YY_YY_LAB02_GUZMAN_SALCEDO_TAB_H_INCLUDED
# define YY_YY_LAB02_GUZMAN_SALCEDO_TAB_H_INCLUDED
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
    numero = 258,
    para = 259,
    parc = 260,
    coma = 261,
    igual = 262,
    mayor = 263,
    menor = 264,
    corcha = 265,
    corchc = 266,
    puntocoma = 267,
    id = 268,
    dospuntos = 269,
    asignar = 270,
    def = 271,
    And = 272,
    Else = 273,
    Is = 274,
    Return = 275,
    Break = 276,
    For = 277,
    Not = 278,
    While = 279,
    Continue = 280,
    If = 281,
    Or = 282,
    Import = 283,
    Pass = 284,
    Elif = 285,
    In = 286,
    Print = 287,
    Range = 288,
    suma = 289,
    resta = 290,
    multi = 291,
    divi = 292,
    boleano = 293,
    negacion = 294,
    mod = 295,
    diferente = 296,
    diventero = 297,
    mcador = 298,
    reduccion = 299,
    incremento = 300,
    mmayor = 301,
    mmenor = 302,
    comentario = 303,
    string = 304
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

#endif /* !YY_YY_LAB02_GUZMAN_SALCEDO_TAB_H_INCLUDED  */
