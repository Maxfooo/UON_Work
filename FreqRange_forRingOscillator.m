% Written by Max Ruiz
% Schmitt Trigger: http://www.digikey.com/product-detail/en/SN74AHC14NSR/296-26395-1-ND/2254997
% Thermistor: http://www.mouser.com/ProductDetail/Vishay-Dale/TFPTL15L5001FL2B/?qs=sGAEpiMZZMvQRzVR7o8pIcPrhnnD25wXXQwVAD%2f0sMs%3d
j = 1;
for i = 0.702:0.004:1.595
a(j) = i;
j = j + 1;
end

tempRange = a(36:76);

therm = 5000;

cap = 1e-5;

tau = tempRange*therm*cap;

Vth = 3.3;
Vtl = 2.7;
Vmax = 5;

ro = RingOscillator(Vth, Vtl, Vmax);

for i = 1:length(tau)
periods(i) = ro.findPeriod(tau(i));
end

freqs = 1./periods;

plot(freqs)
xlabel('Normalized Thermistor Value');
ylabel('Frequency');
title('Frequency versus Normalized Thermistor Value');
