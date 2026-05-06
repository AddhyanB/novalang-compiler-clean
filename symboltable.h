#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct symbol {

    char name[20];
};

struct symbol symtab[100];

int symcount = 0;

int exists(char *name) {

    for(int i = 0; i < symcount; i++) {

        if(strcmp(symtab[i].name, name) == 0)
            return 1;
    }

    return 0;
}

void add_symbol(char *name) {

    if(exists(name)) {

        printf("Semantic Error: Variable '%s' already declared\n", name);

        exit(0);
    }

    strcpy(symtab[symcount++].name, name);
}

#endif