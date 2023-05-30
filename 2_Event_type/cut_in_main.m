%input: data, previous_row_number, id(the number of the event)
%output: time: data(n, 1:6); current_row
%event_type: 3 for cut in, 4 for no cut in

function [info, current_row] = cut_in_main(data, previous_row, id, event_type)
if event_type == 3
    [info, current_row] = cut_in(data, previous_row, id);
elseif event_type == 4
    [info, current_row] = no_cut_in(data, previous_row, id);
else
    warning('cut in type incorrect')
end

function [info, current_row] = cut_in(data, previous_row, id)
x_pos_column = (id - 1) * 8 + 10;
y_pos_column = (id - 1) * 8 + 11;
y_vel_column = (id - 1) * 8 + 13;
ego_x_pos_column = 218;
row = previous_row;
while 1
    x_pos = data(row, x_pos_column);
    y_pos = data(row, y_pos_column);
    y_vel = data(row, y_vel_column);
    ego_x_pos = data(row, ego_x_pos_column);
    if y_pos >= 56 && y_pos < 61 && y_vel <  -0.1
        distance = x_pos - ego_x_pos;
        if distance < 50
            type = 7;
        else 
            type = 9;
        end
        break
    elseif y_pos >= 50 && y_pos < 52 && y_vel > 0.1
        distance = x_pos - ego_x_pos;
        if distance < 50
            type = 8;
        else
            type = 10;
        end
        break
    else
        row = row + 1;
    end
end
time = data(row, 1:6);
info = [time, type];
current_row = row;

function [info, current_row] = no_cut_in(data, previous_row, id)
x_pos_column = (id - 1) * 8 + 10;
y_pos_column = (id - 1) * 8 + 11;
ego_x_pos_column = 218;
row = previous_row;
while 1
    ego_x_pos = data(row, ego_x_pos_column);
    y_pos = data(row, y_pos_column);
    x_pos = data(row, x_pos_column);
    distance = x_pos - ego_x_pos;
    if y_pos >= 56 && y_pos < 61 && distance < 80
        type = 5;
        break
    elseif y_pos < 52 && y_pos >= 50 && distance < 80
        type = 6;
        break
    else
        row = row + 1;
    end
end
time = data(row, 1:6);
info = [time, type];
current_row = row;