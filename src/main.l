/* Data de submissao: 02/04/2020 */
/* Nome: Lucas Leite Tavares */ 
/* RA: 156377 */



/*SECAO 1 - DEFINICOES */ 

%{
#include <stdio.h>
#include <string.h>


%}

/* Definimos os valores dos alfanumericos e de (ponto, traço e under), de forma que simplificamos*/
/*a regra que encontrara os e-mails*/
ALL [a-zA-Z0-9] 
INV [\.\-\_] 

/* SECAO 2 - REGRAS */
/* Nossa Regra principal, onde selecionamos apenas emails validos*/
/* Para o Problema do Caso7 onde temos um ponto final, criamos uma condição que altera para '\0'*/
%%

({ALL}+{INV}*{ALL}+)+@({ALL}+({INV}*{ALL}+)*)[\.]*[\n\ ] {
  int length = strlen(yytext);


  if (yytext[length-1] == '\n' || yytext[length-1] == ' ')
    yytext[length - 1] = '\0';
  if (yytext[length-2] == '.')
    yytext[length - 2] = '\0';

  printf("%s\n", yytext);
};

. ;

\n;
[[:space:]]+ ;
[[:^space:]]+ ;

%%
/* No final das regras temos as condições de parada*/
/*    SECAO 3 - SUBROTINAS*/

  int main() {
    yylex();
    return 0;
}