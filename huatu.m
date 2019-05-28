File_name='.\Beihai\h636a76.dat';
fileID=fopen(File_name);
C = textscan(fileID,'%s %s %s %f %f %f %f %f %f %f %f %f %f %f %f','headerlines',1);
fclose(fileID);
data=zeros(size(C{1},1),12);   
for m=1:12
    data(:,m)=C{1,m+3};
end
data=data';
data=reshape(data,[1,numel(data)]);
data(data==9999)=NaN;
figure;
close all;
plot(data);
hold on
plot(ypre+data_aver);
hold off
xlim([1,8784]);
ylim([0,5500]);
legend({'实测','预测'},'location','NorthEast');
title('实测与预报全年对比图','fontSize',12,'fontweight','bold');
xlabel('小 时/h','fontweight','bold');   ylabel('潮 高/mm','fontweight','bold');
%%
figure;
close all;
plot(data(1:24*31));
hold on
plot(ypre(1:24*31)+data_aver);
hold off
xlim([1,24*31]);
legend({'实测','预测'},'location','NorthEast');
title('实测与预报一个月对比图','fontSize',12,'fontweight','bold');
xlabel('小 时/h','fontweight','bold');   ylabel('潮 高/mm','fontweight','bold');
