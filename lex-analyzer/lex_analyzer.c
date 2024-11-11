#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int isKeyword(char buffer[]) {
    char keywords[32][10] = {
        "auto", "break", "case", "char", "const", "continue", "default",
        "do", "double", "else", "enum", "extern", "float", "for", "goto",
        "if", "int", "long", "register", "return", "short", "signed",
        "sizeof", "static", "struct", "switch", "typedef", "union",
        "unsigned", "void", "volatile", "while"
    };
    for (int i = 0; i < 32; ++i) {
        if (strcmp(keywords[i], buffer) == 0) {
            return 1;
        }
    }
    return 0;
}

int main() {
    char ch, buffer[15], operators[] = "+-*/%=";
    char specialch[] = ",;[]{}";
    char num[] = "0123456789";
    FILE *fp;
    int i, j = 0;

    fp = fopen("program.txt", "r");
    if (fp == NULL) {
        printf("Error while opening the file\n");
        exit(0);
    }

    while ((ch = fgetc(fp)) != EOF) {
        // Check if character is an operator
        for (i = 0; i < strlen(operators); ++i) {
            if (ch == operators[i]) {
                printf("%c is an operator\n", ch);
            }
        }

        // Check if character is a special character
        for (i = 0; i < strlen(specialch); ++i) {
            if (ch == specialch[i]) {
                printf("%c is a special character\n", ch);
            }
        }

        // Build buffer for keywords and identifiers
        if (isalnum(ch)) {
            buffer[j++] = ch;
        } else if ((ch == ' ' || ch == '\n' || ch == '\t') && j != 0) {
            buffer[j] = '\0';
            j = 0;
            if (isKeyword(buffer)) {
                printf("%s is a keyword\n", buffer);
            } else if (isdigit(buffer[0])) {
                printf("%s is a constant\n", buffer);
            } else {
                printf("%s is an identifier\n", buffer);
            }
        }
    }

    fclose(fp);
    return 0;
}
