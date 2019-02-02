set start; 
set Dest;
set Drone; 

var x{i in Start,  J in des, k in Drone}bibary;


param cost{1..p,1..p}; 
param demand{j in Dest};
param capacity1=10;
param capacity2=15;

var x{1..p,1..q,1..r} binary; 
var y{1..p}>=0;

minimize Total_Distance: sum{i in 1..p, j in 1..p} cost[i,j]*x[i,j];

subject to

ArriveEachCity{j in 1..p}: sum{i in 1..p}x[i,j] = 1; 

DepartEachCity{i in 1..p}: sum{j in 1..p}x[i,j] = 1; 

Subtourconstraint{i in 2..p, j in 2..p:i<>j}: y[i]-y[j] + p*x[i,j] <= p-1; 

subject to demcon1 {i in Start,r in Drone}:sum{j in Dest}x[i,j,k]*demand[j]<=capacity1;



