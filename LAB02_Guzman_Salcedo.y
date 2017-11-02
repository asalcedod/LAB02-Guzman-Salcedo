/* Includes y definiciones de variables */
%{
  #include <stdio.h>
  #include <ctype.h>
  #include <stdlib.h>
  #include <math.h>
  #include "string.h"
  extern int yylex(void);
  extern char *yytext;
  extern int linea;
  extern FILE *yyin;
  void yyerror(char *s);
%}

/*Declaraciones de Bison */

%start FUNCION;
%token numero
%token para
%token parc
%token coma
%token igual
%token mayor
%token menor
%token corcha
%token corchc
%token puntocoma
%token id
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
%token comentario
%token string

/* Reglas */

%%

FUNCION : id para PARAMETRO parc dospuntos SENTENCIAS {printf(" Esto es una funcion ");}
        | id para PARAMETRO parc
        ;
PARAMETRO : id coma PARAMETRO
          | id
          | numero coma PARAMETRO
          | numero
          ;
OPERADORES : suma
           | resta
           | multi
           | divi
           ;
OPERACIONES : id OPERADORES OPERACIONES
            | numero OPERADORES OPERACIONES
            | numero
            | id
            ;
SENTENCIAS : id asignar boleano SENTENCIAS
           | id asignar string SENTENCIAS
           | id asignar OPERACIONES SENTENCIAS
           | id SENTENCIAS
           | comentario
           | WHILE
           | FOR
           | id
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
            | OPERACIONES
            ;
WHILE : While id EXP_BOLEANA dospuntos SENTENCIAS
      ;
SECUENCIA : Range para PARAMETRO parc
          | Range para FUNCION parc
          | corcha PARAMETRO corchc
          ;
FOR : For id In SECUENCIA dospuntos SENTENCIAS
    ;

    
%%
/* Reglas */

/* Codigo C */

void yyerror(char *s)
{
	printf(" Error sintactico %s \n",s);
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
		
	yylex();
	yyparse();
}

/* Codigo C */