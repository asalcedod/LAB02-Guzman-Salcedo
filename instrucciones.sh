#!/bin/bash
bison -d LAB02_Guzman_Salcedo.y
lex LAB02_Guzman_Salcedo.l
gcc lex.yy.c LAB02_Guzman_Salcedo.tab.c -o LAB02_Guzman_Salcedo -lfl -lm
./LAB02_Guzman_Salcedo prueba1.py > Salida.txt
