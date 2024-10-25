% This is a demo file to test Patlak Plot with a real TAC
%
% GBW, Oct 19, 2024
%

clear; clc
run('../setup.m');

%% load data
load('../data/demo_2tcm_realdata.mat');

tac = GM;
scant = [cumsum([0; dt(1:end-1)]), cumsum(dt)];
t = mean(scant,2);

%% fit the TAC using the Patlak plot

% start at t = 18 min;
tx = 20; % 20th frame

% Patlak plot
[Ki, b, out] = patlak_plot(Cp, tac, scant, tx);

%% display the fitting result
figure,
plot(out.xt, out.yt, 'r-.o', out.xt, out.yf, 'b-', 'LineWidth',2);
xlabel('Patlak x-axis');
ylabel('Patlak y-axis');
set(gca,'FontSize',14);
title('Patlak Plot')
legend('Noisy','Fitted','Location','Best')

% the slope and intercept
fprintf('Patlak slope: %4.3g\n', Ki);
fprintf('Patlak intercept: %4.3g\n', b);
