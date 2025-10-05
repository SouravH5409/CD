%{
#include "y.tab.h"
%}

%%
"for"            { return FOR; }
"++"             { return INCOP; }
"--"             { return DECOP; }
"<="|">="|"=="|"!="|"<"|">"  { return RELOP; }
"="              { return ASSIGN; }
";"              { return SEMICOLON; }
"("              { return LPAREN; }
")"              { return RPAREN; }
[0-9]+           { return NUM; }
[a-zA-Z_][a-zA-Z0-9_]*   { return ID; }
[ \t\n]          { /* skip whitespace */ }
.                { /* ignore invalid characters */ }
%%

int yywrap() {
    return 1;
}
