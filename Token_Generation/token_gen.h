#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>

FILE *ftoken;
int flagTok = 0;

void initialize_tokens(){
	if(flagTok == 0){
		ftoken = fopen("../Token_Generation/tokens.txt", "w");
		flagTok = 1;
	}
}

void generateTokens(char *tok, int row, int col){

	fprintf(ftoken, "<%s , %d , %d>\n", tok, row, col);
}