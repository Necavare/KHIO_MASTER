// Inherit the parent event
event_inherited();

if(!isOnFire) {
	// Creates item
	var grass = instance_create_depth(x,y,depth, o_item);
	grass.image_index = item.grass;
	grass.direction = irandom_range(0,360);
	grass.bounce = true;
	grass.item_count = irandom_range(0,1);
}