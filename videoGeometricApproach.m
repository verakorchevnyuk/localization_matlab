function [F] = videoGeometricApproach( sound_source_positions, frame_rate, mics_position, fs, signal )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

num_ss_positions = size(sound_source_positions,1);

% Convert figures to frame
for k = 1:num_ss_positions
    delays = simDelays(sound_source_positions(k,:), mics_position);
    delays = removeSmallestDelay(delays);
    delayed_signals = delayedSignals(signal, delays, fs);
    v = geometricApproach(delayed_signals, mics_position, fs);
    F(k) = vectorFrame(v);
end

% Play movie
figure
movie (F,1:num_ss_positions,frame_rate)

end

