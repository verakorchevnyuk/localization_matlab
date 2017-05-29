function [ new_delays, new_idx ] = changeReference( old_delays, fs )
%changeReference Change the reference for the calculated delays. Make it
%the centroid of the microphones
%   The geometric center is the centroid of the microphones' configuration.
%   The delay to each of the microphones is computed in relation to it.

ref_delay = mean(old_delays); %far field approximation

new_delays = old_delays - ref_delay;

new_idx = round(new_delays * fs);

end

