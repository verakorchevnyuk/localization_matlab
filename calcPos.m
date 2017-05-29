function [ pos ] = calcPos( angle, dist )
% Converts polar coordinates into cartesian

pos = dist * [ cos( angle * pi / 180)  sin( angle * pi /180 )];

end

