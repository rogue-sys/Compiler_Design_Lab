%{
#include "y.tab.h"
%}
%%
[a-zA-Z_][a-zA-Z_0-9]* { return LETTER; } // Identifier starts with a letter or underscore
[0-9] { return DIGIT; }                  // Recognizes digits
. { return yytext[0]; }                  // For other characters
\n { return 0; }                         // End of line
%%
int yywrap() { return 1; }
