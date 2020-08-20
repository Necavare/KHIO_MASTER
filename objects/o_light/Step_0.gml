var nearest = instance_nearest(x,y,o_light);
if(instance_exists(nearest) && point_distance(x,y,nearest.x,nearest.y) < 16)
	lightOff = true;