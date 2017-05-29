function [ xc ] = computeCorrelations( delayed_signals, pairs )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

num_pairs = size(pairs,1);
xc = zeros(length(delayed_signals(1,:))*2-1,num_pairs);

for i = 1:num_pairs
    [xc(:,i), ~] = xcorr(delayed_signals(pairs(i,1),:), delayed_signals(pairs(i,2),:));
end

end

