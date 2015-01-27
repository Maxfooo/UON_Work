classdef (ConstructOnLoad = true) SchmittOscillator
    
    properties
        vrailH;
        vrailL;
        r1;
        r2;
        rf;
        c1;
        tau;
    end
    
    methods (Access = public)
        function obj = SchmittVCO(Vdd, Vss, railOffset, R1, R2, Rf, C1)
            obj.vrailH = Vdd - railOffset;
            obj.vrailL = Vss + railOffset;
            obj.r1 = R1;
            obj.r2 = R2;
            obj.rf = Rf;
            obj.c1 = C1;
            obj.tau = Rf*C1;
        end
        
        function [triggerHigh, triggerLow] = threshold(obj, vin)
            par = obj.parallel();
            v1 = (vin/obj.r1 + obj.vrailH/obj.r2);
            v2 = (vin/obj.r1 + obj.vrailL/obj.r2);
            triggerHigh = v1*par; 
            triggerLow = v2*par;
        end
        
        function rpr = parallel(obj)
            rpr = 1/(1/obj.r1 + 1/obj.r2);
        end
        
        function F = findFrequency(obj, tau)
            t = obj.findPeriod(tau);
            F = 1/t; 
        end
        
        function T = findPeriod(obj, vin)
            rt = obj.riseTime(vin);
            ft = obj.fallTime(vin);           
            T = rt + ft;       
        end
        
        function ft = fallTime(obj, vin)
            [vth, vtl] = obj.threshold(vin);
            ft = -1*obj.tau*log(vtl/vth);
        end
        
        function rt = riseTime(obj, vin)
            [vth, vtl] = obj.threshold(vin);
            rtLow = -1*obj.tau*log(1 - vtl / obj.vrailH);
            rtHigh = -1*obj.tau*log(1 - vth / obj.vrailH);
            rt = rtHigh - rtLow;   
        end

        function tau = getTau(obj)
            tau = obj.tau;
        end
        
    end
    
    methods (Access = private, Static)
        function vm = vminus(vout, tau, time)
            vm = vout/tau*exp(-time/tau);         
        end
        
    end
        
end
