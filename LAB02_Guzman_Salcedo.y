/* Includes y definiciones de variables */
%{
  #include <stdio.h>
  #include <ctype.h>
  #include <stdlib.h>
  #include <math.h>
  #include "string.h"
  extern yylineno;
  extern int yylex(void);
  extern char *yytext;
  extern FILE *yyin;
  int errors = 0;
  void yyerror(char const *s);
%}

/*Declaraciones de Bison */
%define parse.error verbose
%define parse.trace
%start FUNCION;
%token numero
%token id
%token para
%token parc
%token coma
%token igual
%token mayor
%token menor
%token corcha
%token corchc
%token puntocoma
%token dospuntos
%token asignar
%token def
%token And
%token Else
%token Is
%token Return
%token Break
%token For
%token Not
%token While
%token Continue
%token If
%token Or
%token Import
%token Pass
%token Elif
%token In
%token Print
%token Range
%token suma
%token resta
%token multi
%token divi
%token boleano
%token negacion
%token mod
%token diferente
%token diventero
%token mcador
%token reduccion
%token incremento
%token mmayor
%token mmenor
%token ErrorLex

%token comentario
%token string

%left def id

 /* Reglas */

%%

FUNCION : IMPORT def id para PARAMETRO parc dospuntos SENTENCIAS Return VARIABLES 
        | def id para PARAMETRO parc dospuntos SENTENCIAS Return VARIABLES 
        | error SENTENCIAS           
        ;
VARIABLES : id
          | id corcha VARIABLES corchc
          | id corcha VARIABLES corchc corcha VARIABLES corchc
          ;
PARAMETRO : 
          | VARIABLES coma PARAMETRO
          | VARIABLES
          ;
OPERADORES : suma
           | resta
           | multi
           | divi
           | And
           | Or
           | Not
           ;
OPERACIONES : VARIABLES OPERADORES OPERACIONES
            | VARIABLES
            | numero
            ;
SENTENCIAS : 
           | VARIABLES asignar boleano SENTENCIAS
           | VARIABLES asignar string SENTENCIAS
           | VARIABLES asignar OPERACIONES SENTENCIAS
           | VARIABLES SENTENCIAS
           | comentario SENTENCIAS
           | WHILE SENTENCIAS
           | FOR SENTENCIAS
           | IF SENTENCIAS
           | error SENTENCIAS
           | Break SENTENCIAS
           | Continue SENTENCIAS
           | Pass SENTENCIAS
           | Print para PARAMETRO parc SENTENCIAS
           ;
RANGE : Range para id para PARAMETRO parc parc
      | Range para PARAMETRO parc
      ;
SECUENCIA : RANGE
          | VARIABLES
          ;
OPBULEANAS : mayor
           | menor
           | igual
           | mmayor
           | mmenor
           | diferente
           ;
EXP_BOLEANA : OPERACIONES OPBULEANAS boleano
            | OPERACIONES OPBULEANAS OPERACIONES
            | boleano OPBULEANAS OPERACIONES
            | boleano
            ;
WHILE : While EXP_BOLEANA dospuntos
      ;
FOR : For VARIABLES In SECUENCIA dospuntos
    ;
ELIF : Elif EXP_BOLEANA dospuntos SENTENCIAS ELIF
     | 
     ;
NELIF : corcha ELIF corchc
      ;
IF : If EXP_BOLEANA dospuntos NELIF
   | If EXP_BOLEANA dospuntos SENTENCIAS Else dospuntos 
   ;
IMPORT : Import id
       ;
%%
/* Reglas */

/* Codigo C */

void yyerror(char const *s)
{
	printf("Line %d: %s \n",yylineno,s);
	errors=errors+1;
}

void main(int argc, char *argv[]){
  if(argc != 2){
    printf("Falta archivo <./a.out 'filename'> \n");
    exit(0);
  }
	
	if (argc>1)
		yyin=fopen(argv[1],"rt");
	else
		//yyin=stdin;
		yyin=fopen("entrada.txt","rt");
	yyparse();
	printf("Errores Encontrados: %d \n",errors);
}

/* Codigo C */