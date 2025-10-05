%{
#include "calc.tab.h"
%}

%%
[0-9]+       { yylval = atoi(yytext); return NUMBER; }
[+\-*/()]      { return yytext[0]; }
\n             { return '\n'; }
[ \t]          ;     // Ignore whitespace
.              { printf("Invalid character: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}
/* flex calc.l
antzuhl@Sourav:~/CDLAB/cycle2$ yacc -d calc.y
antzuhl@Sourav:~/CDLAB/cycle2$ gcc y.tab.c lex.yy.c
antzuhl@Sourav:~/CDLAB/cycle2$ ./a.out */
