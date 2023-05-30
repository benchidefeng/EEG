%input: data, previous_row_number, id(the number of the event), event_type
%output: time: data(n, 1:6); current_row
%event_type: 1 for cross, 2 for non-cross


function [info, current_row] = pedestrian_main(data, previous_row, id, event_type)
if event_type == 1
    [info, current_row] = pedestrian_cross(data, previous_row, id);
elseif event_type == 2
    [info, current_row] = pedestrian_noncross(data, previous_row, id);
else
    warning('pedestrian type incorrect');
end
    


function [info, current_row] = pedestrian_cross(data, previous_row, id)
y_vel_column = (id - 1) * 8 + 13;
y_pos_column = (id - 1) * 8 + 11;
row = previous_row + 1;
while 1
    y_pos = data(row, y_pos_column);
    %具体判断标准可以加上阈值
    if data(row, y_vel_column) ~= 0 && y_pos >= 68
        type = 1;
        break
    elseif data(row, y_vel_column) ~= 0 && y_pos < 50
        type = 2;
        break
    else
        row = row + 1;
    end
end
time = data(row, 1:6);
info = [time, type];
current_row = row;

%行人不过马路，左侧120米，右侧55米
function [info, current_row] = pedestrian_noncross(data, previous_row, id)
x_pos_column = (id - 1) * 8 + 10;
y_pos_column = (id - 1) * 8 + 11;
ego_x_pos_column = 218;
row = previous_row;
while 1
    ego_x_pos = data(row, ego_x_pos_column);
    y_pos = data(row, y_pos_column);
    x_pos = data(row, x_pos_column);
    distance = x_pos - ego_x_pos;
    if (y_pos >= 68) && (distance < 120)
        type = 3;
        break
    elseif (y_pos < 50) && (distance < 55)
        type = 4;
        break
    else
        row = row + 1;
    end
end
time = data(row, 1:6);
info = [time, type];
current_row = row;