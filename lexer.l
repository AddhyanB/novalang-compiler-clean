%{
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%%
"letz"        { return INT; }
"echoz"       { return PRINT; }
"when"        { return IF; }
"otherwise"   { return ELSE; }
"repeat"      { return WHILE; }

"<-"          { return ASSIGN; }
"!"           { return SEMI; }

"<="          { return LE; }
">="          { return GE; }
"=="          { return EQ; }
"!="          { return NE; }
"<"           { return LT; }
">"           { return GT; }

"{"           { return LBRACE; }
"}"           { return RBRACE; }
"("           { return LPAREN; }
")"           { return RPAREN; }

[0-9]+        { yylval.num = atoi(yytext); return NUMBER; }

[a-zA-Z_][a-zA-Z0-9_]* {
    yylval.id = strdup(yytext);
    return ID;
}

"+"           { return PLUS; }
"-"           { return MINUS; }
"*"           { return MUL; }
"/"           { return DIV; }

[ \t\n]       { }

.             { printf("Invalid token: %s\n", yytext); }
%%

int yywrap() { return 1; }