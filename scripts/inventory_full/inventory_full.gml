function inventory_full() {
	var itemToCheck = -1;
	var isSingle = -1;
	if(argument_count == 1) {
		itemToCheck = argument[0];
	
		for(var i = 0; i < array_length_1d(global.singleItems); i++)
			if(global.singleItems[i] == itemToCheck)
				isSingle = true;
	}

	var fullCount = 0;

	var items = o_hud.items;
	var count = o_hud.count;

	var hotbarItems = o_hud.hotbarItems;
	var hotbarCount = o_hud.hotbarCount;

	if(isSingle) { // If single stackable item, check inventory for empty slot
		// Check hotbar first
		for(var yy = 0; yy < 3; yy++)
			if(hotbarItems[# 0, yy] >= 1)
				fullCount++;
			
		// Then check inventory
		for(var yy = 0; yy < 3; yy++)
			for(var xx = 0; xx < 3; xx++)
				if(items[# xx, yy] >= 1)
					fullCount++;	
	} else if(!isSingle) { // If not single stackable item, check inventory for same item or empty slot
		// First check hotbar
		for(var yy = 0; yy < 3; yy++)
			if((hotbarItems[# 0, yy] == itemToCheck && hotbarCount[# 0, yy] >= 8) || (hotbarItems[# 0, yy] != itemToCheck && hotbarCount[# 0, yy] > 0))
				fullCount++;
	
		// Then check inventory
		for(var yy = 0; yy < 3; yy++)
			for(var xx = 0; xx < 3; xx++)
				if((items[# xx, yy] == itemToCheck && count[# xx, yy] >= 8) || (items[# xx, yy] != itemToCheck && count[# xx, yy] > 0))
					fullCount++;
	}

	if(fullCount >= 12)
		return true;
	else
		return false;


}
