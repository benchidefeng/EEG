clc;clear;

%% 导入数据
% 1000 Hz 记录了 500 ms
load('D:\fjw\17_label\all_xy.mat');

% 采样率 1000 Hz
srate = 1000;
[frames, channels, epochs] = size(x);

X_features = [];
for i = 1:epochs
    % 取出数据
    eeg_data = squeeze(x(:, :, i));
    feature = ExtractPowerSpectralFeature(eeg_data, srate);
    X_features = [X_features; feature];
end
% 原始的 y_train 是行向量，展开成列向量
label = y(:);

% 提取CSP特征
% % es = load('D:\fjw\18_xy\all.mat');
% es = load('D:\liuchangjie1130\17_label\all_xy.mat');
% classLabels = unique(es.y);
% CSPMatrix = learnCSP(es,classLabels);
% nbFilterPairs = 20;
% X_features2 = extractCSP(es, CSPMatrix, nbFilterPairs);

% 提取DWT特征
% X_features3 = [];
% for i = 1:epochs
%     % 取出数据
%     eeg_data = squeeze(x(:, :, i));
%     feature = extractDWT(eeg_data, srate);
%     X_features3 = [X_features3; feature];
% end
% X_features3 = extractDWT(es,0,3,1,3)
% X=extractPSD(x_train,startS,endS,wStep,wRange);
% X=extractDWT(x_train,startS,endS,wStep,wRange);


X_features_normalized = zscore(X_features);
ind = round(i*0.8);


traindata = X_features(1:ind,:);
trainlabel = label(1:ind,:);
testdata = X_features(ind+1:end,:);
testlabel = label(ind+1:end,:);

% model = fitcsvm(traindata, trainlabel,'Standardize',true,'KernelFunction','RBF',...
%     'KernelScale','auto');


xlswrite('D:\fjw\18_xy\data.xlsx',X_features_normalized);
xlswrite('D:\fjw\18_xy\labels.xlsx',y);