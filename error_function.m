%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Error function                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Mics

mics = getCirclePositions(8, 0.1);

%% Signal

fs = 48e3;

signal = 2*rand(2^20, 1) - 1; % Noise
% signal = audioread('vowel.m4a'); % Vowels
% signal = audioread('fricatives.m4a'); % Fricative
% signal = audioread('silence.m4a'); % Silence
% signal = audioread('plosives.m4a'); % Plosive
% signal = audioread('sibilant.m4a'); % Sibilant
% signal = audioread('nasals.m4a'); % Nasals

%% Amount of corruption
% TODO

%% Window size

% Window size
window_size = 0.5 * fs;

% Working signal
b = randi(length(signal)-window_size, 1);
signal = signal (b:b+window_size-1);

%% Calculate error

dist = 0.1:0.1:.5; % every 10 cm
angle = 0:1:360; % every degree
z = zeros(length(dist), length(angle));
% z = zeros(size(w));

for i = 1:length(dist)
    for j = 1:length(angle)
        
        v_real = calcPos( angle(j) , dist(i) );
        
        delays = simDelays(v_real, mics);
        delays = removeSmallestDelay(delays);
%         delayed_signals = delayedSignals(signal, delays, fs);
%         D = delayCalculation( delayed_signals, fs, 1 );
%         D = delays;
        D = round(delays * fs)      / fs;
        D = D - mean(D);
        
        v_result = geometricApproach( D, mics, fs);
        
        % Angle error (absolute)
        cos_angle = dot(v_real,v_result)/(norm(v_real)*norm(v_result));
        e_Va = acosd(cos_angle); % degrees
        z(i,j) = e_Va;
    end
end

% Eliminate rounding errors
%w = real(w);
z = real(z);

%% Plot

% Plot absolute error
figure(1)
surf(angle,dist,z)
title ('Surf absolute error (degrees)')
ylabel ('source distance in meters')
xlabel ('alpha variation in degrees')
