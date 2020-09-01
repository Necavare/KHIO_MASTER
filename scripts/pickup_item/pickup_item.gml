/// @description pickup_item()
/// @param object
/// @param item
/// @param amount
/// @param durability
function pickup_item() {
	var object = argument[0];
	var itemToAdd = argument[1];
	var amount = argument[2];
	var durability = -1;

	if(argument_count > 3)
		durability = argument[3];
		
	var addedCount = 0;

	var width = object.width;
	var height = object.height;

	var single = false;
	var singleCount = 0;
	if(!inventory_full(itemToAdd) || object != o_hud) {

	if(object == o_hud) {	
		if(itemToAdd == item.keycard && !global.journalKeyFound) {
			global.journalKeyFound = true;
			o_hud.journalKeyTime = 0;
		}
	}

	if(!global.generatingEnvironment && object == o_hud)
		switch(irandom_range(0,3)) {
			case 0: audio_play_sound(sn_equip_1, 1, 0); break;
			case 1: audio_play_sound(sn_equip_2, 1, 0); break;
			case 2: audio_play_sound(sn_equip_3, 1, 0); break;
			case 3: audio_play_sound(sn_equip_4, 1, 0); break; 
		}

	// Checking if item is single stackable
	for(var i = 0; i < array_length(global.singleItems); i++)
		if(global.singleItems[i] == itemToAdd)
			single = true;
		
	if(single) {
		// Checking hotbar slots to see if it can be added
		if(object == o_hud && !o_hud.fromHotbar) 
			for(var yy = 0; yy < 3; yy++)
				if(object.hotbarCount[# 0, yy] <= 0) {
					o_hud.showHotbar = true;
					object.hotbarItems[# 0, yy] = itemToAdd;
					object.hotbarCount[# 0, yy]++;
					
					if(durability > -1)
						for(var i = 0; i < array_length(global.durabilityItems); i++)
							if(global.durabilityItems[i] == itemToAdd)
								object.hotbarDurability[# 0, yy] = durability;
				
					singleCount++;
					
					if(singleCount == amount)
						return true;
				}
	
		// Checking inventory if hotbar is full
		for(var i = 0; i < amount; i++) {
			for(var yy = 0; yy < height; yy++)
				for(var xx = 0; xx < width; xx++)
					if(object.count[# xx, yy] <= 0) {
						object.items[# xx, yy] = itemToAdd;
						object.count[# xx, yy]++;
					
						if(durability > -1)
							for(var i = 0; i < array_length(global.durabilityItems); i++)
								if(global.durabilityItems[i] == itemToAdd)
									object.durability[# xx, yy] = durability;
				
						singleCount++;
					
						if(singleCount == amount)
							return true;
					}
		}
	
	
		return false;
	} else if(!single) {
		// Check hotbar for same item
		if(object == o_hud && !o_hud.fromHotbar) 
			for(var yy = 0; yy < 3; yy++)
				if(object.hotbarItems[# 0, yy] == itemToAdd && object.hotbarCount[# 0, yy] < 8) {
						o_hud.showHotbar = true;
						var c = 8-object.hotbarCount[# 0, yy];
						for(var i = 0; i < c; i++) {
							if(addedCount != amount) {
								object.hotbarCount[# 0, yy]++;
						
								if(durability > -1)
									for(var i = 0; i < array_length(global.durabilityItems); i++)
									if(global.durabilityItems[i] == itemToAdd)
										object.hotbarDurability[# 0, yy] = durability;
							
								addedCount++;
							} else break;
						}
					}
				
		// Checking if similar item exists and item is less than max
		for(var yy = 0; yy < height; yy++) {
			for(var xx = 0; xx < width; xx++) {
				if(object.items[# xx, yy] == itemToAdd && object.count[# xx, yy] < 8) {
					var c = 8-object.count[# xx, yy];
					for(var i = 0; i < c; i++) {
						if(addedCount != amount) {
							object.count[# xx, yy]++;
						
							if(durability > -1)
								for(var i = 0; i < array_length(global.durabilityItems); i++)
								if(global.durabilityItems[i] == itemToAdd)
									object.durability[# xx, yy] = durability;
							
							addedCount++;
						} else break;
					}
				}
			}
		}
	
		// If no more slots have the same item add to a new slot
		if(object != o_hud) {
			var breakCount = 0;
			while(addedCount != amount) {
		
				// Hotbar
				if(object == o_hud && !o_hud.fromHotbar)
					for(var yy = 0; yy < 3; yy++)
						if(object.hotbarCount[# 0, yy] <= 0) {
							o_hud.showHotbar = true;
							for(var i = 0; i < 8; i++) {
								if(addedCount != amount) {
									object.hotbarItems[# 0, yy] = itemToAdd;
									object.hotbarCount[# 0, yy]++;
							
									if(durability > -1 && (i == 7 || i == amount-1))
										for(var i = 0; i < array_length(global.durabilityItems); i++)
											if(global.durabilityItems[i] == itemToAdd)
												object.hotbarDurability[# 0, yy] = durability;
							
									addedCount++;
								} else break;
							}
						}
				
				// Inv
				for(var yy = 0; yy < height; yy++) {
					for(var xx = 0; xx < width; xx++) {
						if(object.count[# xx, yy] <= 0) {
							for(var i = 0; i < 8; i++) {
								if(addedCount != amount) {
									object.items[# xx, yy] = itemToAdd;
									object.count[# xx, yy]++;
							
									if(durability > -1 && (i == 7 || i == amount-1))
										for(var i = 0; i < array_length(global.durabilityItems); i++)
											if(global.durabilityItems[i] == itemToAdd)
												object.durability[# xx, yy] = durability;
							
									addedCount++;
								} else break;
							}
						}
					}
				}
			
				breakCount++;
				if(breakCount >= 100)
					break;
			}
		}
	
		// Redundant but whatever it works
		if(object == o_hud) {
			var breakCount = 0;
			while(addedCount != amount && !inventory_full(itemToAdd)) {
				// Hotbar
				if(object == o_hud && !o_hud.fromHotbar)
					for(var yy = 0; yy < 3; yy++)
						if(object.hotbarCount[# 0, yy] <= 0) {
							o_hud.showHotbar = true;
							for(var i = 0; i < 8; i++) {
								if(addedCount != amount) {
									object.hotbarItems[# 0, yy] = itemToAdd;
									object.hotbarCount[# 0, yy]++;
							
									if(durability > -1 && (i == 7 || i == amount-1))
										for(var i = 0; i < array_length(global.durabilityItems); i++)
											if(global.durabilityItems[i] == itemToAdd)
												object.hotbarDurability[# 0, yy] = durability;
							
									addedCount++;
								} else break;
							}
						}
				
				// Inv
				for(var yy = 0; yy < height; yy++) {
					for(var xx = 0; xx < width; xx++) {
						if(object.count[# xx, yy] <= 0) {
							for(var i = 0; i < 8; i++) {
								if(addedCount != amount) {
									object.items[# xx, yy] = itemToAdd;
									object.count[# xx, yy]++;
							
									if(durability > -1 && (i == 7 || i == amount-1))
										for(var i = 0; i < array_length(global.durabilityItems); i++)
											if(global.durabilityItems[i] == itemToAdd)
												object.durability[# xx, yy] = durability;
							
									addedCount++;
								} else break;
							}
						}
					}
				}
			
				breakCount++;
				if(breakCount >= 100)
					break;
			}
		}
	}

	if(addedCount < amount) {
		// Creates item
		var item_ = instance_create_depth(o_player.x, o_player.y, o_player.depth, o_item);
		item_.item_ = itemToAdd;
		item_.direction = irandom_range(0,360);
		item_.bounce = true;
		item_.item_count = amount-addedCount;
		item_.durability = durability;
	
	}
	}


}
