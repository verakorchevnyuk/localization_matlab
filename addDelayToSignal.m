function [ delayed_signal ] = addDelayToSignal( signal, delay, fs)
%ADD DELAY Shifts the input signal in time adding zeros to it

c = round (delay*1e100); % guarantee integer, avoid warning

if c >= 0
    delayed_signal = [zeros(1,round(delay*fs)) signal(1:length(signal)-round(delay*fs))];
elseif c < 0
    delayed_signal = [signal(round(-delay*fs):end) zeros(1,round(length(signal))-length(signal(round(-delay*fs):end)))];
end
end