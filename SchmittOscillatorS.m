classdef (ConstructOnLoad = true) SchmittOscillatorS
	% More static version of the schmitt oscillator class previously made
	properties
		vtl;
		vth;
		vdd;
	end
	methods (Access = public)
		function obj = SchmittOscillatorS(Vth, Vtl, Vdd)
			obj.vtl = Vtl;
			obj.vth = Vth;
			obj.vdd = Vdd;
        end
        function T = findPeriod(obj, tau)
            t1 = obj.riseTime(tau);
			t2 = obj.fallTime(tau);
			T = t1+t2;
        end
		function F = findFrequency(obj, tau)
			T = obj.findPeriod(tau);
			F = 1/T;
		end
		function ft = fallTime(obj, tau)
			ft = -1*tau*log(obj.vtl/obj.vth);
		end
		function rt = riseTime(obj, tau)
			rtLow = -1*tau*log(1 - obj.vtl / obj.vdd);
			rtHigh = -1*tau*log(1 - obj.vth / obj.vdd);
			rt = rtHigh - rtLow;
        end
        function oT = onTime(obj, tau)
            T = obj.findPeriod(tau);
            oT = T*2;
        end
        function dC = findDutyCycle(obj, tau1, tau2)
            %tau1 is the main oscillator tau
            %tau2 is the duty cycle control tau
            T1 = obj.findPeriod(tau1);
            T2 = obj.onTime(tau2);
            dC = T2/T1;
        end
	end
end
