%{
    #include<stdio.h>
int word_count = 0;
%}

%%
[ \t\n]+       {printf("sadjksa");}              // Skip whitespace
[a-zA-Z0-9]+      { word_count++; }
.                 ;               // Ignore other characters
%%

int main() {
    yylex();
    printf("end");
    printf("Total  apurva words: %d\n", word_count);
    return 0;
}

int yywrap() {
    return 1;
}
