#include <cmath>

class Ring_Oscillator
{
private:
    double vth;
    double vtl;
    double vmax;
    double fallTime(double tau);
    double riseTime(double tau);

public:
    Ring_Oscillator(double Vth, double Vtl, double Vmax);
    double findFrequency(double tau);
    double findPeriod(double tau);

};

Ring_Oscillator::Ring_Oscillator(double Vth, double Vtl, double Vmax)
{
    this->vth = Vth;
    this->vtl = Vtl;
    this->vmax = Vmax;
}

double Ring_Oscillator::fallTime(double tau)
{
    double ft = -1*tau*log(this->vtl / this->vth);
    return ft;

}

double Ring_Oscillator::riseTime(double tau)
{
    double rtLow = -1*tau*log(1 - this->vtl / this->vmax);
    double rtHigh = -1*tau*log(1 - this->vth / this->vmax);
    double rt = rtHigh - rtLow;
    return rt;
}

double Ring_Oscillator::findPeriod(double tau)
{
    double rt = this->riseTime(tau);
    double ft = this->fallTime(tau);
    double T = rt + ft;
    return T;
}

double Ring_Oscillator::findFrequency(double tau)
{
    double T = this->findPeriod(tau);
    double F = 1/T;
    return F;
}
