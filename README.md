LEXICAL ANALYZER

To run this lexical analyzer code and get the output, follow these steps:

//Create a file named lexical_analyzer.c
//Create another file named program.txt in the same directory as lexical_analyzer.c.

//example code:(program.txt)
int main() {
    int a = 5;
    float b = 3.14;
    if (a > b) {
        a = a + b;
    }
    return 0;
}

//compile using gcc lexical_analyzer.c -o lexical_analyzer
//run using ./lexical_analyzer
//output should look like this
int is keyword
main is identifier
( is special character
) is special character
{ is special character
int is keyword
a is identifier
= is operator
5 is constant
; is special character
float is keyword
b is identifier
= is operator
3.14 is constant
; is special character
if is keyword
( is special character
a is identifier
> is operator
b is identifier
) is special character
{ is special character
a is identifier
= is operator
a is identifier
+ is operator
b is identifier
; is special character
} is special character
return is keyword
0 is constant
; is special character
} is special character

