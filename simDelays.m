function [ arrival_times ] = simDelays( source_position, mics_position)
%SIMDELAYS Function that simulates the capturing sound in the correspondent
%microphone. For simulation purpose only. To be replaced by the real system.
%   The function receives the signal to be used, the positions of the sound
%   source, and the positions of the microphones, all in cartesian
%   coordinates, in meter. Calculates the distance between each microphone
%   to the sound source and converts it into time, considering for this the
%   velocity of sound as 343.21 m/s. The microphone which is closer to the
%   sound source, will preserve the original signal, while all the other
%   will appear delayed

num_mics = size(mics_position,1);
% delayed_signals = zeros(num_mics,length(signal));
c = 343.21; % Sound velocity in 20C air [ m/ s ]
distances = zeros(num_mics, 1);
arrival_times = distances;

for k = 1:num_mics
    distances(k) = norm(source_position - mics_position(k,:));
    arrival_times(k) = distances(k) / c;
end

% [~, idx] = min(distances);
% ref_mic = idx;
% 
% delay = arrival_times - arrival_times(ref_mic); % Reference microphone
% 
% delayed_signals(ref_mic,:) = signal;
% 
% k = 1:num_mics;
% k(ref_mic) = [];
% 
% for i = 1:length(k)
%     delayed_signals(k(i),:) = addDelayToSignal(signal', delay(k(i)), fs);
% end

%plot((1:length(signal))/fs,delayed_signals(1,:),'k');

end