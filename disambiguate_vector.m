function [ vector ] = disambiguate_vector( vector, delays, mics )
%Function that receives a vector and solves the ambiguity created by the
%solving of the optimization problem. It resorts to the delays vector,
%divides the space in areas (one per mic) and returns the right sound
%source direction vector

% num_areas = length(delays);
% half_step = 2*pi/num_areas/2;
% for i = 1:num_areas
%     area(i).mic = mics(i,:);
%     if area(i).mic(1)/norm(area(i).mic) < 0
%         area(i).mic_angle = pi - asin(area(i).mic(2)/norm(area(i).mic));
%     else
%         area(i).mic_angle = asin(area(i).mic(2)/norm(area(i).mic));
%     end
%     area(i).initial_angle = area(i).mic_angle + half_step;
%     area(i).final_angle = area(i).mic_angle - half_step;
% end

num_mics = size(mics, 1);
dist = zeros(length(delays),1);
for i = 1:length(delays)
    dist(i) = norm(vector' - mics(i,:));
end

[~, closest_mic] = min (dist);

if closest_mic < num_mics/2
    opposite_mic = closest_mic + num_mics/2;
else
    opposite_mic = closest_mic - num_mics/2;
end

if delays(closest_mic) < delays(opposite_mic)
    return
else
    vector = -vector;
end


end

