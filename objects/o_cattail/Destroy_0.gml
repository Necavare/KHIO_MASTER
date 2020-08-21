// Inherit the parent event
event_inherited();
	
if(!isOnFire && !global.generatingEnvironment) {
	// Creates item
	var grass = instance_create_depth(x,y,depth, o_item);
	grass.item_ = item.grass;
	grass.direction = irandom_range(0,360);
	grass.bounce = true;
}