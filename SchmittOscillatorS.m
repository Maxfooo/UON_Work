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
        
        function F = getFrequency(obj, tau)
            t1 = obj.riseTime(tau);
            t2 = obj.fallTime(tau);
            T = t1+t2;
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
        
    end
    
end
