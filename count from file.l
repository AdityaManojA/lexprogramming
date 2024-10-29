%{
int l = 0;
int ch = 0;
int w = 0;
%}
%%
[a-zA-Z] {ch++;}
" " {w++;}
\n {l++;}
%%

int main (){
    yyin=fopen("text.txt","r");
    yylex();
    printf("Number of lines: %d\n", l); printf("Number of words: %d\n", w); printf("Number of characters: %d\n", ch);
}
int yywrap() 
{
    return 1;  // Return 1 to indicate that there's no more input.
}