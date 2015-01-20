% Written by Max Ruiz
classdef RingOscillator
    properties
        vth;
        vtl;
        vmax;
    end
    
    methods
        function obj = RingOscillator(Vth, Vtl, Vmax)
            obj.vth = Vth;
            obj.vtl = Vtl;
            obj.vmax = Vmax;
        end
        
        function F = findFrequency(obj, tau)
            t = obj.findPeriod(tau);
            F = 1/t; 
        end
        
        function T = findPeriod(obj, tau)
            rt = obj.riseTime(tau);
            ft = obj.fallTime(tau);           
            T = rt + ft;       
        end
        
        function ft = fallTime(obj, tau)
            ft = -1*tau*log(obj.vtl/obj.vth);
        end
        
        function rt = riseTime(obj, tau)
            rtLow = -1*tau*log(1 - obj.vtl / obj.vmax);
            rtHigh = -1*tau*log(1 - obj.vth / obj.vmax);
            rt = rtHigh - rtLow;   
        end
        
    end
    
end
