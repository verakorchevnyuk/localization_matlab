function [ FRAME ] = vectorFrame( vector )
%UNTITLED21 Summary of this function goes here
%   Detailed explanation goes here

Fig = figure;
plotv(vector)
set(gca, 'xlim', [-2 2])
set(gca, 'ylim', [-2 2])
FRAME = getframe(Fig);
% Fig = Fig.cdata;
close
end

