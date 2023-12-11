%{
#include "parser.tab.h"
%}

%%

int                           { return T_INTEGER_TYPE; }
string                        { return T_STRING_TYPE; }
var                           { return T_VAR; }
=                             { return T_ASSIGN; }
se                            { return T_IF; }
senao                         { return T_ELSE; }
pracada                       { return T_LOOP; }
ou                            { return T_OR; }
e                             { return T_AND; }
Igualzin                      { return T_IGUALZIN; }
Fluminense                    { return T_FLUMINENSE; }
Flamengo                      { return T_FLAMENGO; }
Maix                          { return T_MAIX; }
Menox                         { return T_MENOX; }
Multiplica                    { return T_MULTIPLICA; }
divide                        { return T_DIVIDE; }
flamenguista                  { return T_FLAMENGUISTA; }
ponto                         { return T_DOT; }
paporeto                      { return T_PAPORETO; }
cao                           { return T_CAO; }



True                          { return T_TRUE; }
False                         { return T_FALSE; }

[a-zA-Z_][a-zA-Z_0-9]*        { return T_IDENTIFIER; }

\"([^\\\"]|\\(.|\n)|[@#$%^&*()_+{}[\]|:;'<>,.?/!~-])*\" { return T_STRING; }

[0-9]+                        { return T_NUMBER; }

.                             { return T_NEW_SENTENCE; }

\n                            { /* handle new lines */ }

[ \t\r]+                      { /* ignore extra whitespace */ }

%%
