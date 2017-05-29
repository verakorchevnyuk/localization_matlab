function [ direction_vector ] = geometricApproach( delays, mics_position, fs )
%GeometricApproach Locate the acoustic sound source by means of an
%optimization problem resolution (LSquares)
%   Assuming far-field approximation, we get that the projection of the
%   microphones' positions (P) on the direction vector (sound source -
%   centoroid of the microphones) (v) is the same as the TDOA between the
%   centroid TOF and each microphone TOF (D). Hence, Pv = D and the
%   optimization problem is min ||Pv - D||, where v is the optimization
%   variable

P = mics_position;
D = delays;

v = P\-D
% --improvement: provide the pinv outside the loop and only multiply by
% delays, ie v = Pinv*D

direction_vector = v/norm(v);

%plotv(direction_vector);

end

