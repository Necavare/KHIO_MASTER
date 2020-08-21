event_inherited();

if(!global.generatingEnvironment) {
	// Creates item
	var stick = instance_create_depth(x,y,depth, o_item);
	stick.item_ = item.stick;
	stick.direction = irandom_range(0,360);
	stick.bounce = true;
	stick.item_count = 3;
}