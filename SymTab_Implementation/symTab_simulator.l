%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "hash_symtab.h"

	int checkKeyword(char buf[]){
		char *keys[] = {"static", "protected", "int", "for", "while", "do", "if", "else", "main", "char", "float", "return", "double", "void", "switch", "case", "default", "class", "namespace", "public", "break", "using", "continue", "string"};

		for(int i=0;i<24;i++){
			if(strcmp(buf, keys[i]) == 0)
				return 1;
		}

		return 0;
	}

	char global_type[256], global_scope = 'G';
	int is_func = 0, size;
	int argc = 0, argVals[50];
	char buf[256], func_name[256], func_retType[256], scope;
%}
%%

"/*"(.|"\n")*"*/" {
	printf("\nMultiline comment.. Ignored\n");
}

"//".*"\n" {
	printf("\nSingle Line comment.... Ignored\n");
}

"\""(.)*"\"" {
	printf("\nString Literal.... Ignored\n");	
}

"{" {
	global_scope = 'L';
}

"}" {
	global_scope = 'G';
}

")" {
	if(is_func == 1){
		insertToken(func_name, "FUNC", 0, scope, argc, argVals, func_retType);
		for(int i=0;i<50;i++){
			argVals[i] = 0;
		}
		argc = 0;
		is_func = 0;
	}
}

[a-zA-Z][a-zA-Z0-9_]*[a-zA-Z0-9]* {

	int j = checkKeyword(yytext);
	if(j == 0){
		//printf("\n\n\nGTYPE = %s|%s\n\n\n", global_type, yytext);
		if(strcmp(global_type, "int") == 0 || strcmp(global_type, "float") == 0){
			size = 4;
		}
		else if(strcmp(global_type, "char") == 0){
			size = 1;
		}
		else if(strcmp(global_type, "double") == 0){
			size = 8;
		}
		if(is_func == 1){
			global_scope = 'L';	
			argVals[argc] = compHash(yytext);
			argc++;
		}
		insertToken(yytext, global_type, size, global_scope, 0, NULL, " ");
	}
	else{
		if(strcmp(yytext, "int") == 0 || strcmp(yytext, "char") == 0 || strcmp(yytext, "float") == 0 || strcmp(yytext, "double") == 0 || strcmp(yytext, "string") == 0 || strcmp(yytext, "void") == 0)
			strcpy(global_type, yytext);
	}
}

[a-zA-Z][a-zA-Z0-9_]*[a-zA-Z0-9]*("["[0-9]+"]") {
	//printf("\nIntel Inside..%s\n", yytext);
	int i=0;
	char buf[256];
	while(yytext[i] != '['){
		buf[i] = yytext[i];
		i++;
	}

	buf[i] = '\0';
	i++;
	int num = 0;
	while(yytext[i]!=']'){
		num = num*10 + ((int)yytext[i]-48);
		i++;
	}
	
	if(strcmp(global_type, "int") == 0 || strcmp(global_type, "float") == 0){
		size = 4;
	}
	else if(strcmp(global_type, "char") == 0){
		size = 1;
	}
	else if(strcmp(global_type, "double") == 0){
		size = 8;
	}

	if(is_func == 1){
		global_scope = 'L';
		argVals[argc] = compHash(buf);
		argc++;
	}
	insertToken(buf, global_type, size*num, global_scope, 0, NULL, " ");
}

[a-zA-Z][a-zA-Z0-9_]*[a-zA-Z0-9]*"(" {
	int i=0;
	while(yytext[i] != '('){
		buf[i] = yytext[i];
		i++;
	}
	buf[i] = '\0';
	int j = checkKeyword(buf);
	if(j == 0){
		strcpy(func_name, buf);
		is_func = 1;
		//printf("FUNC\n");
		strcpy(func_retType, global_type);
		scope = global_scope;
		argc = 0;
	}
}

(.|"\n") {}

%%

int yywrap(){
	return 1;
}

void main(int argc, char* argv[]){
	initialize_symtable();
	char str[100] = "../Input_Files/";
	strcat(str, argv[1]);
	yyin = fopen(str, "r");
	yylex();

	displaySymTab();
	printf("\nSymbol Table has been generated(File : SymTab_Implementation/sym_out.txt)\n");
}