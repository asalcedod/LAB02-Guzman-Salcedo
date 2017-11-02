/* Includes y definiciones de variables */
%{
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "LAB02_Guzman_Salcedo.tab.h"

int i=1;
char *ids[1000];
int errores=0;
int linea=0;
%}

/* Definiciones Regulares */
boolean     True|true|TRUE|False|false|FALSE
operadores  [+]|[-]|[*]|[*][*]|[/]|[/][/]|[%]|[<][<]|[>][>]|[&]|[|]|(^)|[~][<]|[>]|[<][=]|[>][=]|[=][=]|[!][=]|[<][>]
delimitador [[]|[]]|[;]|[:]|[.]|[,]|[>][>][=]|[<][<][=]|[+][=]|[-][=]|[*][=]|[/][=]|[/][/][=]|[&][=]|[*][*][=]|[%][=]
numero      [0-9]
numeros     {numero}+
entero      ([-])?{numeros}
decimal     {entero}(.{numeros})?
exp         {decimal}(e([-]|[+])?{numeros})?
img         ({entero}|{decimal})(j|J)
logint      {entero}(l|L)
reales      {exp}|{img}|{logint}
letra       [_a-zA-Z]
caracter    [_a-zA-Z0-9]*
variable    {letra}{caracter}
string      [\‘’][^‘]*[\‘’]|[\"][^"]*[\"]|[\'][^']*[\']
comentario  [\#].+
asign       [=]
error       ({entero}{variable})|[^({boolean}|{operadores}|{delimitador}|{numeros}|{entero}|{decimal}|{exp}|{img}|{logint}|{reales}|{variable}|{string}|{comentario}|{asign}|“ ”|t|\n)]|({operadores}{operadores}|{asign}{operadores}|{asign}[?]|{asign}{delimitador})
/*Definiciones Regulares [\"'‘][^"'‘’]*[\"'’]*/

/* Reglas */

%%

and       { int i;
            for (i=0;i<yyleng;i++){
              printf ("%c",toupper(yytext[i]));
            }
            return(And); }
break     { int i;
            for (i=0;i<yyleng;i++){
              printf ("%c",toupper(yytext[i]));
            }
            return(Break); }
continue  { int i;
            for (i=0;i<yyleng;i++){
              printf ("%c",toupper(yytext[i]));
            }
            return(Continue); }
def       { int i;
            for (i=0;i<yyleng;i++){
              printf ("%c",toupper(yytext[i]));
            }
            return(def); }
elif      { int i;
            for (i=0;i<yyleng;i++){
              printf ("%c",toupper(yytext[i]));
            }
            return(Elif); }
else      { int i;
            for (i=0;i<yyleng;i++){
              printf ("%c",toupper(yytext[i]));
            }
            return(Else); }
for       { int i;
            for (i=0;i<yyleng;i++){
              printf ("%c",toupper(yytext[i]));
            }
            return(For); }
if        { int i;
            for (i=0;i<yyleng;i++){
              printf ("%c",toupper(yytext[i]));
            }
            return(If); }
import    { int i;
            for (i=0;i<yyleng;i++){
              printf ("%c",toupper(yytext[i]));
            }
            return(Import); }
in        { int i;
            for (i=0;i<yyleng;i++){
              printf ("%c",toupper(yytext[i]));
            }
            return(In); }
is        { int i;
            for (i=0;i<yyleng;i++){
              printf ("%c",toupper(yytext[i]));
            }
            return(Is); }
not       { int i;
            for (i=0;i<yyleng;i++){
              printf ("%c",toupper(yytext[i]));
            }
            return(Not); }
or        { int i;
            for (i=0;i<yyleng;i++){
              printf ("%c",toupper(yytext[i]));
            }
            return(Or); }
pass      { int i;
            for (i=0;i<yyleng;i++){
              printf ("%c",toupper(yytext[i]));
            }
            return(Pass); }
print     { int i;
            for (i=0;i<yyleng;i++){
              printf ("%c",toupper(yytext[i]));
            }
            return(Print); }
range     { int i;
            for (i=0;i<yyleng;i++){
              printf ("%c",toupper(yytext[i]));
            }
            return(Range); }
return    { int i;
            for (i=0;i<yyleng;i++){
              printf ("%c",toupper(yytext[i]));
            }
            return(Return); }
while     { int i;
            for (i=0;i<yyleng;i++){
              printf ("%c",toupper(yytext[i]));
            }
            return(While); }
{boolean}     { int i;
                for (i=0;i<yyleng;i++){
                  printf ("%c",toupper(yytext[i]));
                }
                return(boleano);
              }
[[]           {printf("corch_abre=%s ",yytext);return(corcha);}
[]]           {printf("corch_cierra=%s ",yytext);return(corchc);}
[;]           {printf("punto_coma=%s ",yytext);}
[:]           {printf("dospuntos=%s ",yytext);return(dospuntos);}
[>][>][=]     {printf("muygrande=%s ",yytext);return(mmayor);}
[<][<][=]     {printf("muypequeño=%s ",yytext);return(mmenor);}
[+][=]        {printf("incremento=%s ",yytext);return(incremento);}
[-][=]        {printf("reduccion=%s ",yytext);return(reduccion);}
[*][=]        {printf("multiplicador=%s ",yytext);return(mcador);}
[/][=]        {printf("div=%s ",yytext);}
[/][/][=]     {printf("div_entero=%s ",yytext);return(diventero);}
[&][=]        {printf("and_igual=%s ",yytext);}
[*][*][=]     {printf("potenciador=%s ",yytext);}
[%][=]        {printf("modulador=%s ",yytext);}
[+]           {printf("suma= %s ",yytext);return(suma);}
[-]           {printf("menos= %s ",yytext);return(resta);}
[*]           {printf("mult= %s ",yytext);return(multi);}
[*][*]|(^)    {printf("potencia= %s ",yytext);}
{asign}       {printf("asig= %s ",yytext);return(asignar);}
[/]           {printf("div= %s ",yytext);return(divi);}
[/][/]        {printf("op_div_entera= %s ",yytext);}
[%]           {printf("op_mod= %s ",yytext);return(mod);}
[<][<]        {printf("muy_menor= %s ",yytext);}
[>][>]        {printf("muy_mayor= %s ",yytext);}
[&]           {printf("and= %s ",yytext);}
[~]           {printf("negacion= %s ",yytext);return(negacion);}
[<]           {printf("menor= %s ",yytext);return(mayor);}
[>]           {printf("mayor= %s ",yytext);}
[<][=]        {printf("menor_ig=%s ",yytext);}
[>][=]        {printf("mayor_ig=%s ",yytext);}
[=][=]        {printf("comp= %s ",yytext);return(igual);}
[!][=]|[<][>] {printf("diferente= %s  ",yytext);return(diferente);}
[(]           {printf("parabre=%s ",yytext);return(para);}
[)]           {printf("parcierr=%s ",yytext);return(parc);}
[,]           {printf("coma=%s ",yytext);return(coma);}
{variable}    {
                 if(i==1){
                    ids[i]=strdup(yytext);
                    printf("id%d=%s ",i,ids[i]);
                    i++;
                 }else{
                    int sw=0;
                    int j=1;
                    int pos=0;
                    while(j<i && sw != 1){
                      if(strcmp(ids[j],strdup(yytext)) == 0){
                        sw=1;
                        pos=j;
                        j=i+i;
                      }
                      j++;
                    }
                    if(sw==0){
                      ids[i]=strdup(yytext);
                      printf("id%d=%s ",i,ids[i]);
                      i++;
                    }else{
                      printf("id%d=%s ",pos,ids[pos]);
                    }
                 }
                 return(id);
              }
{entero}      {printf("entero=%s ",yytext);return(numero);}
{decimal}     {printf("decimal=%s ",yytext);return(numero);}
{exp}         {printf("real=%s ",yytext);return(numero);}
{img}         {printf("imaginario=%s ",yytext);return(numero);}
{logint}      {printf("long=%s ",yytext);return(numero);}
{string}      {printf("cadena=%s ",yytext);return(string);}
{error}       {printf("Error=%s ",yytext);errores++;}
{comentario}  {return(comentario);}
. |\n         {linea++;}
%%

/* Reglas */

/* Codigo C 

void main(int argc, char *argv[]){
  if(argc != 2){
    printf("Falta archivo <./a.out 'filename'> \n");
    exit(0);
  }
  yyin=fopen(argv[1],"r");
  yylex();
  printf("\n");
  int k;
  for(k=1;k<i;k++){
    printf("id%d = %s \n",k,ids[k]);
  }
  printf("\nTotal identificadores: %d \n \n",i-1);
  printf("Error(es): %d \n",errores);
}
 Codigo C */