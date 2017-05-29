function [ delays ] = removeSmallestDelay( delays )
%UNTITLED19 Summary of this function goes here
%   Detailed explanation goes here

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

smallest_delay = min (delays);
delays = delays - smallest_delay;

end

