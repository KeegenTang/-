clear;
tic
location='Beihai';   
latitude=21.483;
File_name='.\Beihai\h636a75.dat';
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
data_aver=mean(data);
[NAME,FREQ,TIDECON,XOUT]=t_tide(data,'interval',1,'latitude',latitude,'start time',[1975,01,01,00],'rayleigh',['M2';'S2';'O1';'K1']);
time=zeros(1,numel(data)+24);
for i=1:numel(data)+24
    time(i)=datenum(1976,01,01)+(i-1)/24.0;
end
ypre=t_predic(time,NAME,FREQ,TIDECON,latitude);
toc