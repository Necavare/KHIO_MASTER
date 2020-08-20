// Inherit the parent event
event_inherited();

// Creates item
if(!isOnFire && !global.generatingEnvironment) {
	var grass = instance_create_depth(x,y,depth, o_item);
	grass.image_index = item.grass;
	grass.direction = irandom_range(0,360);
	grass.bounce = true;
}