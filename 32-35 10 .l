%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+\.[0-9]+     { yylval.fval = atof(yytext); return FLOAT; }
[0-9]+             { yylval.fval = atof(yytext); return FLOAT; }
[ \t]+             ;   // ignore whitespace
\n                 { return '\n'; }
.                  { return yytext[0]; }

%%

-----------------------------------------------------------------------------
LEX COMMANDS
flex inputfile.l(filename)
gcc lex.yy.c
./a.out

YACC COMMANDS
flex inputfile.l(filename)
yacc -d inputfile.y(filename)
gcc lex.yy.c y.tab.c
./a.out
