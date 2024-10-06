%%
f=@(x) sin(x)./x+cos(x.*10);interval=[0,10];
dot_num=10;
[y,error]=composite_quadrature_2(interval, f, dot_num);
