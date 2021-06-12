using Revise: convert
using Revise

includet("../src/IPhreeqc.jl")

iph = IPhreeqc.CreateIPhreeqc()

IPhreeqc.LoadDatabase(iph, "../database/phreeqc.dat")
# iph = convert(Int, iph)

IPhreeqc.AccumulateLine(iph, "SOLUTION 1")
IPhreeqc.AccumulateLine(iph, "Na  0.1")
IPhreeqc.AccumulateLine(iph, "Cl  0.1")
IPhreeqc.AccumulateLine(iph, "pH  9.0  charge")
IPhreeqc.AccumulateLine(iph, "END")

IPhreeqc.SetOutputStringOn(iph, 1)
IPhreeqc.RunAccumulated(iph)

res = IPhreeqc.GetOutputString(iph)

print(res)

