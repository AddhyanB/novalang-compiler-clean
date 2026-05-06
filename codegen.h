#ifndef CODEGEN_H
#define CODEGEN_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "ast.h"

FILE *cfile;

void start_codegen() {

    cfile = fopen("output.c", "w");

    fprintf(cfile, "#include <stdio.h>\n");
    fprintf(cfile, "#include <string.h>\n\n");

    fprintf(cfile, "int main() {\n\n");
}

void end_codegen() {

    fprintf(cfile, "\nreturn 0;\n");
    fprintf(cfile, "}\n");

    fclose(cfile);
}

void generate_expr(struct AST *root) {

    if(root == NULL)
        return;

    if(strcmp(root->value, "+") == 0 ||
       strcmp(root->value, "-") == 0 ||
       strcmp(root->value, "*") == 0 ||
       strcmp(root->value, "/") == 0 ||
       strcmp(root->value, ">") == 0 ||
       strcmp(root->value, "<") == 0 ||
       strcmp(root->value, "==") == 0 ||
       strcmp(root->value, "!=") == 0 ||
       strcmp(root->value, ">=") == 0 ||
       strcmp(root->value, "<=") == 0) {

        fprintf(cfile, "(");

        generate_expr(root->left);

        fprintf(cfile, " %s ", root->value);

        generate_expr(root->right);

        fprintf(cfile, ")");
    }

    else {

        fprintf(cfile, "%s", root->value);
    }
}

void generate_c(struct AST *root) {

    if(root == NULL)
        return;

    if(strcmp(root->value, "PROGRAM") == 0) {

        generate_c(root->left);
        generate_c(root->right);
    }

    else if(strcmp(root->value, "DECLARE_INT") == 0) {

        fprintf(cfile, "int %s;\n", root->left->value);
    }

    else if(strcmp(root->value, "DECLARE_FLOAT") == 0) {

        fprintf(cfile, "float %s;\n", root->left->value);
    }

    else if(strcmp(root->value, "DECLARE_STRING") == 0) {

        fprintf(cfile, "char %s[100];\n", root->left->value);
    }

    else if(strcmp(root->value, "=") == 0) {

        fprintf(cfile, "%s = ", root->left->value);

        generate_expr(root->right);

        fprintf(cfile, ";\n");
    }

    else if(strcmp(root->value, "PRINT") == 0) {

        fprintf(cfile, "printf(\"%%d\\n\", ");

        generate_expr(root->left);

        fprintf(cfile, ");\n");
    }

    else if(strcmp(root->value, "PRINT_LITERAL") == 0) {

        fprintf(cfile, "printf(\"%%s\\n\", %s);\n", root->left->value);
    }

    else if(strcmp(root->value, "INPUT") == 0) {

        fprintf(cfile, "scanf(\"%%d\", &%s);\n", root->left->value);
    }

    else if(strcmp(root->value, "IF") == 0) {

        fprintf(cfile, "if ");

        generate_expr(root->left);

        fprintf(cfile, " {\n");

        generate_c(root->right->left);

        fprintf(cfile, "}\nelse {\n");

        generate_c(root->right->right);

        fprintf(cfile, "}\n");
    }

    else if(strcmp(root->value, "LOOP") == 0) {

        fprintf(cfile, "while ");

        generate_expr(root->left);

        fprintf(cfile, " {\n");

        generate_c(root->right);

        fprintf(cfile, "}\n");
    }
}

void print_generated_c_code() {

    FILE *fp;

    char ch;

    fp = fopen("output.c", "r");

    if(fp == NULL) {

        printf("Cannot open output.c\n");

        return;
    }

    printf("\n--- GENERATED C CODE ---\n\n");

    while((ch = fgetc(fp)) != EOF) {

        printf("%c", ch);
    }

    fclose(fp);
}

#endif