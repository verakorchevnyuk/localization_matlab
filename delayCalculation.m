function [ delays, max_idx ] = delayCalculation( signals, fs, ref_sig )
%DELAY CALCULATION Function that aplies the cross correlation between two
%signals to understand the delays between these
% All the signals in SIGNALS input matrix are provided as line vectors

num_signals = size(signals,1);

delays = zeros(num_signals,1);
max_idx = zeros(num_signals,1);

delays(ref_sig) = 0;
max_idx(ref_sig) = 0;

k = 1:num_signals;
k(ref_sig) = [];

% len_sig = length(signals(ref_sig,:));

for i = k
%     % [xc, lags] = xcorr(signals(ref_sig,:), signals(i,:));
% %     [xc, lags] = xcorr(signals(i,:), signals(ref_sig,:));
%     spec1 = fft(signals(i,:));
%     spec2 = fft(signals(ref_sig,:));
%     spec3 = spec1.*conj(spec2)./(abs(spec1).*abs(spec2));
%     xc = real(ifft(spec3));
%     [~, I] = max(abs(xc));
% %     delays(i) = lags(I)/fs;
%     delays(i) = I/fs;
% %     max_idx(i) = I-len_sig;
%     max_idx(i) = I-1;    
    
    % [xc, lags] = xcorr(signals(ref_sig,:), signals(i,:));
    [xc, lags] = xcorr(signals(i,:), signals(ref_sig,:));
    [~, I] = max(abs(xc));
    delays(i) = lags(I)/fs;
    max_idx(i) = I-length(signals(1,:));
end

end
