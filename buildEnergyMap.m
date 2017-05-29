function [ energy_map ] = buildEnergyMap( delayed_signals, GRID, xc, num_pairs )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

len_sig = size(delayed_signals,2);
energy_map = zeros(size(GRID));
for x = 1:size(GRID,1)
    for y = 1:size(GRID,2)
        for k = 1:num_pairs
            energy_map(x,y,k) = xc(GRID(x,y,k)+len_sig, k);
        end
    end
end

end

