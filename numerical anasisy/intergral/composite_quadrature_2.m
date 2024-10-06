function [y,error] = composite_quadrature_2(interval, f, dot_num)
tic
a = interval(1); b = interval(2);
X = linspace(a, b, dot_num); h = (b - a) / (dot_num - 1);
y = 0; F = zeros(1, dot_num);
syms x  % 声明符号变量

for j = 1:dot_num-1
    % 处理 X(j) 处的函数值，考虑符号计算中的极限
    if isnan(f(X(j)))
        F(j) = limit(f, x, X(j));  % 如果是符号函数，求极限
    else
        F(j) = f(X(j));  % 正常数值计算
    end

    % 处理 X(j+1) 处的函数值
    if isnan(f(X(j+1)))
        F(j+1) = limit(f, x, X(j+1));  % 求极限
    else
        F(j+1) = f(X(j+1));  % 正常数值计算
    end

    % 计算区间中点及中点处的函数值
    mid_point = (X(j) + X(j+1)) / 2;
    if isnan(f(mid_point))
        f_mid = limit(f, x, mid_point);  % 如果中点处有奇异性，求极限
    else
        f_mid = f(mid_point);  % 正常计算
    end

    % 复合辛普森求积
    h_integral = h / 6 * (F(j) + 4 * f_mid + F(j+1));
    y = y + h_integral;  % 累加积分值
end
error=abs(y-integral(f,a,b));
% 绘制原函数图像和离散点的折线图
test_x = linspace(a, b, 1001);
test_y = zeros(size(test_x));  % 初始化函数值数组

for i = 1:length(test_x)
    if isnan(double(f(test_x(i))))
        test_y(i) = limit(f, x, test_x(i));  % 计算极限值
    else
        test_y(i) = f(test_x(i));  % 正常数值计算
    end
end

figure(1)
plot(test_x, test_y, 'LineWidth', 6); hold on;  % 绘制处理过的函数值
plot(X, F, 'r-*', 'LineWidth', 3, 'MarkerSize', 8);  % 红色折线图

% 为折线图下方添加阴影
fill([X, fliplr(X)], [F, fliplr(zeros(1, length(X)))], [0, 0.5, 0.5],'FaceAlpha',0.4);

xlabel('x'); ylabel('f(x)'); title('复合辛普森求积插值');
grid on; hold off;
toc
end
