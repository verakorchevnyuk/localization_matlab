function [ positions, angles ] = getCirclePositions( N, radius, start_angle )
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here

if nargin < 3
    start_angle = 0;
end

if nargin < 2
    radius = 1;
end

step = 2*pi/N;

angles = 0 : step : 2*pi-step;
angles = angles+start_angle;

positions = [cos(angles')*radius sin(angles')*radius];

% plot(m(:,1),m(:,2), '*')

end
