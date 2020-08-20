///@description Spreading
var near = instance_nearest(x,y,o_effect_fire);
if(!isOnFire && ((near != noone && point_distance(x,y,near.x,near.y) < 20) && irandom_range(0,5) == 0 && near.z < 6)) 
	isOnFire = true;
	
var nearFlare = instance_nearest(x,y,o_effect_flare);
if(!isOnFire && ((nearFlare != noone && point_distance(x,y,nearFlare.x,nearFlare.y) < 20) && !nearFlare.lightOff && nearFlare.z < 10)) 
	isOnFire = true;
	
alarm[1] = 60;