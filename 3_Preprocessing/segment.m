%clear all;
data = load('D:\lll\14_EEG_all\6_1.mat');
newpath = 'D:\lll\15_fenduan\6_1\'
data1 = data.EEG;
data2 = data1.data;
%多少段
for i=1:33
    name=['m',num2str(i,'%d')]; %可根据实际情况使用%02d 等格式符
    eval([name,'=data2(:,:,i)']);
    filename = ['m' num2str(i) '.mat'];
    save_path = [newpath,filename];
    file = ['m' num2str(i) ''];
    save(save_path,file);

end