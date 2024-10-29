%{
int p=0;
int n=0;
%}
%%
[0-9] {p++;}
-[0-9] {n++;}
end {printf("No of postive numbers is %d and negative number is %d",p,n);}