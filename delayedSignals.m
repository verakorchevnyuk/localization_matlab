function [ delayed_signals ] = delayedSignals( signal, delays, fs )
%UNTITLED19 Summary of this function goes here
%   Detailed explanation goes here

num_signals = length(delays);
[~, idx] = min(delays);
ref_mic = idx;
delayed_signals = zeros(num_signals, length(signal));
delayed_signals(ref_mic,:) = signal;

k = 1:num_signals;
k(ref_mic) = [];

for i = 1:length(k)
    delayed_signals(k(i),:) = addDelayToSignal(signal', delays(k(i)), fs);
end

% plot(delayed_signals')

end

