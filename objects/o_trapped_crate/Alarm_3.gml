
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
	
			if(itemChance < 10) { // 10% Bandage
				pickup_item(self, item.bandage, choose(0,0,1)); 
			} else if(itemChance < 20) { // 10% Splint
				pickup_item(self, item.splint, choose(0,0,0,1));
			} else if(itemChance < 50) { // 30% Tools/Knifes/Armor
				if(itemChance < 30 && !weaponSpawned) {// 10% crossbow
					pickup_item(self, item.crossbow, 1, itemDur);	
					weaponSpawned = true;
				} else if(itemChance < 40 && !weaponSpawned) {// 10% axe
					pickup_item(self, choose(item.metalaxeS, item.metalaxeB), 1, itemDur);	
					weaponSpawned = true;
				} else if(itemChance < 50 && !weaponSpawned) {// 10% pic
					pickup_item(self, choose(item.metalpicS, item.metalpicB), 1, itemDur);	
					weaponSpawned = true;
				}
				
			} else if(itemChance< 55) {// 5% flare
				pickup_item(self, item.flare, choose(0,0,0,1), itemDur);
			} else if(itemChance < 60) {// 5% soup
				pickup_item(self, item.soup, 1);
			} else if(itemChance < 65) {// 5% lantern	
				pickup_item(self, item.lantern, choose(0,0,0,1), itemDur);
			} else if(itemChance < 80) {// 15% planks
				pickup_item(self, item.planks, choose(0,0,0,0,1,1), 11);
			} else if(itemChance < 95) {// 15% metal
				pickup_item(self, item.metal, choose(0,0,0,0,1,1), 11);
			} else if(itemChance < 100){// 5% ammo by itself
				pickup_item(self, choose(item.buckshot, item.rifleammo), choose(1,1,2,2,3,3,3,4), 11);
			} 
			
			oversize++;
		}
	}