LEX PROGRAM TO CONVERT THE SUBSTRING abc TO ABC

%{
#include <stdio.h>
#include <string.h>
%}

%%

[a-zA-Z]+ {
    int i;
    for(i = 0; i <= yyleng - 3; i++) {
        if(yytext[i] == 'a' && yytext[i+1] == 'b' && yytext[i+2] == 'c') {
            yytext[i] = 'A';
            yytext[i+1] = 'B';
            yytext[i+2] = 'C';
        }
    }
    printf("%s", yytext);
}

[\t\n]+  ;   // Ignore tabs and newlines
.        { printf("%s", yytext); } // Print any other character as is

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
