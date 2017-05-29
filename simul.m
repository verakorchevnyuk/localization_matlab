function [ delay ] = simul( source_position, mics_position )
%SIMULATION 
% Receives: the position of the acoustic sound source
%and the position of the microphones and 
% Returns: the time delays between pairs of microphones (pairs 1-5, 2-6, 
% 3-7, 4-8)
%To be substituted by the real microphones

% Distance vectors from the source to every microphone
N = length(mics_position);
distance_vectors = zeros (2, N);
for i = 1:N
    distance_vectors(1,i) = norm(source_position(1) - mics_position(1,i));
    distance_vectors(2,i) = norm(source_position(2) - mics_position(2,i));
end

distance = zeros(1,N);
for i = 1:N
    distance (i) = norm(distance_vectors(:,i));
end

% Times of arrival
c = 343.21; % Sound velocity in 20C air [ m/ s ]

arrival_time = distance / c;

% Delay calculation
delay = zeros(N/2, 1);
for i = 1:N/2
    delay(i) = arrival_time(i) - arrival_time(i+4);
end

end

