#ifndef EXECUTOR_H
#define EXECUTOR_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

struct variable {

    char name[50];
    int value;
};

struct variable vars[100];

int var_count = 0;

void set_value(char *name, int value) {

    for(int i = 0; i < var_count; i++) {

        if(strcmp(vars[i].name, name) == 0) {

            vars[i].value = value;

            return;
        }
    }

    strcpy(vars[var_count].name, name);

    vars[var_count].value = value;

    var_count++;
}

int get_value(char *name) {

    for(int i = 0; i < var_count; i++) {

        if(strcmp(vars[i].name, name) == 0) {

            return vars[i].value;
        }
    }

    return 0;
}

#endif