%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}


%token T_INTEGER_TYPE
%token T_STRING_TYPE
%token T_VAR
%token T_ASSIGN
%token T_IF
%token T_ELSE
%token T_LOOP
%token T_OR
%token T_AND
%token T_IGUALZIN
%token T_FLUMINENSE
%token T_FLAMENGO
%token T_MAIX
%token T_MENOX
%token T_MULTIPLICA
%token T_DIVIDE
%token T_FLAMENGUISTA
%token T_DOT
%token T_PAPORETO
%token T_CAO
%token T_TRUE
%token T_FALSE
%token T_IDENTIFIER
%token T_STRING
%token T_NUMBER
%token T_NEW_SENTENCE
%token T_LAMBDA
%token T_STRING_LITERAL


%start sentence

%%

sentence : T_LAMBDA
         | assign
         | if         
         | loop
         ;

assign : T_VAR T_IDENTIFIER ',' T_ASSIGN boolean_expression
       ;

if          : T_IF boolean_expression block T_ELSE block
            | T_IF boolean_expression block
            ;

loop : T_LOOP boolean_expression block
     ;

block : '{' sentence '}'
      ;

boolean_expression : boolean_clause
                  | boolean_expression T_OR boolean_clause
                  ;

boolean_clause : relational_expression
               | boolean_clause T_AND relational_expression
               ;

relational_expression : expression T_IGUALZIN | T_FLUMINENSE | T_FLAMENGO expression
                   ;

expression : term
          | expression T_MAIX | T_MENOX | T_DOT term
          ;

term : factor
     | term T_MULTIPLICA | T_DIVIDE factor
     ;

factor : T_NUMBER
       | T_STRING_LITERAL
       | T_IDENTIFIER

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}