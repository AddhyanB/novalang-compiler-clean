#ifndef AST_H
#define AST_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct AST {

    char value[50];

    struct AST *left;
    struct AST *right;
};

struct AST* create_node(char *val) {

    struct AST *node = (struct AST*)malloc(sizeof(struct AST));

    strcpy(node->value, val);

    node->left = NULL;
    node->right = NULL;

    return node;
}

struct AST* create_op_node(char *op, struct AST *left, struct AST *right) {

    struct AST *node = create_node(op);

    node->left = left;
    node->right = right;

    return node;
}

#endif