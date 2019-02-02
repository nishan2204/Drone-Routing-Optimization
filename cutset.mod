set Start ordered;
set Dest;
set Drone;
set First;
set Others;
param n := card{Start};
set S; #Number of Cities


param N=21;
param DC{k in Drone};
param cost{i in Start, j in Dest};
param demand{i in Start};

var X{i in Start,j in Dest,k in Drone}binary;

var Y{i in Start,k in Drone}binary;


minimize z: sum{i in Start, j in Dest, k in Drone}cost[i,j]*X[i,j,k];

subject to mincost1{k in Drone} : sum{i in Start}demand[i]*Y[i,k]<=DC[k]; #demand[i] to demand[j]
#subject to mincost1{k in Drone} : sum{i in Start, j in Dest}demand[i]*X[i,j,k]<=DC[k]; #demand[i] to demand[j]

subject to demandcov {j in Dest}: sum{i in Start, k in Drone}X[i,j,k]>=1;

#subject to inddrones{i in Start, j in Dest} :sum{k in Drone1]X[i,j,k]+sum{k in Drone2}X2[i,j,k] <=1;

subject to route1{i in First}:sum{k in Drone}Y[i,k]>=6;

subject to route2{i in Others}:sum{k in Drone}Y[i,k]=1;


#subject to entleav1{i in Start, k in Drone}:sum{j in Dest}X[i,j,k]=Y[i,k];

subject to Subtour{l in S,k in Drone}:sum{i in Start, j in Start}X[i,j,k]<=n-1;

