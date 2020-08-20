///@description Actually eating

if(isEating) {
	var food = o_hud.hotbarItems[# 0, o_hud.hotbarSlot];
	
	var hungerGained = 0;
	var staminaGained = 0;
	
	var healthGained = 0;
	var healthLost = 0;
	var maxHealthLost = 0;
	
	switch(food) {
		case item.berry: hungerGained = 10; healthGained = 5; break;
		case item.fungi: hungerGained = 5; healthLost = 10; break;
		case item.meat: hungerGained = 10; healthLost = 5; break
		case item.cookedmeat: hungerGained = 20; healthGained = 10; break;
		case item.human: hungerGained = 10; healthLost = 5; maxHealthLost = 2; break;
		case item.cookedhuman: hungerGained = 15; maxHealthLost = 1; break;
		case item.cookedfungi: hungerGained = 10; staminaGained = 20; healthGained = 5; break;
		case item.soup: hungerGained = 35; staminaGained = 50; healthGained = 10; break;
		case item.splint: o_player.isInjured = false; break;
		case item.bandage: o_player.isBleeding = false; healthGained = 5; break;
		case item.medkit: o_player.isBleeding = false; o_player.isInjured = false; healthGained = 15; break;
	}
	
	if((hungerGained != 0 && o_player.hunger_ < 100 - hungerGained) || (healthGained != 0 && o_player.health_ < 100 - healthGained)
	 || (staminaGained != 0 && o_player.stamina < 100 - staminaGained) || food == item.splint) {
		
		if(healthGained != 0 && o_player.health_ < 100 - healthGained)
			item_notification(0);
		if(hungerGained != 0 && o_player.hunger_ < 100 - hungerGained)
			item_notification(-1);
		if(staminaGained != 0 && o_player.stamina < 100 - staminaGained)
			item_notification(-2);
		 
		o_hud.showHotbar = true;
	
		 // Play eating sound
		 if(!audio_is_playing(sn_eating_1) && !audio_is_playing(sn_eating_2)) {
			switch(eatingSound) {
				case 0: audio_play_sound(sn_eating_1,0,0); break;
				case 1: audio_play_sound(sn_eating_2,0,0); break;
			} 
	
			if(eatingSound < 2)
				eatingSound++;
			else
				eatingSound = 0;
		}


		if(o_hud.hotbarCount[# 0, o_hud.hotbarSlot] > 0)
			o_hud.hotbarCount[# 0, o_hud.hotbarSlot]--;
			
		if(o_hud.hotbarCount[# 0, o_hud.hotbarSlot] <= 0) {
			o_hud.hotbarItems[# 0, o_hud.hotbarSlot] = 0;
			o_hud.hotbarDurability[# 0, o_hud.hotbarSlot] = -1;
			o_hud.hotbarSlot = -1;
		}
		
		// Adjusting health
		o_player.health_ += healthGained;
		o_player.health_ -= healthLost;
		
		if(o_player.maxHealth - maxHealthLost < 0)
			o_player.maxHealth = 1;
		else if(maxHealthLost > 0){
			o_player.maxHealth -= maxHealthLost;
			item_notification(-3);
		}
			
		// Adjusting hunger/stamina
		o_player.hunger_ += hungerGained;	
		o_player.stamina += staminaGained;
	} else 
		isEating = false;
	
	alarm[1] = 60;
}