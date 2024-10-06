tic
deepth_para=zeros(252,202);
deepth_para=xlsread('附件.xlsx','C3:GU253');
x_label=xlsread('附件.xlsx','B3:B253');
y_label=x_label';
toc
%%
x=0:pi/10:pi;y=sin(x);
fid=fopen('sinx.txt','w');
for i=1:11
    fprintf(fid,'%5.3f %8.4f\n',x(i),y(i));
end
fclose(fid); type sinx.txt