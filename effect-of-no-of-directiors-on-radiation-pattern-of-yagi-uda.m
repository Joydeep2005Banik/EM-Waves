% Title: Effect of No of Directors on Radiation Pattern of Yagi Uda Antenna.
% Objective: To Study and analyze the effect of varying the number of directors on radiation pattern of Yagi-Uda Antenna.

% Code:
f = 2e9;
c = 3e8;
lambda = c/f;
coef = 3.5;
D = lambda * coef;
P = 180 * 0;
P_rad = deg2rad(P);

theta = linspace(0, 2*pi, 1000);
N_D_list = [1 3 5];

figure('Position', [100 100 1200 420]);

for k = 1: numel(N_D_list)
    Nd = N_D_list(k);

    % The equation:
    % U = [cos(90 * cos(theta)/sin(theta))] * [ (1/Nd * sin(Nd * P * cos(theta)) / sin(P * cos(theta)) ) ]

    term1 = cos((pi/2) * cos(theta)) ./ sin(theta);
    term1(~isfinite(term1)) = 0;
    
    num = (1/Nd) * sin(Nd * P_rad .* cos(theta));
    den = sin(P_rad .* cos(theta));
    
    af = zeros(size(num));
    valid = abs(den) > 1e-10;
    af(valid) = num(valid) ./ den(valid);
    af(~valid) = 1/Nd;

    U = abs(term1 .* abs(af));
    U = U ./ max(U + eps);

    subplot(1, 3, k);
    polarplot(theta, U, 'b-', 'LineWidth', 2);

    pan = gca;
    pan.ThetaZeroLocation = 'Right';
    pan.ThetaDir = 'CounterClockwise';
    pan.ThetaLim = [0 360];
    pan.RLim = [0 1];
    pan.GridColor = [1 0 0];
    pan.GridAlpha = 0.6;
    grid on;

    title(sprintf('%d Elements', Nd+2));
end