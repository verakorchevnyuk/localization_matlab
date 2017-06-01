%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Generate signals                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Mics

mics = getCirclePositions(8, 0.1);

%% Signal

fs = 48e3;

% signal = 2*rand(2^20, 1) - 1; % Noise
% signal = audioread('vowel.m4a'); % Vowels
% signal = audioread('fricatives.m4a'); % Fricative
% signal = audioread('silence.m4a'); % Silence
% signal = audioread('plosives.m4a'); % Plosive 
% signal = audioread('sibilant.m4a'); % Sibilant
 signal = audioread('nasals.m4a'); % Nasals

%% Amount of corruption
% TODO

%% Window size

% Window size
window_size = 0.5 * fs;

% Working signal
b = randi(length(full_signal)-window_size, 1);
signal = full_signal (b:b+window_size-1);

%% Angles

step = 24;
dist = 3;
for angle = 0:step:360
    sound_source = calcPos( angle , dist );
    delays = simDelays(sound_source, mics);
    delays = removeSmallestDelay(delays);
    % Create delayed signals
    delayed_signals = delayedSignals(signal, delays, fs);
    % Write the audiofile
    str = sprintf ('nasals_%d_degrees.wav', angle);
    audiowrite(str, delayed_signals', fs);
end
    