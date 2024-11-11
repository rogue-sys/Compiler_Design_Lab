LEX PROGRAM TO FIND NUMBER OF VOWELS AND
CONSONENTS

%{
int vow_count = 0;
int const_count = 0;
%}

%%

[aeiouAEIOU] {vow_count++;}       // Count vowels
[a-zA-Z] {const_count++;}         // Count consonants (both lowercase and uppercase)

%%

int yywrap() {
    return 1;  // Return 1 to indicate end of input
}

int main() {
    printf("Enter the string of vowels and consonants: ");
    yylex();  // Start lexical analysis
    printf("Number of vowels: %d\n", vow_count);
    printf("Number of consonants: %d\n", const_count);
    return 0;
}
