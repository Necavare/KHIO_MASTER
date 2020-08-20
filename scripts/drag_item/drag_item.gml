/// @description drag_item
/// @param item_grid
/// @param count_grid
/// @param durability_grid
/// @param x
/// @param y
/// @param isSingleClicked
function drag_item() {
	var items = argument[0];
	var count = argument[1];
	var durability = argument[2];
	var xx = argument[3];
	var yy = argument[4];
	var isSingleClick = argument[5];

	/*if(global.last_item == item.enemymap) {
		show_debug_message("last item is enemy map");
	
		//uncover a random not uncovered map
		var uncovered = false;
		for(var i = 0; i < ds_list_size(global.campIdList); i++){
			if(!uncovered && ds_list_find_value(global.campCol, i) != 0){
				uncovered = true;
				ds_list_set(global.campCol, i, 1);
				
				global.enemyMap = true;
				o_hud.enemyMapTime = 0;
			}
		}
	}

	//set a treasure
		if(global.last_item == item.treasureMap) {
			show_debug_message("item to add treasure map");
		
			var uncovered = false;
			for(var i =0; i < ds_list_size(global.moundXList); i++){
				if(!uncovered && ds_list_find_value(global.moundTypeList, i) == 0){
					show_debug_message("uncovered treasure");
					uncovered = true;
					ds_list_set(global.moundTypeList, i, 1);
				
					global.enemyMap = true;
					global.enemyMapTime = 0;
					//set a treasure icon (no library)
				
					i = ds_list_size(global.moundXList);
				}
			}
		}*/
	
	if(global.last_item == item.keycard && !global.journalKeyFound) {
		global.journalKeyFound = true;
		o_hud.journalKeyTime = 0;
	}

	// If poison is picked and item is a sword, knife, or bolt
	if(global.isItemPicked && global.last_item == item.poison && (items[# xx, yy] == item.sword || items[# xx, yy] == item.knife || items[# xx, yy] == item.bolt || items[# xx, yy] == item.flintbolt || items[# xx, yy] == item.bonebolt  || items[# xx, yy] == item.metalbolt)) {
		// Changning item to poison
		switch(items[# xx, yy]) {
			case item.sword: items[# xx, yy] = item.poisonsword; break;
			case item.knife: items[# xx, yy] = item.poisonknife; break;
			case item.bolt: items[# xx, yy] = item.poisonbolt; break;
			case item.flintbolt: items[# xx, yy] = item.poisonflintbolt; break;
			case item.bonebolt: items[# xx, yy] = item.poisonbonebolt; break;
			case item.metalbolt: items[# xx, yy] = item.poisonmetalbolt; break;
		}
	
		global.picked_quantity--;
		
		if(global.picked_quantity == 0) {
			global.last_item = 0;
			global.isItemPicked = false;
			global.picked_durability = -1;
		}

	} else if(!isSingleClick && count != 0) {
		if(count[# xx, yy] > 0 && !global.isItemPicked) { // Picking up an item
			// Saving item
			global.isItemPicked = true;
			global.last_item = items[# xx, yy];
			global.picked_quantity = count[# xx, yy];
			if(global.picked_durability == -1)
			global.picked_durability = durability[# xx, yy];
	
			//remove item from slot
			items[# xx, yy] = 0;
			count[# xx, yy] = 0;
			durability[# xx, yy] = -1;
		
			// Saving item position for swapping later
			global.swapX = xx;
			global.swapY = yy;
			global.swapItemGrid = items;
			global.swapCountGrid = count;
			global.swapDurabilityGrid = durability;
		
		} else if(count[# xx, yy] <= 0 && global.isItemPicked) { // Putting item into empty slot
			//add item to slot
			items[# xx, yy] = global.last_item;
			count[# xx, yy] = global.picked_quantity;
			durability[# xx, yy] = global.picked_durability;
		
			//reset picking variables
			global.picked_quantity = 0;
			global.last_item = 0;
			global.isItemPicked = false;
			global.picked_durability = -1;
		
		} else if(count[# xx, yy] > 0 && global.isItemPicked && items[# xx, yy] == global.last_item && count[# xx, yy] != 8 && global.picked_quantity != 8) { // Putting item into slot with same item
			// Checking if item is single stackable
			var isSingle = false;					
			for(var i = 0; i < array_length_1d(global.singleItems); i++)
				if(global.singleItems[i] == global.last_item)
					isSingle = true;
				
			if(!isSingle) {
				// Averaging the food items durabilities
				if(durability[# xx, yy] > -1 || global.picked_durability > -1)
					durability[# xx, yy] = ((durability[# xx, yy]*count[# xx, yy]) + (global.picked_durability*global.picked_quantity)) / (count[# xx, yy] + global.picked_quantity);
				
				// Adding quantity to item
				while(count[# xx, yy] < 8 && global.picked_quantity > 0) {
					count[# xx, yy]++;
					global.picked_quantity--;
				}
			
				if(global.picked_quantity <= 0) {
					global.picked_quantity = 0;
					global.last_item = 0;
					global.isItemPicked = false;
					global.picked_durability = -1;
				}
			}
		} else if(count[# xx, yy] > 0 && global.isItemPicked && items[# xx, yy] != global.last_item) { // Swapping items
			// Saving items from slot
			var tempItem = items[# xx, yy];
			var tempCount = count[# xx, yy];
			var tempDura = durability[# xx, yy];
		
			// Putting picked item into slot
			items[# xx, yy] = global.last_item;
			count[# xx, yy] = global.picked_quantity;
			durability[# xx, yy] = global.picked_durability;
			
			// Getting rid of picked item
			global.last_item = 0;
			global.picked_quantity = 0;
			global.picked_durability = -1;
			global.isItemPicked = false;
		
			// Putting swapped item in slot
			global.swapItemGrid[# global.swapX, global.swapY] = tempItem;
			global.swapCountGrid[# global.swapX, global.swapY] = tempCount;
			global.swapDurabilityGrid[# global.swapX, global.swapY] = tempDura;
		
		} else if(global.isItemPicked) {
			// Putting swapped item in slot
			global.swapItemGrid[# global.swapX, global.swapY] = global.last_item;
			global.swapCountGrid[# global.swapX, global.swapY] = global.picked_quantity;
			global.swapDurabilityGrid[# global.swapX, global.swapY] = global.picked_durability;
		
			// Getting rid of picked item
			global.last_item = 0;
			global.picked_quantity = 0;
			global.picked_durability = -1;
			global.isItemPicked = false;
		}
	} else if(isSingleClick && count != 0) {
		if(count[# xx, yy] > 0 && !global.isItemPicked) { // Slot taken and no picked item
			// Saving item
			global.picked_quantity = 1;
			global.last_item = items[# xx, yy];
			global.isItemPicked = true;
			global.picked_durability = durability[# xx, yy];
			
			// Taking item out of slot
			count[# xx, yy]--;
		
			// Removing item from slot if 0
			if(count[# xx, yy] == 0) {
				items[# xx, yy] = 0;
				durability[# xx, yy] = -1;
			
				// Saving item position for swapping later
				global.swapX = xx;
				global.swapY = yy;
				global.swapItemGrid = items;
				global.swapCountGrid = count;
				global.swapDurabilityGrid = durability;
			}
			
		} else if(count[# xx, yy] == 0 && global.isItemPicked) { // Empty slot and item is picked
			// Adding item to slot
			items[# xx, yy] = global.last_item;
			count[# xx, yy]++;
			durability[# xx, yy] = global.picked_durability;
		
			// Saving item
			global.picked_quantity = 0;
			global.last_item = 0;
			global.isItemPicked = false;
			global.picked_durability = -1;
		} else if(count[# xx, yy] > 0 && global.isItemPicked && items[# xx, yy] == global.last_item) { // Filled slot and item picked is the same
			if(count[# xx, yy] < 8) {
				// Averaging the food items durabilities
				if(durability[# xx, yy] > -1 || global.picked_durability > -1)
					durability[# xx, yy] = ((durability[# xx, yy]*count[# xx, yy]) + (global.picked_durability*global.picked_quantity)) / (count[# xx, yy] + global.picked_quantity);
				
				// Adding item to slot
				count[# xx, yy]++;
		
				// Saving item
				global.picked_quantity = 0;
				global.last_item = 0;
				global.isItemPicked = false;
			} else {
				pickup_item(o_hud, global.last_item, 1);
			
				// Saving item
				global.picked_quantity = 0;
				global.last_item = 0;
				global.isItemPicked = false;
			}
		} else if(count[# xx, yy ] == 1 && global.isItemPicked && global.picked_quantity == 1) { // Swapping item if both are single
			// Saving items from slot
			var tempItem = items[# xx, yy];
			var tempCount = count[# xx, yy];
			var tempDura = durability[# xx, yy];
			
			// Putting picked item into slot
			items[# xx, yy] = global.last_item;
			count[# xx, yy] = global.picked_quantity;
			durability[# xx, yy] = global.picked_durability
		
			// Getting rid of picked item
			global.last_item = 0;
			global.picked_quantity = 0;
			global.picked_durability = -1;
			global.isItemPicked = false;
		
			// Putting swapped item in slot
			global.swapItemGrid[# global.swapX, global.swapY] = tempItem;
			global.swapCountGrid[# global.swapX, global.swapY] = tempCount;
			global.swapDurabilityGrid[# global.swapX, global.swapY] = tempDura;
		}
	} else if(count == 0) { // Adding single items *basically only for equip slots*
		if(items[# xx, yy] > 0 && !global.isItemPicked) { // Picking up an item
			// Saving item
			global.isItemPicked = true;
			global.last_item = items[# xx, yy];
			global.picked_quantity = 1;
			global.picked_durability = durability[# xx, yy];
	
			//remove item from slot
			items[# xx, yy] = 0;
			durability[# xx, yy] = 0;
					
		} else if(items[# xx, yy] == 0 && global.picked_quantity > 0 && global.isItemPicked) {
			// Adding item to slot
			items[# xx, yy] = global.last_item;
			durability[# xx, yy] = global.picked_durability;
		
			global.picked_quantity--;
		
			if(global.picked_quantity == 0) {
				global.last_item = 0;
				global.isItemPicked = false;
				global.picked_durability = -1;
			}
		}
	}


}
