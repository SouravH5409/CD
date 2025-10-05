%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token FOR ID NUM RELOP INCOP DECOP ASSIGN SEMICOLON LPAREN RPAREN

%%
for_stmt : FOR LPAREN expr SEMICOLON condition SEMICOLON expr RPAREN
           { printf("Valid FOR statement syntax\n"); }
         ;

expr     : ID ASSIGN ID
         | ID ASSIGN NUM
         | ID INCOP
         | ID DECOP
         | /* empty */
         ;

condition : ID RELOP ID
          | ID RELOP NUM
          | /* empty */
          ;
%%

void yyerror(const char *s) {
    printf("Invalid FOR statement syntax\n");
}

int main() {
    printf("Enter a FOR statement:\n");
    yyparse();
    return 0;
}

