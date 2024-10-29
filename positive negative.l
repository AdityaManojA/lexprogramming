%{
int p=0;
int n=0;
%}
%%
[0-9] {p++;}
[-][0-9] {n++;}
end {printf("No of postive numbers is %d and negative number is %d",p,n);
exit(0);
}
%%
int main (){
    printf("Enter the numbers");
    yylex();
    return 0;
}
int yywrap(){
    return 1; // to indicate that there's no more input to be read
}
