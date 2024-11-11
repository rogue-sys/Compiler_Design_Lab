%{
#include <stdio.h>
int valid = 1;   // Flag to indicate validity of identifier
%}
%token DIGIT LETTER
%%
start : LETTER s { /* Start rule */ }
s : LETTER s      // Additional letters or digits
  | DIGIT s       // Digits following the initial letter
  |               // Empty rule to allow end of identifier
;
%%
int yyerror() {
    printf("\nIt's not a valid identifier!\n");
    valid = 0;
    return 0;
}
int main() {
    printf("\nEnter a name to be tested as an identifier: ");
    yyparse();
    if (valid) {
        printf("\nIt is a valid identifier!\n");
    }
    return 0;
}
