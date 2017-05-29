%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Localization                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Simulation

% Microphones and sound source
mics = getCirclePositions(8, 0.1);
sound_source = calcPos(3, 168);

% Full signal and fs
%[full_signal, fs] = audioread('female_2.wav');
full_signal = 2*rand(2^20, 1) - 1; fs = 48e3; % Noise

% Delays
delays = simDelays(sound_source, mics);
delays = removeSmallestDelay(delays);
[delays,~] = changeReference(delays, fs);

% Signal
window_size = 0.5 * fs;
b = randi(length(full_signal)-window_size, 1);
signal = full_signal (b:b+window_size-1);

% Create delayed signals
delayed_signals = delayedSignals(signal, delays, fs);

%% Geometric approach

rw = 4;
rl = 5;

figure
subplot(2,2,1)
ss = sound_source/norm(sound_source);
plotv(ss');
title('Real source')
hold on
v_geometric = geometricApproach(delayed_signals, mics, fs);
axis ([-rw/2 rw/2 -rl/2 rl/2])
title('Geometric solution')
legend('real', 'geo solution')
