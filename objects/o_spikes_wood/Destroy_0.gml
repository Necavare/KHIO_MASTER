// Inherit the parent event
event_inherited();

if(!isOnFire && !global.generatingEnvironment) {
	// Creates item
	var stick = instance_create_depth(x,y,depth, o_item);
	stick.image_index = item.stick;
	stick.direction = irandom_range(0,360);
	stick.bounce = true;
	stick.item_count = irandom_range(0,2);
}