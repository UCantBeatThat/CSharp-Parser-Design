%{

	#include "cSharpParser.tab.h"
	#include "../Token_Generation/token_gen.h"
	int row =1, col = 1;
%}

%%
"using" {printf("%s", yytext); initialize_tokens();  generateTokens(yytext, row, col); col+=strlen(yytext); return USING;}
";" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return SEMI_COLON;}
"." {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return DOT;}
"@" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return AT;}
"class" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return CLASS;}
("static"|"new"|"public"|"protected"|"internal"|"private"|"abstract") {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return MODIFIERS;}
":" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return COLON;}
"object" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return OBJECT;}
"{" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return OPCU;}
"}" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return CLCU;}
"[" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return OPSQ;}
"]" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return CLSQ;}
"const" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return CONST;}
"," {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return COMMA;}
"=" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return ASSIGN;}
"?" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return QUESTION_MARK;}
"||" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return LOGICAL_OR;}
"&&" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return LOGICAL_AND;}
"|" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return OR;}
"^" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return XOR;}
"&" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return AND;}
("=="|"!="|"<"|">"|"<="|">=") {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return RELOP;}
("+"|"-") {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return ADDOP;}
("*"|"/"|"%") {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return MULOP;}
("+="|"-="|"*="|"/="|"%=") {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return SHORTHAND;}
"(" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return OPBR;}
")" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return CLBR;}
"partial" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return PARTIAL;}
"void" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return VOID;}
"var" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return VAR;}
"if" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return IF;}
"else" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return ELSE;}
"switch" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return SWITCH;}
"case" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return CASE;}
"default" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return DEFAULT;}
"while" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return WHILE;}
"for" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return FOR;}
"break" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return BREAK;}
"continue" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return CONTINUE;}
"return" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return RETURN;}
("sbyte"|"byte"|"int"|"char"|"string") {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return INTEGRAL_TYPE;}
("float"|"double") {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return FLOATING_POINT_TYPE;}
"bool" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return BOOL;}
[0-9]+ {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return NUMBER;}
"sizeof" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return SIZEOF;}
"namespace" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return NAMESPACE;}
"!" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return NOT;}
"~" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return NEGATE;}
"++" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return INCREMENT;}
"--" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return DECREMENT;}
"\'"[a-zA-Z]"\'" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return CHARACTER_LITERAL;}
"\""(.)*"\"" {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return STRING_LITERAL;}
[a-zA-Z_][a-zA-Z0-9_]* {printf("%s", yytext); generateTokens(yytext, row, col); col+=strlen(yytext); return AVAILABLE_IDENTIFIER;}
. {printf("%s", yytext); col++;}
"\n" {printf("%s", yytext); row++; col = 1;}
%%

int yywrap(){
	return 1;
}