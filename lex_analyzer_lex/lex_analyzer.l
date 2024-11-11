IMPLEMENTATION OF LEXICAL ANALYSER USING LEX TOOL

%{
#include<stdio.h>
int cnt1=0, cnt2=0, cnt3=0; // counters for different types of brackets
%}

%%
"(" { cnt1++; }      // increment cnt1 for '('
")" { cnt1--; }      // decrement cnt1 for ')'
"[" { cnt2++; }      // increment cnt2 for '['
"]" { cnt2--; }      // decrement cnt2 for ']'
"{" { cnt3++; }      // increment cnt3 for '{'
"}" { cnt3--; }      // decrement cnt3 for '}'
[a-zA-Z] {}          // ignore alphabetic characters
\n {
    // Check balance at the end of each line
    if (cnt1 == 0 && cnt2 == 0 && cnt3 == 0)
        printf("Matching\n");
    else
        printf("Not matching\n");

    // Reset counts for the next line
    cnt1 = 0;
    cnt2 = 0;
    cnt3 = 0;
}
. {}                 // ignore any other characters
%%

int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("Error opening file");
        return 1;
    }
    yylex();
    fclose(yyin);    // close the file after processing
    return 0;
}
