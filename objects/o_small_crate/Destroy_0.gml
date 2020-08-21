// Inherit the parent event
event_inherited();

if(!global.generatingEnvironment) {
	for(var ix = 0; ix < width; ix++)
		for(var iy = 0; iy < height; iy++)
			if(items[# ix, iy] > 0) {
				var item_ = instance_create_depth(x,y,depth, o_item);
				item_.item_ = items[# ix, iy];
				item_.direction = irandom_range(0,360);
				item_.bounce = true;
				item_.durability = durability[# ix, iy];
				item_.item_count = count[# ix, iy];
			}

	if(!isOnFire) {
		// Creates item
		var plank = instance_create_depth(x,y,depth, o_item);
		plank.item_ = item.planks;
		plank.direction = irandom_range(0,360);
		plank.bounce = true;
		plank.item_count = irandom_range(1,2);
	}
}