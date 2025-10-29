%{
#include"y.tab.h"
%}
%%

"do"                    {return DO;}
"while"               {return WHILE;}
[0-9]+               {return NUM;}
[a-zA-Z_][a-zA-Z0-9_]* {return ID;}
"<"|">"|"<="|">="|"!="   {return RELOP;}
"{"                       {return '{';}
"}"                       {return '}';}
";"                        {return ';';}
"("                        {return '(';}
")"                        {return ')';}
[ \t\n]+                 /*ignore white spaces */
.                            {return yytext[0];}
%%
int yywrap(){
return 1;
}
