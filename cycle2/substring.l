%{
#include <stdio.h>
#include <string.h>

int flag = 0;
char name[100];
%}

%%
[a-zA-Z]+ {
    flag = 0;
    int len = yyleng;

    // Check for substring "sour" (case-insensitive)
    for (int i = 0; i <= len - 4; i++) {
        if ((yytext[i] == 's' || yytext[i] == 'S') &&
            (yytext[i + 1] == 'o' || yytext[i + 1] == 'O') &&
            (yytext[i + 2] == 'u' || yytext[i + 2] == 'U') &&
            (yytext[i + 3] == 'r' || yytext[i + 3] == 'R')) {
            flag = 1;
            break;
        }
    }

    strcpy(name, yytext);

    if (flag == 1)
        printf("%s contains first 4 letters of the name 'SOURAV' as substring\n", name);
    else
        printf("%s does NOT contain first 4 letters of the name 'SOURAV' as substring\n", name);

    printf("Enter the string: ");
}
[\n]     ;   /* ignore newlines */
.        ;   /* ignore other characters */
%%

int main() {
    printf("Enter the string: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

/* flex substring.l
   gcc lex.yy.c
   ./a.out */

