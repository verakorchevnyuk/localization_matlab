function [ source_found ] = findMaximum( energy_map, room_width, room_length, cell_size)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here

mean_energy_map = sum(energy_map,3)/size(energy_map,3);
[max_val, first_max_idx] = max(mean_energy_map(:));
k = find(mean_energy_map == max_val);
len_matrix = length(mean_energy_map(:));
ones_matrix = mean_energy_map == max_val;
ones_left_half = sum(ones_matrix(1:floor(len_matrix/2)));
ones_right_half = sum(ones_matrix(ceil(len_matrix/2):end));
if ones_left_half < ones_right_half
    idx_maximum = max(k);
elseif ones_left_half < ones_right_half
    idx_maximum = min (k);
else 
    idx_maximum = first_max_idx;
end
[w_found, l_found] = ind2sub(size(mean_energy_map),idx_maximum);
source_found = convertToRoomCoordinates([w_found, l_found],room_width, room_length, cell_size);

end