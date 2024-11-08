%{
int l = 0;
int ch = 0;
int w = 0;
%}

%%
[a-zA-Z] {ch++;}
" " {w++;}
\n {l++;}
end {printf("Number of lines: %d\n", l);printf("Number of words: %d\n", w);printf("Number of characters: %d\n", ch);
exit(0);
}
%%

int main (){
    printf("Enter string, type exit to finish");
    yylex();
    return 0;
}
int yywrap() 
{
    return 1;  
}