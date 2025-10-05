%{
#include <stdio.h>
#include <stdlib.h>

// Declare yylex and yyerror to avoid implicit warnings
int yylex(void);
int yyerror(const char *s);
%}

%token VARIABLE

%%
input:
    | input line
    ;

line:
    VARIABLE '\n'     { printf("Valid variable name\n"); }
  | error '\n'        { printf("Invalid variable name\n"); yyerrok; }
  ;
%%

int main(void) {
    printf("Enter a variable name:\n");
    yyparse();
    return 0;
}

int yyerror(const char *s) {
    return 0;
}

