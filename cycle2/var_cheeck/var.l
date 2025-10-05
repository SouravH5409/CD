%{
#include "var.tab.h" 
%}

%%
[a-zA-Z][a-zA-Z0-9_]*    { return VARIABLE; }
\n                      { return '\n'; }
.                       { return yytext[0]; }
%%

int yywrap(void) {
    return 1;
}
