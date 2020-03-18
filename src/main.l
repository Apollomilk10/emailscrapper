

/*SECAO 1 - DEFINICOES */ 

%{
#include <stdio.h>
%}


alfanumericos[a-zA-Z0-9]
invalidos[\.\-_]

/* SECAO 2 - REGRAS */
%%

({alfanumericos}+{invalidos}*{alfanumericos}+@{alfanumericos}){
    printf("%s\n",yytext);

}
. ; 

\n ;

%%
/*    SECAO 3 - SUBROTINAS*/

int main() {
  yylex();
  return 0;
}
