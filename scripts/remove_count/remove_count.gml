/// @description check_count()
/// @param recipeItem
function remove_count() {
	var recipeItem = argument[0];

	var countToRemove = -1;
	var itemToRemove = -1;

	var countToRemove2 = -1;
	var itemToRemove2 = -1;

	var countToRemove3 = -1;
	var itemToRemove3 = -1;

	if(recipeItem == item.poison) {
		itemToRemove = item.lilly;
		countToRemove = 1;
	} else if(recipeItem == item.rope) {
		itemToRemove = item.grass;
		countToRemove = 4;
	} else if(recipeItem == item.gunpowder) {
		itemToRemove = item.sulfur;
		countToRemove = 2;
	
		itemToRemove2 = item.charcoal;
		countToRemove2 = 1;
	} else if(recipeItem == item.stoneShovelB || recipeItem == item.stoneShovelS) {
		itemToRemove = item.stick;
		countToRemove = 1;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 4;
	
		itemToRemove3 = item.rock;
		countToRemove3 = 1;
	} else if(recipeItem == item.stoneaxeB || recipeItem == item.stoneaxeS) {
		itemToRemove = item.stick;
		countToRemove = 1;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 4;
	
		itemToRemove3 = item.rock;
		countToRemove3 = 1;
	} else if(recipeItem == item.stonepicB || recipeItem == item.stonepicS) {
		itemToRemove = item.stick;
		countToRemove = 1;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 4;
	
		itemToRemove3 = item.rock;
		countToRemove3 = 1;
	} else if(recipeItem == item.bolt) {
		itemToRemove = item.stick;
		countToRemove = 1;
	} else if(recipeItem == item.flamebolt) {
		itemToRemove = item.bolt;
		countToRemove = 1;
	
		itemToRemove2 = item.flare;
		countToRemove2 = 1;
	} else if(recipeItem == item.poisonbolt) {
		itemToRemove = item.bolt;
		countToRemove = 1;
	
		itemToRemove2 = item.poison;
		countToRemove2 = 1;
	} else if(recipeItem == item.rifleammo) {
		itemToRemove = item.metal;
		countToRemove = 1;
	
		itemToRemove2 = item.gunpowder;
		countToRemove2 = 1;
	} else if(recipeItem == item.buckshot) {
		itemToRemove = item.metal;
		countToRemove = 2;
	
		itemToRemove2 = item.gunpowder;
		countToRemove2 = 2;
	} else if(recipeItem == item.torch) {
		itemToRemove = item.stick;
		countToRemove = 1;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 4;
	} else if(recipeItem == item.lantern) {
		itemToRemove = item.metal;
		countToRemove = 8;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 4;
	} else if(recipeItem == item.sword) {
		itemToRemove = item.metal;
		countToRemove = 8;
	
		itemToRemove2 = item.metal;
		countToRemove2 = 8;
	
		itemToRemove3 = item.furpelt;
		countToRemove3 = 2;
	} else if(recipeItem == item.poisonsword) {
		itemToRemove = item.sword;
		countToRemove = 1;
	
		itemToRemove2 = item.poison;
		countToRemove2 = 1;
	} else if(recipeItem == item.knife) {
		itemToRemove = item.metal;
		countToRemove = 8;
	
		itemToRemove2 = item.furpelt;
		countToRemove2 = 1;
	} else if(recipeItem == item.poisonknife) {
		itemToRemove = item.knife;
		countToRemove = 1;
	
		itemToRemove2 = item.poison;
		countToRemove2 = 1;
	} else if(recipeItem == item.snaretrap) {
		itemToRemove = item.stick;
		countToRemove = 1;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 4;
	
		itemToRemove3 = item.berry;
		countToRemove3 = 1;
	} else if(recipeItem == item.wall) {
		itemToRemove = item.stick;
		countToRemove = 4;
	} else if(recipeItem == item.door) {
		itemToRemove = item.planks;
		countToRemove = 6;
		itemToRemove2 = item.grass;
		countToRemove2 = 4;
	} else if(recipeItem == item.bonespikes) {
		itemToRemove = item.bones;
		countToRemove = 6;
	} else if(recipeItem == item.woodspikes) {
		itemToRemove = item.stick;
		countToRemove = 6;
	} else if(recipeItem == item.metalspikes) {
		itemToRemove = item.metal;
		countToRemove = 4;
	} else if(recipeItem == item.bedroll) {
		itemToRemove = item.furpelt;
		countToRemove = 8;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 8;
	} else if(recipeItem == item.firepit) {
		itemToRemove = item.stick;
		countToRemove = 4;
	
		itemToRemove2 = item.rock;
		countToRemove2 = 8;
	} else if(recipeItem == item.marker) {
		itemToRemove = item.stick;
		countToRemove = 2;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 2;
	
		itemToRemove3 = item.grass;
		countToRemove3 = 8;
	} else if(recipeItem == item.smallcrate) {
		itemToRemove = item.planks;
		countToRemove = 6;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 8;
	} else if(recipeItem == item.anvil) {
		itemToRemove = item.planks;
		countToRemove = 8;
	
		itemToRemove2 = item.metal;
		countToRemove2 = 6;
	
		itemToRemove3 = item.grass;
		countToRemove3 = 2;
	} else if(recipeItem == item.woodenhead) {
		itemToRemove = item.planks;
		countToRemove = 2;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 8;
	} else if(recipeItem == item.woodenchest) {
		itemToRemove = item.planks;
		countToRemove = 4;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 8;
	} else if(recipeItem == item.metalhead) {
		itemToRemove = item.metal;
		countToRemove = 4;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 8;
	} else if(recipeItem == item.metalchest) {
		itemToRemove = item.metal;
		countToRemove = 8;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 8;
	} else if(recipeItem == item.splint) {
		itemToRemove = item.planks;
		countToRemove = 1;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 8;
	} else if(recipeItem == item.bandage) {
		itemToRemove = item.grass;
		countToRemove = 1;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 5;
	} else if(recipeItem == item.sack) {
		itemToRemove = item.furpelt;
		countToRemove = 8;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 8;
	
		itemToRemove3 = item.grass;
		countToRemove3 = 8;
	} else if(recipeItem == item.metalShovelB || recipeItem == item.metalShovelS) {
		itemToRemove = item.stick;
		countToRemove = 1;
	
		itemToRemove2 = item.furpelt;
		countToRemove2 = 2;
	
		itemToRemove3 = item.metal;
		countToRemove3 = 8;
	} else if(recipeItem == item.metalaxeB || recipeItem == item.metalaxeS) {
		itemToRemove = item.stick;
		countToRemove = 1;
	
		itemToRemove2 = item.furpelt;
		countToRemove2 = 2;
	
		itemToRemove3 = item.metal;
		countToRemove3 = 6;
	} else if(recipeItem == item.metalpicB || recipeItem == item.metalpicS) {
		itemToRemove = item.stick;
		countToRemove = 1;
	
		itemToRemove2 = item.furpelt;
		countToRemove2 = 2;
	
		itemToRemove3 = item.metal;
		countToRemove3 = 8;
	} else if(recipeItem == item.boneaxeB || recipeItem == item.boneaxeS) {
		itemToRemove = item.stick;
		countToRemove = 1;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 4;
	
		itemToRemove3 = item.bones;
		countToRemove3 = 6;
	} else if(recipeItem == item.bonepicB || recipeItem == item.bonepicS) {
		itemToRemove = item.stick;
		countToRemove = 1;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 4;
	
		itemToRemove3 = item.bones;
		countToRemove3 = 8;
	} else if(recipeItem == item.boneclubB || recipeItem == item.boneclubS) {
		itemToRemove = item.stick;
		countToRemove = 2;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 4;
	
		itemToRemove3 = item.bones;
		countToRemove3 = 8;
	} else if(recipeItem == item.bonebolt) {
		itemToRemove = item.bolt;
		countToRemove = 1;
	
		itemToRemove2 = item.bones;
		countToRemove2 = 1;
	} else if(recipeItem == item.flintbolt) {
		itemToRemove = item.bolt;
		countToRemove = 1;
	
		itemToRemove2 = item.flint;
		countToRemove2 = 1;
	} else if(recipeItem == item.metalbolt) {
		itemToRemove = item.bolt;
		countToRemove = 1;
	
		itemToRemove2 = item.metal;
		countToRemove2 = 1;
	} else if(recipeItem == item.poisonbonebolt) {
		itemToRemove = item.bonebolt;
		countToRemove = 1;
	
		itemToRemove2 = item.poison;
		countToRemove2 = 1;
	} else if(recipeItem == item.poisonflintbolt) {
		itemToRemove = item.flintbolt;
		countToRemove = 1;
	
		itemToRemove2 = item.poison;
		countToRemove2 = 1;
	} else if(recipeItem == item.poisonmetalbolt) {
		itemToRemove = item.metalbolt;
		countToRemove = 1;
	
		itemToRemove2 = item.poison;
		countToRemove2 = 1;
	} else if(recipeItem == item.leatherhead) {
		itemToRemove = item.furpelt;
		countToRemove = 6;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 8;
	} else if(recipeItem == item.leatherchest) {
		itemToRemove = item.furpelt;
		countToRemove = 8;
	
		itemToRemove2 = item.grass;
		countToRemove2 = 8;
	}

	// Removing first item
	/*while(countToRemove > 0) {
		for(var i = 0; i < 3; i++) {
			if(items[# i, 0] == itemToRemove && countToRemove > 0) {
				if(count[# i, 0] > 0) {
					count[# i, 0]--;
					countToRemove--;
				}
			
				if(count[# i, 0] == 0) {
					items[# i, 0] = 0;
					dura[# i, 0] = -1;
				}
			}
		}
	}*/
	inventory_remove(itemToRemove, countToRemove);
	inventory_remove(itemToRemove2, countToRemove2);
	inventory_remove(itemToRemove3, countToRemove3);

	// Removing second item if exists
	/*while(countToRemove2 > 0) {
		for(var i = 0; i < 3; i++) {
			if(items[# i, 0] == itemToRemove2 && countToRemove2 > 0) {
				if(count[# i, 0] > 0) {
					count[# i, 0]--;
					countToRemove2--;
				}
			
				if(count[# i, 0] == 0) {
					items[# i, 0] = 0;
					dura[# i, 0] = -1;
				}
			}
		}
	}*/

	// Removing third item if exists
	/*while(countToRemove3 > 0) {
		for(var i = 0; i < 3; i++) {
			if(items[# i, 0] == itemToRemove3 && countToRemove3 > 0) {
				if(count[# i, 0] > 0) {
					count[# i, 0]--;
					countToRemove3--;
				}
			
				if(count[# i, 0] == 0) {
					items[# i, 0] = 0;
					dura[# i, 0] = -1;
				}
			}
		}
	}*/


}
