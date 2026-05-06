%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "ast.h"
#include "executor.h"

int yylex();
void yyerror(const char *s);

struct AST *program_root = NULL;

struct AST* connect_statements(struct AST *left, struct AST *right) {

    if(left == NULL)
        return right;

    struct AST *node = create_node("PROGRAM");

    node->left = left;
    node->right = right;

    return node;
}
%}

%union {

    char* str;
    struct AST* node;
}

%token INT_TYPE
%token PRINT INPUT
%token IF ELSE LOOP

%token <str> ID NUMBER STRING

%token PLUS MINUS MUL DIV ASSIGN SEMI

%token EQ NEQ GT LT GTE LTE

%token LPAREN RPAREN
%token LBRACE RBRACE

%type <node> program stmt stmt_list expr term factor condition block

%%

program:
      stmt_list
        {
            $$ = $1;
            program_root = $$;
        }
;

stmt_list:
      stmt_list stmt
        {
            $$ = connect_statements($1, $2);
        }

    | stmt
        {
            $$ = $1;
        }
;

stmt:
      INT_TYPE ID SEMI
        {
            $$ = create_op_node(
                    "DECLARE",
                    create_node($2),
                    NULL
                 );
        }

    | ID ASSIGN expr SEMI
        {
            $$ = create_op_node(
                    "=",
                    create_node($1),
                    $3
                 );
        }

    | INPUT ID SEMI
        {
            $$ = create_op_node(
                    "INPUT",
                    create_node($2),
                    NULL
                 );
        }

    | PRINT expr SEMI
        {
            $$ = create_op_node(
                    "PRINT",
                    $2,
                    NULL
                 );
        }

    | PRINT STRING SEMI
        {
            $$ = create_op_node(
                    "PRINT_STRING",
                    create_node($2),
                    NULL
                 );
        }

    | IF LPAREN condition RPAREN block ELSE block
        {
            $$ = create_op_node(
                    "IF",
                    $3,
                    create_op_node(
                        "BLOCK",
                        $5,
                        $7
                    )
                 );
        }

    | LOOP LPAREN condition RPAREN block
        {
            $$ = create_op_node(
                    "LOOP",
                    $3,
                    $5
                 );
        }
;

block:
      LBRACE stmt_list RBRACE
        {
            $$ = $2;
        }
;

condition:
      expr GT expr
        {
            $$ = create_op_node(">", $1, $3);
        }

    | expr LT expr
        {
            $$ = create_op_node("<", $1, $3);
        }

    | expr EQ expr
        {
            $$ = create_op_node("==", $1, $3);
        }

    | expr NEQ expr
        {
            $$ = create_op_node("!=", $1, $3);
        }

    | expr GTE expr
        {
            $$ = create_op_node(">=", $1, $3);
        }

    | expr LTE expr
        {
            $$ = create_op_node("<=", $1, $3);
        }
;

expr:
      expr PLUS term
        {
            $$ = create_op_node("+", $1, $3);
        }

    | expr MINUS term
        {
            $$ = create_op_node("-", $1, $3);
        }

    | term
        {
            $$ = $1;
        }
;

term:
      term MUL factor
        {
            $$ = create_op_node("*", $1, $3);
        }

    | term DIV factor
        {
            $$ = create_op_node("/", $1, $3);
        }

    | factor
        {
            $$ = $1;
        }
;

factor:
      NUMBER
        {
            $$ = create_node($1);
        }

    | ID
        {
            $$ = create_node($1);
        }

    | LPAREN expr RPAREN
        {
            $$ = $2;
        }
;

%%

int evaluate(struct AST *root) {

    if(root == NULL)
        return 0;

    if(strcmp(root->value, "+") == 0)
        return evaluate(root->left) + evaluate(root->right);

    if(strcmp(root->value, "-") == 0)
        return evaluate(root->left) - evaluate(root->right);

    if(strcmp(root->value, "*") == 0)
        return evaluate(root->left) * evaluate(root->right);

    if(strcmp(root->value, "/") == 0)
        return evaluate(root->left) / evaluate(root->right);

    if(strcmp(root->value, ">") == 0)
        return evaluate(root->left) > evaluate(root->right);

    if(strcmp(root->value, "<") == 0)
        return evaluate(root->left) < evaluate(root->right);

    if(strcmp(root->value, "==") == 0)
        return evaluate(root->left) == evaluate(root->right);

    if(strcmp(root->value, "!=") == 0)
        return evaluate(root->left) != evaluate(root->right);

    if(strcmp(root->value, ">=") == 0)
        return evaluate(root->left) >= evaluate(root->right);

    if(strcmp(root->value, "<=") == 0)
        return evaluate(root->left) <= evaluate(root->right);

    if(isdigit(root->value[0]))
        return atoi(root->value);

    return get_value(root->value);
}

void execute(struct AST *root) {

    if(root == NULL)
        return;

    if(strcmp(root->value, "PROGRAM") == 0) {

        execute(root->left);
        execute(root->right);
    }

    else if(strcmp(root->value, "=") == 0) {

        int val = evaluate(root->right);

        set_value(root->left->value, val);
    }

    else if(strcmp(root->value, "INPUT") == 0) {

        int val;

        scanf("%d", &val);

        set_value(root->left->value, val);
    }

    else if(strcmp(root->value, "PRINT") == 0) {

        printf("%d\n", evaluate(root->left));
    }

    else if(strcmp(root->value, "PRINT_STRING") == 0) {

        char temp[100];

        strcpy(temp, root->left->value);

        int len = strlen(temp);

        temp[len - 1] = '\0';

        printf("%s\n", temp + 1);
    }

    else if(strcmp(root->value, "IF") == 0) {

        if(evaluate(root->left)) {

            execute(root->right->left);
        }

        else {

            execute(root->right->right);
        }
    }

    else if(strcmp(root->value, "LOOP") == 0) {

        while(evaluate(root->left)) {

            execute(root->right);
        }
    }
}

void yyerror(const char *s) {

    printf("Syntax Error\n");
}

int main() {

    yyparse();

    execute(program_root);

    return 0;
}