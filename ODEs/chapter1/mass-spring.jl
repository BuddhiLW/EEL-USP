using Pkg
Pkg.add("DifferentialEquations")
Pkg.add("PyPlot")
using DifferentialEquations, Plots, PyPlot

function mass_spring(du,u,p,t)
    du[1] = -(p[2]/p[1])*u[2] #p[2]=k, p[1]=m
    du[2] = u[1]
end

tspan = (0., 4*2π*sqrt(1/1))
p = (1,1)
# m=1
# k=1
# g=9.8
u0=[1.,-1.] #y0=1 y'0=-1

prob = ODEProblem(mass_spring, u0, tspan, p)
sol = solve(prob,Tsit5(),reltol=1e-8,abstol=1e-8)
