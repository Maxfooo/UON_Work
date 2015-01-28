Vdd  5;
batAmpHr = 0.250; % amp*hr
onTime = 6; % hours

cktCurrent = 0.015;
cktVoltage = vdd;

LEDcurrent = 0.2;
onRatio = 1/12; % 5sec/min
LEDvoltage = 3;


LEDcurDraw = onRatio*LEDcurrent/onTime; % amp/hr

cktCurDraw = cktCurrent/onTime;

batCurDraw = batAmpHr/onTime; % amp/hr

