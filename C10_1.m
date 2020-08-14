nSim = 1000;
dT = 0.1;
d = RHSOcillator;
d.a = 0.0;
d.omega = 0.2;
zeta = [0 0.2 0.7071 1];

xPlot = zeros(length(zeta), nSim);
s = cell(1,4);

for j = 1:length(zeta)
    d.zeta = zeta(j);
    x = [0;1];
    s{j} = sprintf('\\zeta = %6.4f',zeta(j));
    for k = 1:nSim
        xPlot(j,k) = x(1);
        x = RungeKutta(@RHSOscillator, 0, x, dT, d);
    end
end

[t, tL] = TimeLabel(dT*(0:(nSim-1)));
PlotSet(t, xPlot, 'x_label', tL, 'y_label', 'r', 'figure title', 'Damping Ratios', 'legend', s, 'plot_set', {1:4});
