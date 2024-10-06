f=@(x) cos(x);
interval=[0,pi];

%---------------------------
x=interval_bisection_method(interval,10^(-6),f)