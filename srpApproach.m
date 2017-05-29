function [ source_found , energy_map] = srpApproach( delayed_signals, mics_position, fs, cell_size, room_width, room_length )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

% Pair mics
pairs = pairMicrophones( mics_position );
num_pairs = size(pairs, 1);

% Store theoretical TDOA indices grid
GRID = createGrid(room_width, room_length, cell_size, pairs, mics_position, fs);

% Compute and store correlation
xc = computeCorrelations(delayed_signals, pairs);

% Create map of energy
energy_map = buildEnergyMap(delayed_signals, GRID, xc, num_pairs);

% Find maximum
source_found = findMaximum(energy_map, room_width, room_length, cell_size);
source_found = source_found/norm(source_found);

% Plot energy map
imshow(sum(energy_map,3),[]);

end

