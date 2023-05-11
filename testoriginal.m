syms t a b ph am;
f1=exp(1j*(pi/2))+exp(1j*0);
f2=am*exp(1j*(ph));
f3=f1-f2;
solve(f3,am,ph)
