set hr;
set sx;
set sy;

param DEMAND{i in hr}>=0;
param T1{i in hr,j in sx}>=0;
param T2{i in hr,k in sy}>=0;

var X{sx} integer>=0;
var Y{sy} integer>=0;

minimize COST: 
			sum{j in sx}(X[j]*350)+sum{k in sy}(Y[k]*550);

subject to CAPACITY{i in hr}: 
			sum{j in sx} X[j]*450*T1[i,j] + sum{k in sy} Y[k]*1000*T2[i,k] >= DEMAND[i];

subject to MIN_T1:
			sum{j in sx} X[j]>=3;

subject to MIN_T2:
			sum{k in sy} Y[k]>=2;