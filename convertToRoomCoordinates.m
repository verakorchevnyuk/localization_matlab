function [ new_coordinates ] = convertToRoomCoordinates( old_coordinates, room_width, room_length, cell_size )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

w = -room_width/2:cell_size:room_width/2;
l = -room_length/2:cell_size:room_length/2;
w = w * -1;

new_coordinates(2) = w(old_coordinates(1));
new_coordinates(1) = l(old_coordinates(2));

end

