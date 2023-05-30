%input: data, previous_row_number, id(the number of the event)
%output: time: data(n, 1:6); current_row
function [info, current_row] = cutout_AEB_main(data, previous_row, id)
AEB_flag = 0;
x_pos_column = (id - 1) * 8 + 10;
y_vel_column = (id - 1) * 8 + 13;
x_acc_column = (id - 1) * 8 + 14;
ego_x_pos_column = 218;
row = previous_row;
while 1
    x_acc = data(row, x_acc_column);
    x_pos = data(row, x_pos_column);
    ego_x_pos = data(row, ego_x_pos_column);
    y_vel = data(row, y_vel_column);
    if x_acc < -2
        AEB_flag = 1;
        time = data(row, 1:6);
            if x_acc < -4
                type = 13;
                break
            else 
                type = 14;
                break
            end        
    end
    if abs(y_vel) > 0.5 && AEB_flag == 0
        distance = x_pos - ego_x_pos;

        time = data(row, 1:6);
        if distance < 30
            type = 11;
            break
        else
            type = 12;
            break
        end
%         else 
%             if distance < 18
%                 type = 19;
%                 break
%             else
%                 type = 20;
%                 break
%             end

    else
        row = row + 1;
    end
end

current_row = row;
info = [time, type];