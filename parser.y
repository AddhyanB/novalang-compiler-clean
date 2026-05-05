%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char *s);

/* -------- SYMBOL TABLE -------- */
struct symbol {
    char name[20];
    int value;
} symtab[100];

int symcount = 0;

/* -------- OUTPUT BUFFER -------- */
char output[10000] = "";

/* -------- FUNCTIONS -------- */

int exists(char *name){
    for(int i=0;i<symcount;i++)
        if(strcmp(symtab[i].name,name)==0) return i;
    return -1;
}

void add_symbol(char *name){
    if(exists(name)!=-1){
        printf("Error: %s already declared\n",name);
        exit(0);
    }
    strcpy(symtab[symcount].name,name);
    symtab[symcount].value=0;
    symcount++;
}

int get_value(char *name){
    int i=exists(name);
    if(i==-1){
        printf("Error: %s not declared\n",name);
        exit(0);
    }
    return symtab[i].value;
}

void set_value(char *name,int val){
    int i=exists(name);
    if(i==-1){
        printf("Error: %s not declared\n",name);
        exit(0);
    }
    symtab[i].value=val;
}

void add_output(int val){
    char temp[50];
    sprintf(temp,"%d\n",val);
    strcat(output,temp);
}
%}

%union {
    int num;
    char* id;
}

%token INT PRINT IF ELSE WHILE
%token <id> ID
%token <num> NUMBER
%token PLUS MINUS MUL DIV ASSIGN SEMI
%token LT GT LE GE EQ NE
%token LBRACE RBRACE LPAREN RPAREN

%type <num> expr condition

%%

program:
    program stmt
    | stmt
;

stmt:
      INT ID SEMI
        { add_symbol($2); }

    | ID ASSIGN expr SEMI
        { set_value($1,$3); }

    | PRINT expr SEMI
        { add_output($2); }

    | IF LPAREN condition RPAREN block else_part
        {
            if($3){
                /* block already executed */
            }
        }

    | WHILE LPAREN condition RPAREN block
        {
            while($3){
                /* simple loop re-evaluation */
                /* NOTE: basic implementation for project */
                break;
            }
        }
;

else_part:
      ELSE block
    | /* empty */
;

block:
    LBRACE program RBRACE
;

condition:
      expr LT expr  { $$ = $1 < $3; }
    | expr GT expr  { $$ = $1 > $3; }
    | expr LE expr  { $$ = $1 <= $3; }
    | expr GE expr  { $$ = $1 >= $3; }
    | expr EQ expr  { $$ = $1 == $3; }
    | expr NE expr  { $$ = $1 != $3; }
;

expr:
      expr PLUS expr  { $$ = $1 + $3; }
    | expr MINUS expr { $$ = $1 - $3; }
    | expr MUL expr   { $$ = $1 * $3; }
    | expr DIV expr   { $$ = $1 / $3; }
    | NUMBER          { $$ = $1; }
    | ID              { $$ = get_value($1); }
;

%%

void yyerror(const char *s){
    printf("Syntax Error\n");
}

int main(){
    printf("Enter NovaLang code (Ctrl+Z then Enter):\n\n");

    yyparse();

    printf("\n--- OUTPUT ---\n");
    printf("%s", output);

    return 0;
}