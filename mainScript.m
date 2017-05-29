%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Localization                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all

%% 0. Initialization

% Microphones
mics = getCirclePositions(8, 0.1);

% Sound source
sound_source = calcPos( 90, 1 );

% Signal and sampling frequency
    % [full_signal, fs] = audioread('female_2.wav');
full_signal = 2*rand(2^20, 1) - 1;
fs = 48000;

% Window size
window_size = 0.5 * fs;

% Working signal
b = randi(length(full_signal)-window_size, 1);
signal = full_signal (b:b+window_size-1);

%% 1. Simulation of delays

% Delays
delays = simDelays(sound_source, mics);
delays = removeSmallestDelay(delays);
% [delays,~] = changeReference(delays, fs);

%% 2. Create delayed signals

% Create delayed signals
delayed_signals = delayedSignals(signal, delays, fs);

%% 3. Calculate delays

% Reference microphone
ref_sig = 1;

% GCC
D = delayCalculation( delayed_signals, fs, ref_sig );

% Change reference for centroid
D = D - mean(D);


%% 4. Geometric approach

% Obtain source position vector
v_geometric = geometricApproach( D, mics, fs);

% Representation
rw = 4; % room width
rl = 5; % room length
figure
subplot(2,2,1)
ss = sound_source/norm(sound_source);
plotv(ss');
title('Real source')
hold on
% v_geometric = geometricApproach(delayed_signals, mics, fs);
%v_geometric = disambiguate_vector(v_geometric, delays, mics);
plotv(v_geometric);
axis ([-rw/2 rw/2 -rl/2 rl/2])
title('Geometric solution')
legend('real', 'geo solution')

%% SRP approach

% Room dimensions
room_width = rw;
room_length = rl;

% Grid size
cell_size = 0.05;

subplot(2,2,2)
plot(signal)
subplot(2,2,3)
v_srp_single = srpApproach(delayed_signals, mics, fs, cell_size, room_width, room_length);
title('SRP single source map');
subplot(2,2,4)
plotv(v_srp_single')
axis ([-rw/2 rw/2 -rl/2 rl/2])
title('SRP single source, chosen vector')

%% Several sound sources

% Two signals
b1 = randi(length(full_signal)-window_size, 1);
b2 = randi(length(full_signal)-window_size, 1);
sig1 = full_signal(b1:b1+window_size-1);
sig2 = full_signal(b2:b2+window_size-1);

% Two sound sources
sound_source1 = [1 1];
sound_source2 = [-1 -0.5];

delays1 = simDelays(sound_source1, mics);
delays2 = simDelays(sound_source2, mics);
delays1 = removeSmallestDelay(delays1);
delays2 = removeSmallestDelay(delays2);
delayed_signals1 = delayedSignals(sig1, delays1, fs);
delayed_signals2 = delayedSignals(sig2, delays2, fs);

delayed_signals3 = delayed_signals1+delayed_signals2;

figure
subplot(2,2,1)
plot(sig1)
title('Signal 1')
subplot(2,2,2)
plot(sig2)
title('Signal 2')
subplot(2,2,3)
v_srp_various = srpApproach(delayed_signals3, mics, fs, cell_size, room_width, room_length);
title('SRP double source map')
subplot(2,2,4)
plotv(v_srp_various')
axis ([-room_width/2 room_width/2 -room_length/2 room_length/2])
title('SRP double source, chosen vector')
