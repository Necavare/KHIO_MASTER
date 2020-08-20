
	//spawn items now
	var weaponSpawned = false;
	
	// First decided how many slots should be filled
	var itemCount = irandom_range(3,8);
	
	var oversize = 0;
	
	repeat(itemCount){
		if(oversize < 7) {
			// Randomize items durability
			var itemDur = choose(5,5,6,6,6,7,7,7,7,8,8,9,10,11);
		
			var itemChance = irandom(99);
	
			if(itemChance < 5) { // 5% Bandage
				pickup_item(self, item.bandage, choose(1,1,1,2,2,2,2,2,2,3,3)); 
			} else if(itemChance < 10) { //5% Splint
				pickup_item(self, item.splint, 1);
			} else if(itemChance < 45) { // 35% Tools/Knifes/Armor
				if(itemChance < 25 && !weaponSpawned) {// 5% crossbow
					pickup_item(self, item.crossbow, 1, itemDur);	
					weaponSpawned = true;
				} else if(itemChance < 35) {// 10% axe
					pickup_item(self, choose(item.metalaxeS, item.metalaxeB), 1, itemDur);	
				} else if(itemChance < 45) {// 10% pic
					pickup_item(self, choose(item.metalpicS, item.metalpicB), 1, itemDur);			
				}
				
			} else if(itemChance<50) {// 5% flare
				pickup_item(self, item.flare, 1);
			} else if(itemChance < 55) {// 5% soup
				pickup_item(self, item.soup, 1);
			} else if(itemChance < 60) {// 5% lantern	
				pickup_item(self, item.lantern, 1, itemDur);
			} else if(itemChance < 75) {// 15% planks
				pickup_item(self, item.planks, choose(2,2,3,3), 11);
			} else if(itemChance < 95) {// 20% metal
				pickup_item(self, item.metal, choose(1,1,2), 11);
			} else if(itemChance < 100){// 5% ammo by itself
				pickup_item(self, choose(item.buckshot, item.rifleammo), choose(1,1,2,2,3,3,3,4), 11);
			} 
			
			oversize++;
		}
	}