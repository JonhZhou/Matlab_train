%%
for i=1:10
    x=linspace(0,10,101);
    plot(x,sin(x+i));
    print(gcf,'-deps',strcat('plot',num2str(i),'.ps'))
end
%%
for i=1:10
    if rem(i,2)==0
        X=['number',num2str(i),' is even'];
        disp(X)
    else
        X=[num2str(i),' is odd'];
        disp(X)
    end
end
%%
n=1;
while prod(1:n)<30
    n=n+1;
end
%%
i=1;sum=0;
while i<1000
    i=i+1;
    sum=sum+i;
end
%%
for n=1:2:10
    a(n)=2^n;
end
%%
tic
for ii=1:10000
    for jj=1:10000
        A(ii,jj)=ii+jj;
    end
end
toc
%%
tic
A=zeros(10000,10000);
for ii=1:10000
    for jj=1:10000
        A(ii,jj)=ii+jj;
    end
end
toc
%%
x=2;k=0;error=inf;
error_threshold=1e-32;

while error>error_threshold
    if k>100
        break
    end
    x=x-sin(x)/cos(x);
    error=abs(x-pi)
    k=k+1;
end

%%
part_1 = zeros(1, 7);
part_2 = zeros(1, 7);
para = zeros(7, 7);
temp = zeros(1, 7);

para(1, 1) = 1;  % 初始条件
para(2, 2) = 1;  % 初始条件

for i = 2:6
    part_1 = para(i, :);            % 获取 para(i,:) 行
    temp(2:end) = part_1(1:end-1);  % 将 part_1 向右移动一位
    part_2 = para(i - 1, :);        % 获取 para(i-1,:) 行
    % 递归公式更新 para(i+1,:)
    para(i + 1, :) = ((2 * i - 1) * temp - (i - 1) * part_2) / i;
end
disp(para);


