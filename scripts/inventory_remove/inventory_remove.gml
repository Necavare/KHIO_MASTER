/// @description inventory_remove
/// @param item
/// @param count
function inventory_remove() {
	var item = argument[0];
	var count = argument[1];

	var countTotal = count;

	// Looking through crafting slot
	while(countTotal > 0 && o_hud.craftingCount[# 0, 0] > 0 && o_hud.craftingItems[# 0, 0] == item)
		if(o_hud.craftingItems[# 0, 0] == item && o_hud.craftingCount[# 0, 0] > 0) {
			o_hud.craftingCount[# 0, 0]--;
			countTotal--;
		
			if(o_hud.craftingCount[# 0, 0] == 0) 
				o_hud.craftingDurability[# 0, 0] = -1;
		}

	// Looking through inventory
	if(countTotal > 0)
		for(var ix = 0; ix < 3; ix++)
			for(var iy = 0; iy < 3; iy++)
				if(o_hud.items[# ix, iy] == item && o_hud.count[# ix, iy] > 0)
					while(o_hud.count[# ix, iy] > 0 && countTotal > 0) {
						o_hud.count[# ix, iy]--;
						countTotal--;
				
						if(o_hud.count[# ix, iy] == 0) {
							o_hud.durability[# ix, iy] = -1;
							o_hud.items[# ix, iy] = 0;
						}
					}
	
	// Looking through hotbar
	if(countTotal > 0)
		for(var iy = 0; iy < 3; iy++)
			if(o_hud.hotbarItems[# 0, iy] == item && o_hud.hotbarCount[# 0, iy] > 0)
				while(o_hud.hotbarCount[# 0, iy] > 0 && countTotal > 0) {
					o_hud.hotbarCount[# 0, iy]--;
					countTotal--;
				
					if(o_hud.hotbarCount[# 0, iy] == 0) {
						o_hud.hotbarDurability[# 0, iy] = -1;
						o_hud.hotbarItems[# 0, iy] = 0;
					}
				}



}
