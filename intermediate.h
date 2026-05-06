#ifndef INTERMEDIATE_H
#define INTERMEDIATE_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int temp_count = 1;

char code[10000] = "";

/* ADD INTERMEDIATE CODE */

void add_code(char *line) {

    strcat(code, line);
    strcat(code, "\n");
}

/* CREATE TEMP VARIABLE */

char* new_temp() {

    char *temp = (char*)malloc(10);

    sprintf(temp, "t%d", temp_count++);

    return temp;
}

#endif