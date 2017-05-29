function [ FIG ] = plotVector( vector )
%UNTITLED21 Summary of this function goes here
%   Detailed explanation goes here

FIG = figure;
plotv(direction_vector)
set(gca, 'xlim', [-2 2])
set(gca, 'ylim', [-2 2])
% FIG = getframe(FIG);
% Fig = Fig.cdata;
close

end

