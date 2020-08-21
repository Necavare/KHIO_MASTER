// Inherit the parent event
event_inherited();

if(!isOnFire && !global.generatingEnvironment) {
	// Creates item
	var plank = instance_create_depth(x,y,depth, o_item);
	plank.item_ = item.planks;
	plank.direction = irandom_range(0,360);
	plank.bounce = true;
	plank.item_count = irandom_range(2,3);
}