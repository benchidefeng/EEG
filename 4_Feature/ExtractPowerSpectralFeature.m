% 提取 PSD 特征
function [power_features] = ExtractPowerSpectralFeature(eeg_data, srate)
    % 从 EEG 信号中提取功率谱特征
    %   Parameters:
    %       eeg_data:   [channels, frames] 的 EEG 信号数据
    %       srate:      int, 采样率
    %   Returns:
    %       eeg_segments:   [1, n_features] vector

    % 计算各个节律频带的信号功率
    [pxx, f] = pwelch(eeg_data, [], [], [], srate);
    power_delta = bandpower(pxx, f, [0.5, 4], 'psd');
    power_theta = bandpower(pxx, f, [4, 8], 'psd');
    power_alpha = bandpower(pxx, f, [8, 14], 'psd');
    power_beta = bandpower(pxx, f, [14, 30], 'psd');

    % 求 pxx 在通道维度上的平均值
    mean_pxx = mean(pxx, 2);
    % 简单地堆叠起来构成特征（可以用更高级地方法，比如考虑通道之间的相关性的方法构成特征向量）
    power_features = [
                    power_delta, power_theta, ...
                    power_alpha, power_beta, ...
                    mean_pxx(1:12)';
                ];

end