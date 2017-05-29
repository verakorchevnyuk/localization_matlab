function [ GRID ] = createGrid( room_width, room_length, cell_size, pairs, mics_position, fs )
%CreateGrid Divides the room in cells and estimates the theoretical delay
%between pairs of microphones (in samples)
%   The dimensions of the room and the size of the cell are provided so the
%   program goes through all of them and stores the theoretical TDOA (in
%   samples) for each pair of microphones

w = -room_width/2:cell_size:room_width/2; % rows = yy
l = -room_length/2:cell_size:room_length/2; % columns = xx
w = w* -1;
num_pairs = size(pairs, 1);
GRID = zeros ( length(w), length(l), num_pairs );
t = zeros(1,2);
c = 343.21; % Sound velocity in 20C air [ m/ s ]

for i = 1:length(w) % each line
    for j = 1:length(l) % each column
        source_position = [l(j) w(i)];
        for k = 1:num_pairs
            t(1) = norm(source_position-mics_position(pairs(k,1),:))/c;
            t(2) = norm(source_position-mics_position(pairs(k,2),:))/c;
            D = t(1) - t(2);
            GRID(i,j,k) = round( D * fs );
        end
    end
end

end

