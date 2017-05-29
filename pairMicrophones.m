function [ pairs ] = pairMicrophones( mics_position )
%PairMicrophones Algorithm that pairs the furthest microphones
%   Computes the number of microphone pairs and for each microphone
%   searches for the furthest away. This is done sequencially, not
%   optimized for all possible combinations.

num_mics = size(mics_position,1);
num_pairs = floor(num_mics/2);
dist_mtx = zeros (num_pairs, num_mics);
taken = zeros (num_mics,1);
pairs = zeros (num_pairs, 2);

for i = 1:num_pairs
    taken (i) = 1;
    for j = 1:num_mics
        dist_mtx(i,j) = norm(mics_position(i,:)-mics_position(j,:));
    end
    [~, I] = max(dist_mtx(i,:));
    while ismember(0,taken)
        if taken(I) == 0
            pairs(i,1) = i;
            pairs(i,2) = I;
            taken(I) = 1;
            break;
        else
            dist_mtx(i,I)=0;
            [~, I] = max(dist_mtx(i,:));
        end
    end
end

pairs = pairs(all(pairs,2),:);

end

