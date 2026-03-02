

% 3D radiation pattern of dipole antenna

theta = 0:0.1:2*pi;
phi   = 0:0.1:2*pi;

kl = 1/2;
I0 = 1;            % current amplitude
eta = 120*pi;      % intrinsic impedance

Urad = (eta*(I0^2) .* ...
       ((cos(kl*cos(theta - (pi/2))/2) - cos(kl/2)) ...
       ./ sin(theta - (pi/2))).^2) ...
       /(8*pi^2);

UdB = 10*log10(Urad);

% Normalize to make values positive
U = UdB - min(UdB);

% Expand theta, phi, and U for 3D plotting
for n = 1:length(phi)
    theta(n,:) = theta(1,:);
end

phi = phi';   % transpose
for m = 1:length(phi)
    phi(:,m) = phi(:,1);
end

for k = 1:length(U)
    U(k,:) = U(1,:);
end

[x, y, z] = sph2cart(phi, theta, U);

% ---- PLOT (matches reference image) ----
surf(x, y, z, 'EdgeColor', 'k', 'FaceColor', 'interp')
grid on
colormap jet
colorbar

xlabel('X');
ylabel('Y');
zlabel('Z');
title('3D Radiation Pattern of Dipole Antenna')
