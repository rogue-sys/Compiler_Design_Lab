PROGRAM TO DISPLAY NUMBER OF LINES,WORDS AND

%{
#include <stdio.h>
int line = 1, word = 0, ch = 0;
%}

%%

[a-zA-Z0-9]+ { ch += yyleng; word++; }  // Match alphanumeric words and increment character and word counts
[ \t]       ;                          // Ignore whitespace (spaces and tabs)
\n          { line++; word++; }         // Increment line and word count on newline
.           { ch++; }                   // Match any other character and increment character count

%%

int main(int argc, char *argv[]) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror("Error opening file");
            return 1;
        }
    }
    yylex();
    printf("Lines = %d\n", line);
    printf("Words = %d\n", word);
    printf("Characters = %d\n", ch);
    return 0;
}

int yywrap() {
    return 1;
}
