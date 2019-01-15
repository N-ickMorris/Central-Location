param numS;				#number of Sites

set S:=1..numS;				#set of Sites

param h{i in S};			#x-coordinate of i
param v{i in S};			#y-coordinate of i
param t{i in S};			#number of trips i requires per week from helicopter
param c default 1;			#cost per radial distance unit for a helicopter

var x;					#optimal x-coordinate for helicopter
var y;					#optimal y-coordinate for helicopter
var ax{i in S};				#the absolute x-distance between i & helicopter
var ay{i in S};				#the absolute y-distance between i & helicopter

minimize Distance: sum{i in S}(c*t[i]*((ax[i]^2)+(ay[i]^2)));
s.t. CoordinateX1{i in S}: ax[i] >= x-h[i];
s.t. CoordinateX2{i in S}: ax[i] >= h[i]-x;
s.t. CoordinateY1{i in S}: ay[i] >= y-v[i];
s.t. CoordinateY2{i in S}: ay[i] >= v[i]-y;