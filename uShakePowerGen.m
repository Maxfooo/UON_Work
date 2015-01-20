%uPowerGen3 - Looking at kinetic energy

% Magnets - 2
B = 0.1050*2; %Tesla
d = 0.63; %cm
r = d/2; %cm
h = 0.63*2; %cm
dens = 7; %g/cm^3
vol = pi*h*r^2; %cm^3
mass = dens*vol/1000; % g

w = 2*pi*linspace(0,150);
f = w/(2*pi);
amp = 0.002;
vel = amp*w/sqrt(2);

mechEff = 0.75;
elecEff = 0.30;
eff = mechEff*elecEff;

KE = 0.5*mass*(vel.^2);
EE = KE*eff;

plot(f, KE,'r', f, EE)
title('Vibrational Energy Given Frequency')
xlabel('Frequency (Hz)')
ylabel('J/s (W)')
legend('Kinetic', 'Electrical')
