function [x]=interval_bisection_method(interval,epsilon,f)
a=interval(1);b=interval(2);
count=0;
epsilon=10^(-4);
while b-a>epsilon;
    x=a+(b-a)/2;
    if sign(f(x))==sign(f(a))
        a=x;
    else
        b=x;
    end
    count=count+1;
end
x=a+(b-a)/2;
end