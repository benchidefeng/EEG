%input: 测试信息，用于找到相关文件，场景事件顺序
%场景事件顺序 n x 2 table, No.|Event Type
%output a n x 3 table, No.|Time|Event Type
%function: 遍历整个.mat文件找到场景事件事件和类型，并加入蜂鸣器声音

function y = event_detector(data)
y = [];
type = type_detector(data);
previous_row = 1;
for i = 1:25
    if type(i) == 1 || type(i) == 2
        [info, previous_row] = pedestrian_main(data, previous_row, i, type(i));
    elseif type(i) == 3 || type(i) == 4
        [info, previous_row] = cut_in_main(data, previous_row, i, type(i));
    elseif type(i) == 5
        [info, previous_row] = cutout_AEB_main(data, previous_row, i);
    else
        i
        warning('invalid event type');
    end
    y = [y; info];
end