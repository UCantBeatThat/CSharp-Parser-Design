%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
	int yylex();
	int yyerror();
	extern FILE *yyin;
%}

%token USING SEMI_COLON DOT AT AVAILABLE_IDENTIFIER KEYWORD CLASS MODIFIERS COLON OBJECT STRING OPCU CLCU CONST COMMA ASSIGN QUESTION_MARK LOGICAL_OR LOGICAL_AND OR XOR AND RELOP ADDOP MULOP SHORTHAND OPBR CLBR PARTIAL VOID VAR IF ELSE SWITCH CASE DEFAULT WHILE FOR BREAK CONTINUE RETURN BOOL INTEGRAL_TYPE FLOATING_POINT_TYPE NUMBER SIZEOF INCREMENT DECREMENT STRING_LITERAL VERBATIM_STRING_LITERAL CHARACTER_LITERAL NOT NEGATE NAMESPACE OPSQ CLSQ

%define parse.error verbose

%%
input_section 
:  using_directives namespace_member_declarations
;

using_directives
:  using_namespace_directive 
|  using_directives  using_namespace_directive
| 
;

using_namespace_directive
:  USING  namespace_or_type_name  SEMI_COLON
;

namespace_member_declarations
:   namespace_member_declaration
|   namespace_member_declarations  namespace_member_declaration 
| 
;

namespace_member_declaration
:  namespace_declaration 
|  class_declaration
;

namespace_declaration
:  NAMESPACE   qualified_identifier  namespace_body  semi_colon_opt
;

qualified_identifier
: identifier
|   qualified_identifier  DOT  identifier 
;

identifier
:  AVAILABLE_IDENTIFIER
|  AT  identifier_or_keyword 
;

identifier_or_keyword
:  AVAILABLE_IDENTIFIER
|  KEYWORD
;

namespace_body
:  OPCU  namespace_member_declarations  CLCU
;

class_declaration
:  class_modifiers   partial_opt CLASS  identifier  class_base  class_body  semi_colon_opt 
;

semi_colon_opt
:  SEMI_COLON
| 
;

class_modifiers
:  MODIFIERS
|  MODIFIERS class_modifiers
| 
;

class_base
:  COLON  class_type 
|  COLON  interface_type_list 
|  COLON  class_type   COMMA  interface_type_list 
| 
;

class_type
:  namespace_or_type_name 
|  OBJECT
|  STRING
;

interface_type_list
:  namespace_or_type_name 
|   interface_type_list  COMMA  namespace_or_type_name 
;

class_body
:  OPCU  class_member_declarations  CLCU
;

class_member_declarations
:  class_member_declaration 
|  class_member_declarations  class_member_declaration 
| 
;

class_member_declaration
:  method_declarator 
|  class_declaration 
;

method_declarator
:  method_header  method_body 
; 

method_header
:  method_modifiers  partial_opt   return_type  member_name  OPBR  method_parameters  CLBR 
;

method_parameters
: type_list identifier_list 
| method_parameters  COMMA type identifier_list
|
;

method_modifiers
:  MODIFIERS
|  method_modifiers  MODIFIERS
| 
;

partial_opt
:  PARTIAL
| 
;

return_type
:  type 
|  VOID
;

member_name
:  identifier 
;

method_body
: block
|  SEMI_COLON
;

block
:  OPCU  statement_list  CLCU
;


statement_list
:  statement 
|  statement  statement_list
| 
;

statement
:  declaration_statement  assignment_statement  embedded_statement
;

declaration_statement
:  type_list  identifier_list  SEMI_COLON  declaration_statement
|
;

type_list
: type
;

number_opt
: NUMBER
|
;

identifier_list
: identifier
| identifier COMMA identifier_list
| identifier OPSQ number_opt CLSQ
| identifier OPSQ number_opt CLSQ identifier_list
;

assignment_statement
:  identifier  ASSIGN  expression  SEMI_COLON
|
;

expression
:  simple_expression  exp_prime
;

simple_expression
:  term  simp_exp_prime
;

term
:  factor  term_prime
;

factor
:  identifier
|  NUMBER
;

term_prime
:  MULOP  factor  term_prime
| 
;

simp_exp_prime
:  ADDOP  term  simp_exp_prime
| 
; 

exp_prime
:  RELOP  simple_expression
| 
;

embedded_statement
:  block 
|  selection_statement 
|  iteration_statement 
|  jump_statement 
| 
;

selection_statement 
:  if_statement 
|  switch_statement 
;

if_statement
:  IF  OPBR  expression  CLBR  embedded_statement  else_block
;

else_block
:  ELSE if_statement
|  ELSE embedded_statement
|
;

switch_statement
:  SWITCH  OPBR  expression  CLBR   switch_block
;

switch_block
:  OPCU  switch_sections_opt  CLCU
;

switch_sections_opt
:  switch_sections 
| 
;

switch_sections
:  switch_section 
|  switch_section  switch_sections
;

switch_section
:  switch_label  statement_list 
;

switch_label
:  CASE  expression  COLON
|  DEFAULT  COLON
;

iteration_statement
:  while_statement 
|  for_statement 
;

while_statement
:  WHILE  OPBR   expression  CLBR  embedded_statement 
;

for_statement
:  FOR  OPBR  assignment_statement  SEMI_COLON  expression  SEMI_COLON  assignment_statement  CLBR  embedded_statement 
;

jump_statement
:  break_statement
|  continue_statement 
|  return_statement 
;

break_statement
:  BREAK  SEMI_COLON
;

continue_statement
:  CONTINUE  SEMI_COLON
;

return_statement
:  RETURN  expression  SEMI_COLON
;

namespace_or_type_name
:  identifier 
|  namespace_or_type_name   DOT  identifier 
;

type
:  simple_type  
;

simple_type
:  numeric_type 
|  BOOL
;	

numeric_type
:  INTEGRAL_TYPE 
|  FLOATING_POINT_TYPE
;

%%
int yyerror(char *msg){
	printf("\n\n*******\nError: %s\n*******\n", msg);
	return 1;
}

void main(int argc, char* argv[]){
	
	char str[100] = "../Input_Files/";
	strcat(str, argv[1]);

	yyin = fopen(str, "r");

	do{
		if(yyparse()){
			printf("\nParsing Terminated.... Exiting\n\n");
			exit(0);
		}
	}while(!feof(yyin));

	printf("\nInput has been parsed successfully...\n");
	printf("\nTokens generated from the input are show in 'Token_Generation/tokens.txt'\n");
}