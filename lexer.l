%{
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%%

"letz"        { return INT_TYPE; }

"echoz"       { return PRINT; }
"inputz"      { return INPUT; }

"when"        { return IF; }
"otherwise"   { return ELSE; }

"repeat"      { return LOOP; }

"<-"          { return ASSIGN; }

"=="          { return EQ; }
"!="          { return NEQ; }
">="          { return GTE; }
"<="          { return LTE; }
">"           { return GT; }
"<"           { return LT; }

"{"           { return LBRACE; }
"}"           { return RBRACE; }

"("           { return LPAREN; }
")"           { return RPAREN; }

"!"           { return SEMI; }

\"[^\"]*\" {
    yylval.str = strdup(yytext);
    return STRING;
}

[0-9]+ {
    yylval.str = strdup(yytext);
    return NUMBER;
}

[a-zA-Z_][a-zA-Z0-9_]* {
    yylval.str = strdup(yytext);
    return ID;
}

"+"           { return PLUS; }
"-"           { return MINUS; }
"*"           { return MUL; }
"/"           { return DIV; }

[ \t\n]       { }

. {
    printf("Invalid token: %s\n", yytext);
}

%%

int yywrap() {
    return 1;
}