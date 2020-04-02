/*SECAO 1 - DEFINICOES */ 

%{
#include <stdio.h>
#include <string.h>

int a,ponto = 0;
%}


ALL [a-zA-Z0-9] 
INV [\.\-\_] 

/* SECAO 2 - REGRAS */
%%

  
({ALL}+{INV}*{ALL}+)*@{ALL}+(({INV}+)?{ALL}+)* {

    printf("%s\n", yytext);

    }

({ALL}+{INV}*{ALL}+)*@{ALL}+(({INV}+)?{ALL}+)[.]+ {
  
  do 
  {
    if(yytext[a] == "."){
    ponto ++;
    }

   yytext++;

  }while(ponto < 2);

  yytext[a]=='0';

  printf("%s\n", yytext);
};
. ;

\n;
[[:space:]]+ ;
[[:^space:]]+ ;

%%
/*    SECAO 3 - SUBROTINAS*/

  int main() {
    yylex();
    return 0;
}
