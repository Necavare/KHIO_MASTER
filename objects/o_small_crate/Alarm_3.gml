if(isCamp){
	
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
			} else if(itemChance < 45 && !weaponSpawned) { // 25% Tools/Knifes/Armor
				if(itemChance < 25) {// 5% knife
					pickup_item(self, choose(item.knife, item.poisonknife), 1, itemDur);
				} else if(itemChance < 30) {// 5% axe
					if(isShed)
						pickup_item(self, item.metalaxeS, 1, itemDur);	
					else
						pickup_item(self, item.boneaxeB, 1, itemDur);	
				} else if(itemChance < 35) {// 5% pic
					if(isShed)
						pickup_item(self, item.metalpicS, 1, itemDur);	
					else
						pickup_item(self, item.bonepicB, 1, itemDur);		
				} else if(itemChance < 40) {// 5% chest
					if(isShed)
						pickup_item(self, item.metalchest, 1, itemDur);	
					else
						pickup_item(self, item.leatherchest, 1, itemDur);	
				} else if(itemChance < 45) {// 5% head
					if(isShed)
						pickup_item(self, item.metalhead, 1, itemDur);	
					else
						pickup_item(self, item.leatherhead, 1, itemDur);	
				} 
				
				weaponSpawned = true;
			} else if(itemChance < 50) {// 5% flare
				if(isShed)
					pickup_item(self, item.flare, choose(0,0,0,1), 11);
				else
					pickup_item(self, item.lantern, choose(0,0,0,1), itemDur);
			} else if(itemChance < 55) {// 5% soup
				pickup_item(self, item.soup, 1);
			} else if(itemChance < 60) {// 5% lantern	
				if(isShed)
					pickup_item(self, item.lantern, choose(0,0,0,1), itemDur);
				else
					pickup_item(self, item.knife, choose(0,0,1), itemDur);
			} else if(itemChance < 75) {// 15% planks
				if(isShed)
					pickup_item(self, item.planks, choose(0,0,0,0,1,1));
				else
					pickup_item(self, item.metalspikes, choose(0,1));
			} else if(itemChance < 90) {// 15% metal
				if(isShed)
					pickup_item(self, item.metal, choose(0,0,0,0,1,1));
				else
					pickup_item(self, item.metalspikes, choose(0,1));
			} else if(itemChance < 95){// 5% ammo by itself
				if(isShed)
					pickup_item(self, item.buckshot, choose(1,1,1,2,2), 11);
				else
					pickup_item(self, item.rifleammo, choose(1,1,1,2,2), 11);
			} else if(itemChance < 100 && !weaponSpawned){//5% Gun
				if(isCamp && !isShed) {
					pickup_item(self, item.rifle, 1, 11);
					pickup_item(self, item.rifleammo, choose(1,1,1,2,2), 11);
				} else if(isShed) {
					pickup_item(self, item.shotgun, 1, 11);
					pickup_item(self, item.buckshot, choose(1,1,1,2,2), 11);
				}
					
				weaponSpawned = true;
			}
			
			oversize++;
		}
	}
	
	/*
	if(!global.keySpawned){
		pickup_item(self, item.keycard, 1, 11);
		global.keySpawned = true;
	}*/
	if(!isShed && oversize < 7) {
		if(global.clueSpawned < 4){
			if(global.clueSpawned == 0)
				pickup_item(self, 	item.clueone, 1, 11);
			if(global.clueSpawned == 1)
				pickup_item(self, item.cluetwo, 1, 11);
			if(global.clueSpawned == 2)
				pickup_item(self, item.cluethree, 1 , 11);
			if(global.clueSpawned == 3)
				pickup_item(self, item.cluefour, 1, 11);
				
			global.clueSpawned++;
		}
	}
}
else{
	isTargetable = true;
	alarm[6] = 60;
}