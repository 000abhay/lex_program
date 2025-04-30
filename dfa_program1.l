%{
    #include <stdio.h>
%}

%s A B DEAD

%%

<INITIAL>a          { BEGIN A; }
<INITIAL>b          { BEGIN DEAD; }
<INITIAL>\n         { printf("Not Accepted (empty or starts with 'b')\n"); BEGIN INITIAL; }
<INITIAL>[^ab\n]    { BEGIN DEAD; }

<A>a                { /* stay in A */ }
<A>b                { BEGIN B; }
<A>\n               { printf("Not Accepted (ends with 'a')\n"); BEGIN INITIAL; }
<A>[^ab\n]          { BEGIN DEAD; }

<B>a                { BEGIN A; }
<B>b                { /* stay in B */ }
<B>\n               { printf("Accepted\n"); BEGIN INITIAL; }
<B>[^ab\n]          { BEGIN DEAD; }

<DEAD>\n            { printf("Invalid Input\n"); BEGIN INITIAL; }
<DEAD>.             { /* stay in DEAD */ }

%%

int main() {
    printf("Enter strings (Ctrl+D to end):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
