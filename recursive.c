#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char input[100];
int i = 0;

void E();
void Edash();
void T();
void Tdash();
void F();

void error() {
    printf("\nError at position %d\n", i + 1);
    printf("Input rejected.\n");
    exit(0);
}

void match(char c) {
    if (input[i] == c)
        i++;
    else
        error();
}

void E() {
    T();
    Edash();
}

void Edash() {
    if (input[i] == '+') {
        match('+');
        T();
        Edash();
    }
}

void T() {
    F();
    Tdash();
}

void Tdash() {
    if (input[i] == '*') {
        match('*');
        F();
        Tdash();
    }
}

void F() {
    if (input[i] == '(') {
        match('(');
        E();
        match(')');
    } else if (input[i] == 'i') {
        match('i');
    } else {
        error();
    }
}

int main() {
    printf("Enter the input string: ");
    scanf("%s", input);
    E();
    if (input[i] == '\0')
        printf("\nInput accepted.\n");
    else
        printf("\nInput rejected.\n");
    return 0;
}

