event_inherited();

if(!global.generatingEnvironment) {
	for(var ix = 0; ix < width; ix++)
		for(var iy = 0; iy < height; iy++)
			if(items[# ix, iy] > 0) {
				var item_ = instance_create_depth(x,y,depth, o_item);
				item_.image_index = items[# ix, iy];
				item_.direction = irandom_range(0,360);
				item_.bounce = true;
				item_.durability = durability[# ix, iy];
				item_.item_count = count[# ix, iy];
			}

	// Creates item
	var rock = instance_create_depth(x,y,depth, o_item);
	rock.image_index = item.rock;
	rock.direction = irandom_range(0,360);
	rock.bounce = true;
	rock.item_count = irandom_range(1,4);
}