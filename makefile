LAB02_Guzman_Salcedo: LAB02_Guzman_Salcedo.l LAB02_Guzman_Salcedo.y
	bison -d LAB02_Guzman_Salcedo.y
	lex LAB02_Guzman_Salcedo.l
	gcc lex.yy.c LAB02_Guzman_Salcedo.tab.c -o $@ -lfl -lm