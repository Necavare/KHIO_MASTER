// Inherit the parent event
event_inherited();

if(!isOnFire) {
	for(var ix = 0; ix < width; ix++)
		for(var iy = 0; iy < height; iy++)
			if(count[# ix, iy] > 0) {
				var item_ = instance_create_depth(x,y,depth, o_item);
				item_.image_index = items[# ix, iy];
				item_.direction = irandom_range(0,360);
				item_.bounce = true;
				item_.item_count = count[# ix, iy];
			}
}