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
	
			if(itemChance < 20) { // 20% Soup
				pickup_item(self, item.soup, choose(0,0,1));
			} else if(itemChance < 40) { // 20% Medkit
				pickup_item(self, item.medkit, choose(0,0,0,0,0,1));
			} else if(itemChance < 60) {// 20% flare
				pickup_item(self, item.flare, choose(0,0,0,0,0,1), 11);
			} else if(itemChance < 75) {// 15% planks
				pickup_item(self, item.planks, choose(0,0,0,0,1,1));
			} else if(itemChance < 90) {// 15% metal
				pickup_item(self, item.metal, choose(0,0,0,0,1,1));
			} else if(itemChance < 95 && !weaponSpawned){// 5% crossbow by itself
				pickup_item(self, item.crossbow, 1, 11);
				weaponSpawned = true;
			} else if(itemChance < 100 && !weaponSpawned){//5% unknown map
				pickup_item(self, item.treasureMap, 1);
				weaponSpawned = true;
			}
		
			oversize++;
		}
	}
}