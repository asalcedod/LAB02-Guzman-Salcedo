/* Includes y definiciones de variables */
%option yylineno
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
%option yylineno
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

and       { return(And); }
break     { return(Break); }
continue  { return(Continue); }
def       { return(def); }
elif      { return(Elif); }
else      { return(Else); }
for       { return(For); }
if        { return(If); }
import    { return(Import); }
in        { return(In); }
is        { return(Is); }
not       { return(Not); }
or        { return(Or); }
pass      { return(Pass); }
print     { return(Print); }
range     { return(Range); }
return    { return(Return); }
while     { return(While); }
{boolean} { return(boleano); }
[[]           {return(corcha);}
[]]           {return(corchc);}
[;]           
[:]           {return(dospuntos);}
[>][>][=]     {return(mmayor);}
[<][<][=]     {return(mmenor);}
[+][=]        {return(incremento);}
[-][=]        {return(reduccion);}
[*][=]        {return(mcador);}
[/][=]        
[/][/][=]     {return(diventero);}
[&][=]        
[*][*][=]     
[%][=]        
[+]           {return(suma);}
[-]           {return(resta);}
[*]           {return(multi);}
[*][*]|(^)    
{asign}       {return(asignar);}
[/]           {return(divi);}
[/][/]        
[%]           {return(mod);}
[<][<]        {return(mmenor);}
[>][>]        {return(mmayor);}
[&]           
[~]           {return(negacion);}
[<]           {return(mayor);}
[>]           
[<][=]        
[>][=]        
[=][=]        {return(igual);}
[!][=]|[<][>] {return(diferente);}
[(]           {return(para);}
[)]           {return(parc);}
[,]           {return(coma);}
{variable}    {return(id);}
{entero}      {return(numero);}
{decimal}     {return(numero);}
{exp}         {return(numero);}
{img}         {return(numero);}
{logint}      {return(numero);}
{string}      {return(string);}
{error}       {errores++;return(ErrorLex);}
{comentario}  {return(comentario);}
\n            {linea++;}
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