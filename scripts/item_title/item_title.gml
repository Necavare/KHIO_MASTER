/// @description item_title()
/// @param item
/// @param amount
function item_title() {
	var item_ = argument[0];
	var count_ = argument[1];

	var startX = device_mouse_x_to_gui(0) + 14;
	var startY = device_mouse_y_to_gui(0) - 14;

	var item_name = "";
	var item_desc = "";

	var isAnvilrequired = false;

	if((global.isItemPicked) && (item_ == -1 || item_ == -2 || item_ == -3))
		startY += 32;
	else if(!global.isItemPicked && item_ == -1 && o_hud.equipItems[# 0, 0] != 0)
		startY += 32;
	else if(!global.isItemPicked && item_ == -2 && o_hud.equipItems[# 0, 1] != 0)
		startY += 32;

	if(item_ == -1)
		item_name = "Head";
	if(item_ == -2)
		item_name = "Body";
	if(item_ == -3)
		item_name = "Hands";
	if(item_ == -5)
		item_name = "Health";
	if(item_ == -6)
		item_name = "Hunger";
	if(item_ == -7)
		item_name = "Metal Wall";
	if(item_ == -8)
		item_name = "Crafting";
	if(item_ == -9)
		item_name = "Firepit";
	if(item_ == -10)
		item_name = "Bloomery";

	if(count_ <= 1 && item_ > 0) { // Singular
		if(item_ == 2) {
			item_name += "Stick";
		} if(item_ == 3) {
			item_name += "Grass";
		} if(item_ == 4) {
			item_name += "Berry";
			item_desc += "+10 Hunger | +5 Health";
		} if(item_ == 5) {
			item_name += "Fungi";
			item_desc += "+5 Hunger | -10 Health";	
		} if(item_ == 6) {
			item_name += "Lilly";
			item_desc += "A poisonous flower";
		} if(item_ == 7) {
			item_name += "Poison";
		} if(item_ == 8) {
			item_name += "Rock";
		} if(item_ == 9) {
			item_name += "Flint";
			item_desc += "Starts fires";
		} if(item_ == 10) {
			item_name += "Compound";	
			item_desc += "A rock containing metal and sulfur";
		} if(item_ == 11) {
			item_name += "Metal";
		} if(item_ == 12) {
			item_name += "Sulfur";
		} if(item_ == 13) {
			item_name += "Charcoal";
		} if(item_ == 14) {
			item_name += "Plank";
		} if(item_ == 15) {
			item_name += "Raw Meat";
			item_desc += "+10 Hunger | -5 Health";
		} if(item_ == 16) {
			item_name += "Cooked Meat";
			item_desc += "+20 Hunger | +10 Health";
		} if(item_ == 17) {
			item_name += "Fur Pelt";
		} if(item_ == 18) {
			item_name += "Bone";
		} if(item_ == 19) {
			item_name += "Rope";
		} if(item_ == 20) {
			item_name += "Gunpowder";
		} if(item_ == 21) {
			item_name += "Stone Axe";
			item_desc += "Low Damage and High Durability";
		} if(item_ == 22) {
			item_name += "Stone Axe";
			item_desc += "Low Damage and High Durability";
		} if(item_ == 23) {
			item_name += "Stone Pickaxe";
			item_desc += "Low Damage and High Durability";
		} if(item_ == 24) {
			item_name += "Stone Pickaxe";
			item_desc += "Low Damage and High Durability";
		} if(item_ == 25) {
			item_name += "Rifle";
			item_desc += "Long range";
		} if(item_ == 26) {
			item_name += "7.62 NATO";
			isAnvilrequired = true;
		} if(item_ == 27) {
			item_name += "Pump Shotgun";
			item_desc += "Close range";
		} if(item_ == 28) {
			item_name += "12 Gauge Buckshot";
			isAnvilrequired = true;
		} if(item_ == 29) {
			item_name += "Crossbow";
			item_desc += "Long range";
		} if(item_ == 30) {
			item_name += "Wooden Bolt";
		} if(item_ == 31) {
			item_name += "Poison Bolt";
		} if(item_ == 32) {
			item_name += "Flame Bolt";
		} if(item_ == 33) {
			item_name += "Torch";
			item_desc += "Set flame to the night";
		} if(item_ == 34) {
			item_name += "Lantern";
			item_desc += "Equip in your hotbar to light your surroundings";
			isAnvilrequired = true;
		} if(item_ == 35) {
			item_name += "Sword";
			isAnvilrequired = true;
		} if(item_ == 36) {
			item_name += "Poison Sword";
		} if(item_ == 37) {
			item_name += "Knife";
			isAnvilrequired = true;
		} if(item_ == 38) {
			item_name += "Poison Knife";
		} if(item_ == 39) {
			item_name += "Snare Trap";
			item_desc += "Critter trapper";
		} if(item_ == 40) {
			item_name += "Wood Wall";
			item_desc += "Defend your camp";
		} if(item_ == 41) {
			item_name += "Wood Door";
			item_desc += "Defend your camp";
		} if(item_ == 42) {
			item_name += "Wood Spikes";
			item_desc += "Defend your camp";
		} if(item_ == 43) {
			item_name += "Metal Spikes";
			item_desc += "Defend your camp";
			isAnvilrequired = true;
		} if(item_ == 44) {
			item_name += "Bedroll";
			item_desc += "Sleep the night away";
		} if(item_ == 45) {
			item_name += "Fire Pit";
		} if(item_ == 46) {
			item_name += "Marker";
		} if(item_ == 47) {
			item_name += "Anvil";
			item_desc += "Used for metal working";
		} if(item_ == 48) {
			item_name += "Small Crate";
		} if(item_ == 49) {
			item_name += "Large Crate";
			isAnvilrequired = true;
		} if(item_ == 50) {
			item_name += "Flare";
			item_desc += "Set flame to the night";
		} if(item_ == 51) {
			item_name += "Raw Human";
			item_desc += "+10 Hunger | -5 Health | -2 Max Health";
		} if(item_ == 52) {
			item_name += "Cooked Human";
			item_desc += "+10 Hunger | -1 Max Health";
		} if(item_ == 53) {
			item_name += "Wooden Chest Plate";
			item_desc += "Reduces damage and decreases stamina";
		} if(item_ == 54) {
			item_name += "Wooden Facemask";
			item_desc += "Reduces damage and decreases stamina";
		} if(item_ == 55) {
			item_name += "Metal Chest Plate";
			item_desc += "Reduces damage significantly and decreases stamina";
			isAnvilrequired = true;
		} if(item_ == 56) {
			item_name += "Metal Facemask";
			item_desc += "Reduces damage significantly and decreases stamina";
			isAnvilrequired = true;
		} if(item_ == 57) {
			item_name += "Splint";
			item_desc += "Heals broken bones";
		} if(item_ == 58) {
			item_name += "Bandage";
			item_desc += "Stops the bleeding | +5 Health";
		} if(item_ == 59) {
			item_name += "Metal Axe";
			item_desc += "High Damage and High Durability";
			isAnvilrequired = true;
		} if(item_ == 60) {
			item_name += "Metal Axe";
			item_desc += "High Damage and High Durability";
			isAnvilrequired = true;
		} if(item_ == 61) {
			item_name += "Metal Pickaxe";
			item_desc += "High Damage and High Durability";
			isAnvilrequired = true;
		} if(item_ == 62) {
			item_name += "Metal Pickaxe";
			item_desc += "High Damage and High Durability";
			isAnvilrequired = true;
		} if(item_ == 63) {
			item_name += "Sack";
			item_desc += "Equip in your hotbar to haul logs";
		} if(item_ == 64) {
			item_name += "Bone Axe";
			item_desc += "High Damage and Low Durability";
		} if(item_ == 65) {
			item_name += "Bone Axe";
			item_desc += "High Damage and Low Durability";
		} if(item_ == 66) {
			item_name += "Bone Pickaxe";
			item_desc += "High Damage and Low Durability";
		} if(item_ == 67) {
			item_name += "Bone Pickaxe";	
			item_desc += "High Damage and Low Durability";
		} if(item_ == 68) {
			item_name += "Bone Club";
			item_desc += "";
		} if(item_ == 69) {
			item_name += "Bone Club";
			item_desc += "";
		} if(item_ == 70) {
			item_name += "Bone Bolt";
			item_desc += "";
		} if(item_ == 71) {
			item_name += "Stone Bolt";
			item_desc += "";
		} if(item_ == 72) {
			item_name += "Metal Bolt";
			item_desc += "";
			isAnvilrequired = true;
		} if(item_ == 73) {
			item_name += "Cooked Fungi";
			item_desc += "+10 Hunger | +20 Stamina | +5 Health";
		} if(item_ == 74) {
			item_name += "Rotten Food";
			item_desc += "No nutritional value";
		} if(item_ == 75) {
			item_name += "Medkit";
			item_desc += "Stops the bleeding and heals broken bones | +15 Health";
		} if(item_ == 76) {
			item_name += "Poison Bone Bolt";
			item_desc += "";
		} if(item_ == 77) {
			item_name += "Poison Stone Bolt";
			item_desc += "";
		} if(item_ == 78) {
			item_name += "Poison Metal Bolt";
			item_desc += "";
		} if(item_ == 79) {
			item_name += "Enemy Map";
			item_desc += "Find the location of enemy camps";
		} if(item_ == 80) {
			item_name += "Leather Chest Plate";
			item_desc += "Reduces damage";
		} if(item_ == 81) {
			item_name += "Leather Facemask";
			item_desc += "Reduces damage";
		} if(item_ == 82) {
			item_name += "Keycard";
		} if(item_ == 83) {
			item_name += "Journal";
			if(global.journalKey && !global.journalKeyFound)
				item_desc += "[] Find the key";
			else if(global.journalKey && global.journalKeyFound)
				item_desc += "[X] Find the key";
			else if(global.journalGate && !global.journalGateFound)
				item_desc += "[] Find the gate";
			else if(global.journalGate && global.journalGateFound)
				item_desc += "[X] Find the gate";
		} if(item_ == 84) {
			item_name += "Survival Guide";
			item_desc += "1. Start a fire by moving logs into a firepit";
		} if(item_ == 85) {
			item_name += "Grenade";
			item_desc += "Damage multiple hostiles at once";
		} if(item_ == 86) {
			item_name += "Chicken Noodle Soup";
			item_desc += "+35 Hunger | +50 Stamina | +10 Health";
		} if(item_ == 87) {
			item_name += "Clue";
			item_desc += global.clue1;
		} if(item_ == 88) {
			item_name += "Clue";
			item_desc += global.clue2;
		} if(item_ == 89) {
			item_name += "Clue";
			item_desc += global.clue3;
		} if(item_ == 90) {
			item_name += "Clue";
			item_desc += global.clue4;
		} if(item_ == 91) {
			item_name += "Stone Shovel";
			item_desc += "Dig up the snow!";
		} if(item_ == 92) {
			item_name += "Stone Shovel";
			item_desc += "Dig up the snow!";
		} if(item_ == 93) {
			item_name += "Metal Shovel";
			item_desc += "Dig up the snow!";
		} if(item_ == 94) {
			item_name += "Metal Shovel";
			item_desc += "Dig up the snow!";
		} if(item_ == 95) {
			item_name += "Unknown Map";
			item_desc += "Find the location of buried loot";
		} if(item_ == 96) {
			item_name += "Snow ball";
			item_desc += "Throw it at your enemies";
		} 
	} else {
		if(item_ == 2) {
			item_name += "Sticks";
		} if(item_ == 3) {
			item_name += "Grass";
		} if(item_ == 4) {
			item_name += "Berries";
			item_desc += "+10 Hunger | +5 Health";
		} if(item_ == 5) {
			item_name += "Fungi";	
			item_desc += "+5 Hunger | -10 Health";
		} if(item_ == 6) {
			item_name += "Lilly";
			item_desc += "A poisonous flower";
		} if(item_ == 7) {
			item_name += "Poison";
		} if(item_ == 8) {
			item_name += "Rocks";
		} if(item_ == 9) {
			item_name += "Flint";
			item_desc += "Starts fires";
		} if(item_ == 10) {
			item_name += "Compound";	
			item_desc += "A rock containing metal and sulfur";
		} if(item_ == 11) {
			item_name += "Metal";
		} if(item_ == 12) {
			item_name += "Sulfur";
		} if(item_ == 13) {
			item_name += "Charcoal";
		} if(item_ == 14) {
			item_name += "Planks";
		} if(item_ == 15) {
			item_name += "Raw Meat";
			item_desc += "+10 Hunger | -5 Health";
		} if(item_ == 16) {
			item_name += "Cooked Meat";
			item_desc += "+20 Hunger | +10 Health";
		} if(item_ == 17) {
			item_name += "Fur Pelt";
		} if(item_ == 18) {
			item_name += "Bones";
		} if(item_ == 19) {
			item_name += "Rope";
		} if(item_ == 20) {
			item_name += "Gunpowder";
		} if(item_ == 21) {
			item_name += "Stone Axe";
			item_desc += "Low Damage and High Durability";
		} if(item_ == 22) {
			item_name += "Stone Axe";
			item_desc += "Low Damage and High Durability";
		} if(item_ == 23) {
			item_name += "Stone Pickaxe";
			item_desc += "Low Damage and High Durability";
		} if(item_ == 24) {
			item_name += "Stone Pickaxe";
			item_desc += "Low Damage and High Durability";
		} if(item_ == 25) {
			item_name += "Rifle";
			item_desc += "Long range";
		} if(item_ == 26) {
			item_name += "7.62 NATO";
			isAnvilrequired = true;
		} if(item_ == 27) {
			item_name += "Pump Shotgun";
			item_desc += "Close range";
		} if(item_ == 28) {
			item_name += "12 Gauge Buckshot";
			isAnvilrequired = true;
		} if(item_ == 29) {
			item_name += "Crossbow";
			item_desc += "Long range";
		} if(item_ == 30) {
			item_name += "Wooden Bolts";
		} if(item_ == 31) {
			item_name += "Poison Bolts";
		} if(item_ == 32) {
			item_name += "Flame Bolts";
		} if(item_ == 33) {
			item_name += "Torch";
			item_desc += "Set flame to the night";
		} if(item_ == 34) {
			item_name += "Lantern";
			item_desc += "Equip in your hotbar to light your surroundings";
			isAnvilrequired = true;
		} if(item_ == 35) {
			item_name += "Sword";
			isAnvilrequired = true;
		} if(item_ == 36) {
			item_name += "Poison Sword";
		} if(item_ == 37) {
			item_name += "Knife";
			isAnvilrequired = true;
		} if(item_ == 38) {
			item_name += "Poison Knife";
		} if(item_ == 39) {
			item_name += "Snare Traps";
			item_desc += "Critter trapper";
		} if(item_ == 40) {
			item_name += "Wood Wall";
			item_desc += "Defend your camp";
		} if(item_ == 41) {
			item_name += "Wood Door";
			item_desc += "Defend your camp";
		} if(item_ == 42) {
			item_name += "Wood Spikes";
			item_desc += "Defend your camp";
		} if(item_ == 43) {
			item_name += "Metal Spikes";
			item_desc += "Defend your camp";
			isAnvilrequired = true;
		} if(item_ == 44) {
			item_name += "Bedroll";
			item_desc += "Sleep the night away";
		} if(item_ == 45) {
			item_name += "Fire Pit";
		} if(item_ == 46) {
			item_name += "Markers";
		} if(item_ == 47) {
			item_name += "Anvil";
			item_desc += "Used for metal working";
		} if(item_ == 48) {
			item_name += "Small Crate";
		} if(item_ == 49) {
			item_name += "Large Crate";
			isAnvilrequired = true;
		} if(item_ == 50) {
			item_name += "Flares";
			item_desc += "Set flame to the night";
		} if(item_ == 51) {
			item_name += "Raw Human";
			item_desc += "+10 Hunger | -5 Health | -2 Max Health";
		} if(item_ == 52) {
			item_name += "Cooked Human";
			item_desc += "+10 Hunger | -1 Max Health";
		} if(item_ == 53) {
			item_name += "Wooden Chest Plate";
			item_desc += "Reduces damage and decreases stamina";
		} if(item_ == 54) {
			item_name += "Wooden Facemask";
			item_desc += "Reduces damage and decreases stamina";
		} if(item_ == 55) {
			item_name += "Metal Chest Plate";
			item_desc += "Reduces damage significantly and decreases stamina";
			isAnvilrequired = true;
		} if(item_ == 56) {
			item_name += "Metal Facemask";
			item_desc += "Reduces damage significantly and decreases stamina";
			isAnvilrequired = true;
		} if(item_ == 57) {
			item_name += "Splint";
			item_desc += "Heals broken bones";
		} if(item_ == 58) {
			item_name += "Bandages";
			item_desc += "Stops the bleeding | +5 Health";
		} if(item_ == 59) {
			item_name += "Metal Axe";
			item_desc += "High Damage and High Durability";
			isAnvilrequired = true;
		} if(item_ == 60) {
			item_name += "Metal Axe";
			item_desc += "High Damage and High Durability";
			isAnvilrequired = true;
		} if(item_ == 61) {
			item_name += "Metal Pickaxe";
			item_desc += "High Damage and High Durability";
			isAnvilrequired = true;
		} if(item_ == 62) {
			item_name += "Metal Pickaxe";
			item_desc += "High Damage and High Durability";
			isAnvilrequired = true;
		} if(item_ == 63) {
			item_name += "Sack";
			item_desc += "Equip in your hotbar to haul logs";
		} if(item_ == 64) {
			item_name += "Bone Axe";
			item_desc += "High Damage and Low Durability";
		} if(item_ == 65) {
			item_name += "Bone Axe";
			item_desc += "High Damage and Low Durability";
		} if(item_ == 66) {
			item_name += "Bone Pickaxe";
			item_desc += "High Damage and Low Durability";
		} if(item_ == 67) {
			item_name += "Bone Pickaxe";	
			item_desc += "High Damage and Low Durability";
		} if(item_ == 68) {
			item_name += "Bone Club";
			item_desc += "";
		} if(item_ == 69) {
			item_name += "Bone Club";
			item_desc += "";
		} if(item_ == 70) {
			item_name += "Bone Bolts";
			item_desc += "";
		} if(item_ == 71) {
			item_name += "Stone Bolts";
			item_desc += "";
		} if(item_ == 72) {
			item_name += "Metal Bolts";
			item_desc += "";
			isAnvilrequired = true;
		} if(item_ == 73) {
			item_name += "Cooked Fungi";
			item_desc += "+10 Hunger | +20 Stamina | +5 Health";
		} if(item_ == 74) {
			item_name += "Rotten Food";
			item_desc += "No nutritional value";
		} if(item_ == 75) {
			item_name += "Medkit";
			item_desc += "Stops the bleeding and heals broken bones | +15 Health";
		} if(item_ == 76) {
			item_name += "Poison Bone Bolts";
			item_desc += "";
		} if(item_ == 77) {
			item_name += "Poison Stone Bolts";
			item_desc += "";
		} if(item_ == 78) {
			item_name += "Poison Metal Bolts";
			item_desc += "";
		} if(item_ == 79) {
			item_name += "Enemy Map";
			item_desc += "Find the location of enemy camps";
		} if(item_ == 80) {
			item_name += "Leather Chest Plate";
			item_desc += "Reduces damage";
		} if(item_ == 81) {
			item_name += "Leather Facemask";
			item_desc += "Reduces damage";
		} if(item_ == 82) {
			item_name += "Keycard";
		} if(item_ == 83) {
			item_name += "Journal";
			if(global.journalKey && !global.journalKeyFound)
				item_desc += "[] Find the key";
			else if(global.journalKey && global.journalKeyFound)
				item_desc += "[X] Find the key";
			else if(global.journalGate && !global.journalGateFound)
				item_desc += "[] Find the gate";
			else if(global.journalGate && global.journalGateFound)
				item_desc += "[X] Find the gate";
		} if(item_ == 84) {
			item_name += "Survival Guide";
			item_desc += "1. Start a fire by moving logs into a firepit";
		} if(item_ == 85) {
			item_name += "Grenades";
			item_desc += "Damage multiple hostiles at once";
		} if(item_ == 86) {
			item_name += "Chicken Noodle Soup";
			item_desc += "+35 Hunger | +50 Stamina | +10 Health";
		} if(item_ == 87) {
			item_name += "Clue";
			item_desc += global.clue1;
		} if(item_ == 88) {
			item_name += "Clue";
			item_desc += global.clue2;
		} if(item_ == 89) {
			item_name += "Clue";
			item_desc += global.clue3;
		} if(item_ == 90) {
			item_name += "Clue";
			item_desc += global.clue4;
		} if(item_ == 91) {
			item_name += "Stone Shovel";
			item_desc += "Dig up the snow!";
		} if(item_ == 92) {
			item_name += "Stone Shovel";
			item_desc += "Dig up the snow!";
		} if(item_ == 93) {
			item_name += "Metal Shovel";
			item_desc += "Dig up the snow!";
		} if(item_ == 94) {
			item_name += "Metal Shovel";
			item_desc += "Dig up the snow!";
		} if(item_ == 95) {
			item_name += "Unknown Map";
			item_desc += "Find the location of buried loot";
		} if(item_ == 96) {
			item_name += "Snow balls";
			item_desc += "Throw them at your enemies";
		} 
	}
	
#region Drawing

	var outBoxCol = $333128;
	var inBoxCol = c_white;

	// Setting font, color, and position
	draw_set_font(f_hud);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color($333128);

	// Outer rectangle
	draw_rectangle_color(startX-3, startY+1, startX + string_width(item_name) + 6, startY + string_height(item_name), outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);
	// Inner rectangle
	draw_rectangle_color(startX, startY+4, startX + string_width(item_name) + 3, startY + string_height(item_name) - 3, inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);
	// Text
	draw_text_transformed(startX+3, startY+1, item_name, 1, 1, 0);

	// Drawing icons
	if(isAnvilrequired) {
		var xx = startX+9.5;
		var yy = startY-6;
	
		if(o_hud.typer)
			draw_sprite_ext(s_icons, 0,xx,yy, 3, 3, 0, image_blend, 1);
		else
			draw_sprite_ext(s_icons, 3,xx,yy, 3, 3, 0, image_blend, 1);
	}

	// Number
	if(item_ >= -3 && count_ > 1) {
		// Outer rectangle
		draw_rectangle_color(startX-3, startY-27, startX + string_width(string(count_))+6, startY-3, outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);
		// Inner rectangle
		draw_rectangle_color(startX, startY-24, startX + string_width(string(count_))+3, startY-6, inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);
		// Count
		draw_text(startX+3, startY-27, string(count_));
	} else if(item_ < -3 && count_ > 0) { // Drawing durability for stats
		// Outer rectangle
		draw_rectangle_color(startX-3, startY-27, startX + string_width(string(count_))+6, startY-3, outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);
		// Inner rectangle
		draw_rectangle_color(startX, startY-24, startX + string_width(string(count_))+3, startY-6, inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);
		// Count
		draw_text(startX+3, startY-27, string(count_));
	} 

	if((o_hud.showDescription || item_ == item.journal) && item_desc != "" && !global.isItemPicked) { // Drawing item descriptions
		startY += 29;
	
		// Outer rectangle
		draw_rectangle_color(startX-3, startY+1, startX + string_width(item_desc) + 6, startY + string_height(item_desc), outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);
		// Inner rectangle
		draw_rectangle_color(startX, startY+4, startX + string_width(item_desc) + 3, startY + string_height(item_desc) - 3, inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);
		// Text
		draw_text_transformed(startX+3, startY+1, item_desc, 1, 1, 0);
	
		if(item_ == item.journal && global.journalGate && !global.journalGateFound && global.journalKey) {
			startY += 29;
			var text = "[] Find the gate";
		
			// Outer rectangle
			draw_rectangle_color(startX-3, startY+1, startX + string_width(text) + 6, startY + string_height(text), outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);
			// Inner rectangle
			draw_rectangle_color(startX, startY+4, startX + string_width(text) + 3, startY + string_height(text) - 3, inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);
			// Text
			draw_text_transformed(startX+3, startY+1, text, 1, 1, 0);
		} else if(item_ == item.journal && global.journalGate && global.journalGateFound && global.journalKey) {
			startY += 29;
			var text = "[X] Find the gate";
		
			// Outer rectangle
			draw_rectangle_color(startX-3, startY+1, startX + string_width(text) + 6, startY + string_height(text), outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);
			// Inner rectangle
			draw_rectangle_color(startX, startY+4, startX + string_width(text) + 3, startY + string_height(text) - 3, inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);
			// Text
			draw_text_transformed(startX+3, startY+1, text, 1, 1, 0);
		}
	
		if(item_ == item.journal && global.journalGate && global.journalGateFound && global.journalKey && global.journalKeyFound && global.compoundEntered) {
			startY += 29;
			var text = "[] To Be Continued... (enter the bunker)";
		
			// Outer rectangle
			draw_rectangle_color(startX-3, startY+1, startX + string_width(text) + 6, startY + string_height(text), outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);
			// Inner rectangle
			draw_rectangle_color(startX, startY+4, startX + string_width(text) + 3, startY + string_height(text) - 3, inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);
			// Text
			draw_text_transformed(startX+3, startY+1, text, 1, 1, 0);
		}
	
		if(item_ == item.guide) {
			startY += 29;
			var text = "2. Cook food by placing it inside of the fire.";
		
			// Outer rectangle
			draw_rectangle_color(startX-3, startY+1, startX + string_width(text) + 6, startY + string_height(text), outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);
			// Inner rectangle
			draw_rectangle_color(startX, startY+4, startX + string_width(text) + 3, startY + string_height(text) - 3, inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);
			// Text
			draw_text_transformed(startX+3, startY+1, text, 1, 1, 0);
			startY += 29;
		
			var text = "3. Place buildables by moving them to your hot bar.";
		
			// Outer rectangle
			draw_rectangle_color(startX-3, startY+1, startX + string_width(text) + 6, startY + string_height(text), outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);
			// Inner rectangle
			draw_rectangle_color(startX, startY+4, startX + string_width(text) + 3, startY + string_height(text) - 3, inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);
			// Text
			draw_text_transformed(startX+3, startY+1, text, 1, 1, 0);
		}
	
	} 

	// Resetting font
	draw_set_font(f_hud);

#endregion


}
