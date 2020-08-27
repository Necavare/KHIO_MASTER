// Randomly spawn with items
if(room != r_title) {
		
	//spawn items now
	var weaponSpawned = false;
	
	// First decided how many slots should be filled
	var itemCount = irandom_range(4,8);
	
	var oversize = 0;
	repeat(itemCount){
		if(oversize < 8) {
			// Randomize items durability
			var itemDur = choose(5,5,6,6,6,7,7,7,7,8,8,9,10,11);
		
			var itemChance = irandom(99);
	
			if(itemChance < 28) { // 30% Soup
				pickup_item(self, item.soup, 1);
			} else if(itemChance < 48) { // 20% Medkit
				pickup_item(self, item.medkit, 1);
			} else if(itemChance < 68) {// 20% flare
				pickup_item(self, item.flare, 1, itemDur);
			} else if(itemChance < 78) {// 10% planks
				pickup_item(self, item.planks, choose(2,2,3,3,4));
			} else if(itemChance < 88) {// 10% metal
				pickup_item(self, item.metal, choose(1,1,1,2,3));
			} else if(itemChance < 98 && !weaponSpawned){// 10% crossbow by itself
				pickup_item(self, item.crossbow, 1, 11);
				weaponSpawned = true;
			} else if(itemChance < 100 && !weaponSpawned){//2% unknown map
				pickup_item(self, item.treasureMap, 1);
				weaponSpawned = true;
			}
		
			oversize++;
		}
	}
}