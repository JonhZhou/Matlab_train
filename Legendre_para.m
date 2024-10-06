function [para]=Legendre_para(n)
%%
part_1 = zeros(1, n+1);
part_2 = zeros(1, n+1);
para = zeros(n+1, n+1);
temp = zeros(1, n+1);

para(1, 1) = 1;  % 初始条件
para(2, 2) = 1;  % 初始条件

for i = 2:n
    part_1 = para(i, :);            % 获取 para(i,:) 行
    temp(2:end) = part_1(1:end-1);  % 将 part_1 向右移动一位
    part_2 = para(i - 1, :);        % 获取 para(i-1,:) 行
    % 递归公式更新 para(i+1,:)
    para(i + 1, :) = ((2 * i - 1) * temp - (i - 1) * part_2) / i;
end
disp(para);%在屏幕展示参数