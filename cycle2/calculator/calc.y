%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
int yyerror(const char *s);
%}

%token NUMBER

%left '+' '-'
%left '*' '/'

%%
input:
    | input line
    ;

line:
    expr '\n'    { printf("Result = %d\n", $1); }
  | '\n'         { /* ignore blank lines */ }
  ;

expr:
    expr '+' expr   { $$ = $1 + $3; }
  | expr '-' expr   { $$ = $1 - $3; }
  | expr '*' expr   { $$ = $1 * $3; }
  | expr '/' expr   { 
                        if ($3 == 0) {
                            yyerror("Division by zero");
                            $$ = 0;
                        } else {
                            $$ = $1 / $3;
                        }
                    }
  | '(' expr ')'     { $$ = $2; }
  | NUMBER           { $$ = $1; }
  ;
%%

int main(void) {
    printf("Enter expressions (Ctrl+D to exit):\n");
    return yyparse();
}

int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}

