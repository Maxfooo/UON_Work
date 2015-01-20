function [x,y,a,a2] = equidistantNodes(r, n, s)
%Inputs
%r = radius
%n = number of nodes
%s = shift amount
%Outputs
%x = horizontal distance
%y = verticle distance
%a = angle
%a2 = angle from horizontal axis

delAngle = (2*pi)/n;
dAngDeg = delAngle*180/pi
angle = delAngle - s; %% subbing shift amount

for i = 1:n
    x(i) = r*(cos(angle));
    y(i) = r*(sin(angle));
    angle = angle + delAngle;
    a(i) = angle;
end
a = a*180/pi;
a2 = 90-a;
end
