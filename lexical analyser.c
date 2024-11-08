#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

char *keywords[] = { "auto", "break", "case", "char", "const", "continue", "default",
                     "do", "double", "else", "enum", "extern", "float", "for", "goto",
                     "if", "int", "long", "register", "return", "short", "signed",
                     "sizeof", "static", "struct", "switch", "typedef", "union",
                     "unsigned", "void", "volatile", "while" };

int isKeyword(char *word) {
    for (int i = 0; i < 32; i++) 
        if (!strcmp(keywords[i], word)) return 1;
    return 0;
}

int main() {
    FILE *fp = fopen("program.txt", "r");
    if (!fp) return printf("Error opening file\n"), 1;

    char ch, buffer[15]; int j = 0;
    while ((ch = fgetc(fp)) != EOF) {
        if (strchr("+-*/%=<>", ch)) 
            printf("%c is an operator\n", ch);

        if (isalnum(ch)) buffer[j++] = ch;
        else if ((isspace(ch) || ch == '\n') && j) {
            buffer[j] = '\0', j = 0;
            printf("%s is %s\n", buffer, isKeyword(buffer) ? "a keyword" : 
                   isdigit(buffer[0]) ? "a number" : "an identifier");
        }
    }
    fclose(fp);
    return 0;
}