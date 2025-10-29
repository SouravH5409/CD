%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%token DO WHILE NUM ID RELOP

%%
S: DO_STMT                  {printf("Valid do-while Syntax \n");}
  ;
DO_STMT :DO BLOCK WHILE '(' COND ')'';'
		;
BLOCK : '{' STMT_L '}'
	   ;
STMT_L : STMT_L STMT
	     | STMT
	     ;

STMT : ID '=' EXPR ';'
	 ;
EXPR : ID
	 | NUM
	 | EXPR '+' EXPR
	 | EXPR '-' EXPR
	 | EXPR '*' EXPR
	 | EXPR '/' EXPR
	 ;
COND : ID RELOP ID
	  | ID RELOP NUM
	  | NUM RELOP ID
	  ;
%% 
void yyerror(const char *s){
	printf("invalid do - while syntax \n");
}
int main(){
printf("Enter a  do while statement  : \n ");
yyparse();
return 0;
}
