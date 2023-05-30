%根据车辆的初始位置和结束位置判断大概分类
%0: non-event
%1: pedestrian cross
%2: pedestrian not cross
%3: cut_in
%4: no cut_in
%5: cut_out | AEB
function type = type_detection(data)
type = zeros(1, 25);
for i = 1:25
    column = (i - 1) * 8 + 11;
    initial_y_pos = data(100, column);
    final_y_pos = data(end-1000, column);
    if (initial_y_pos == 0 && final_y_pos == 0)
        type(i) = 0;
    elseif (initial_y_pos >= 68 && final_y_pos < 50) || (initial_y_pos < 50 && final_y_pos >= 68)
        type(i) = 1;
    elseif (initial_y_pos >= 68 && final_y_pos >= 68) || (initial_y_pos < 50 && final_y_pos < 50)
        type(i) = 2;
    elseif (initial_y_pos >= 50 && initial_y_pos < 52 && final_y_pos >= 56 && final_y_pos < 61) || (initial_y_pos >= 56 && initial_y_pos < 61 && final_y_pos >= 50 && final_y_pos < 52)
        type(i) = 3;
    elseif (initial_y_pos >= 50 && initial_y_pos < 52 && final_y_pos >= 50 && final_y_pos < 52) || (initial_y_pos >= 56 && initial_y_pos < 61 && final_y_pos >= 56 && final_y_pos < 61)
        type(i) = 4;
    elseif (initial_y_pos >= 52 && initial_y_pos < 56 && final_y_pos >= 50 && final_y_pos < 52) || (initial_y_pos >= 52 && initial_y_pos < 56 && final_y_pos >= 56 && final_y_pos < 61)
        type(i) = 5;
    else
        warning('event type not defined')
    end
end

