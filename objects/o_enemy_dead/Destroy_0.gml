// oner ride
if(!global.generatingEnvironment) {
	instance_create_depth(x,y,depth,o_blood_spot);
	
	// Dropping inventory
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
		
	// Creates meat item
	var meat = instance_create_depth(x,y,depth, o_item);
		meat.item_ = item.human;
		meat.direction = irandom_range(0,360);
		meat.bounce = true;
		meat.item_count = irandom_range(3,6);
		meat.durability = 11;
			
	// Create bone item
	var bone = instance_create_depth(x,y,depth, o_item);
		bone.item_ = item.bones;
		bone.direction = irandom_range(0,360);
		bone.bounce = true;
		bone.item_count = irandom_range(4, 8);
		
	// Create bone item
	var coat = instance_create_depth(x,y,depth, o_item);
		coat.item_ = item.bluecloak;
		coat.direction = irandom_range(0,360);
		coat.bounce = true;
		coat.item_count = 1;
}