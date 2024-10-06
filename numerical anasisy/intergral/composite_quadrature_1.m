function [y,error] = composite_quadrature_1(interval, f, dot_num)
%根据composite_quadrature_2对于无定义的点取极限
a = interval(1);
b = interval(2);

% 直接使用 linspace 生成等距节点
x = linspace(a, b, dot_num);
h = (b - a) / (dot_num - 1);

% 初始化积分值
y = 0;

% 复合梯形求积公式
for j = 1:dot_num-1
    h_integral = h/2 * (f(x(j)) + f(x(j+1)));
    y = y + h_integral;
end


% 绘制原函数图像和离散点的折线图
test_x = linspace(a, b, 101);
figure(1)
plot(test_x, f(test_x), 'LineWidth', 3); % 原函数图像
hold on
%%
% 添加阴影区域
fill([x, fliplr(x)], [f(x), zeros(1, dot_num)], 'r', 'FaceAlpha', 0.3); % 填充曲线下方区域，FaceAlpha控制透明度
% 叠加离散点的折线
plot(x, f(x), 'r-*', 'LineWidth', 1, 'MarkerSize', 8);
xlabel('x');
ylabel('f(x)');
title('复合梯形求积插值');
grid on;
hold off
error=abs(integral(f,a,b)-y);
end
