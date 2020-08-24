function recipe_title() {
	var item_ = argument[0];

	var xx = device_mouse_x_to_gui(0) + 14;
	var yy = device_mouse_y_to_gui(0) - 14 + 29;

	var outBoxCol = $333128;
	var inBoxCol = c_white;

	var item1 = 0;
	var item_name = "";
	var item_count = 0;
	var countCheck = -1;

	var item2 = 0;
	var item_name2 = "";
	var item_count2 = 0;
	var countCheck2 = -1;

	var item3 = 0;
	var item_name3 = "";
	var item_count3 = 0;
	var countCheck3 = -1;

	if(item_ == "metalWall") {
		item_name += "Metal";
		item_count = 4;
		countCheck = check_inventory(item.metal, 4, -1);
		item1 = item.metal;
	} else if(item_ == item.poison) {
		item_name += "Lilly";
		item_count = 1;
		countCheck = check_inventory(item.lilly, item_count, -1);
		item1 = item.lilly;
	} else if(item_ == item.rope) {
		item_name += "Grass";
		item_count = 4;
		countCheck = check_inventory(item.grass, item_count, -1);
		item1 = item.grass;
	} else if(item_ == item.gunpowder) {
		item_name += "Sulfur";
		item_count = 2;
		countCheck = check_inventory(item.sulfur, item_count, -1);
		item1 = item.sulfur;
		item_name2 += "Charcoal";
		item_count2 = 1;
		countCheck2 = check_inventory(item.charcoal, item_count2, -1);
		item2 = item.charcoal;
	} else if(item_ == item.stoneShovelB || item_ == item.stoneShovelS) {
		item_name += "Stick";
		item_count = 1;
		countCheck = check_inventory(item.stick, item_count, -1);
		item1 = item.stick;
		item_name2 += "Grass";
		item_count2 = 4;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
		item_name3 += "Rock";
		item_count3 = 1;
		countCheck3 = check_inventory(item.rock, item_count3, -1);
		item3 = item.rock;
	} else if(item_ == item.stoneaxeB || item_ == item.stoneaxeS) {
		item_name += "Stick";
		item_count = 1;
		countCheck = check_inventory(item.stick, item_count, -1);
		item1 = item.stick;
		item_name2 += "Grass";
		item_count2 = 4;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
		item_name3 += "Rock";
		item_count3 = 1;
		countCheck3 = check_inventory(item.rock, item_count3, -1);
		item3 = item.rock;
	} else if(item_ == item.stonepicS || item_ == item.stonepicB) {
		item_name += "Stick";
		item_count = 1;
		countCheck = check_inventory(item.stick, item_count, -1);
		item1 = item.stick;
		item_name2 += "Grass";
		item_count2 = 4;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
		item_name3 += "Rock";
		item_count3 = 1;
		countCheck3 = check_inventory(item.rock, item_count3, -1);
		item3 = item.rock;
	} else if(item_ == item.bolt) {
		item_name += "Stick";
		item_count = 1;
		countCheck = check_inventory(item.stick, item_count, -1);
		item1 = item.stick;
	} else if(item_ == item.flamebolt) {
		item_name += "Wooden Bolt";
		item_count = 1;
		countCheck = check_inventory(item.bolt, item_count, -1);
		item1 = item.bolt;
		item_name2 += "Flare";
		item_count2 = 1;
		countCheck2 = check_inventory(item.flare, item_count2, -1);
		item2 = item.flare;
	} else if(item_ == item.poisonbolt) {
		item_name += "Wooden Bolt";
		item_count = 1;
		countCheck = check_inventory(item.bolt, item_count, -1);
		item1 = item.bolt;
		item_name2 += "Poison";
		item_count2 = 1;
		countCheck2 = check_inventory(item.poison, item_count2, -1);
		item2 = item.poison;
	} else if(item_ == item.rifleammo) {
		item_name += "Metal";
		item_count = 1;
		countCheck = check_inventory(item.metal, item_count, -1);
		item1 = item.metal;
		item_name2 += "Gunpowder";
		item_count2 = 1;
		countCheck2 = check_inventory(item.gunpowder, item_count2, -1);
		item2 = item.gunpowder;
	} else if(item_ == item.buckshot) {
		item_name += "Metal";
		item_count = 2;
		countCheck = check_inventory(item.metal, item_count, -1);
		item1 = item.metal;
		item_name2 += "Gunpowder";
		item_count2 = 2;
		countCheck2 = check_inventory(item.gunpowder, item_count2, -1);
		item2 = item.gunpowder;
	} else if(item_ == item.torch) { // Torch
		item_name += "Stick";
		item_count = 1;
		countCheck = check_inventory(item.stick, item_count, -1);
		item1 = item.stick;
		item_name2 += "Grass";
		item_count2 = 4;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
	} else if(item_ == item.lantern) { // Lantern
		item_name += "Metal";
		item_count = 8;
		countCheck = check_inventory(item.metal, item_count, -1);
		item1 = item.metal;
		item_name2 += "Grass";
		item_count2 = 4;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
	} else if(item_ == item.sword) {
		item_name += "Metal";
		item_count = 8;
		countCheck = check_inventory(item.metal, item_count, -1);
		item1 = item.metal;
		item_name2 += "Metal";
		item_count2 = 8;
		countCheck2 = check_inventory(item.metal, item_count2, -1);
		item2 = item.metal;
		item_name3 += "Fur Pelts";
		item_count3 = 2;
		countCheck3 = check_inventory(item.furpelt, item_count3, -1);
		item3 = item.grass;
	} else if(item_ == item.poisonsword) {
		item_name += "Sword";
		item_count = 1;
		countCheck = check_inventory(item.sword, item_count, -1);
		item1 = item.sword;
		item_name2 += "Poison";
		item_count2 = 1;
		countCheck2 = check_inventory(item.poison, item_count2, -1);
		item2 = item.poison;
	} else if(item_ == item.knife) {
		item_name += "Metal";
		item_count = 8;
		countCheck = check_inventory(item.metal, item_count, -1);
		item1 = item.metal;
		item_name2 += "Fur Pelts";
		item_count2 = 1;
		countCheck2 = check_inventory(item.furpelt, item_count2, -1);
		item2 = item.grass;
	} else if(item_ == item.poisonknife) {
		item_name += "Knife";
		item_count = 1;
		countCheck = check_inventory(item.knife, item_count, -1);
		item1 = item.knife;
		item_name2 += "Poison";
		item_count2 = 1;
		countCheck2 = check_inventory(item.poison, item_count2, -1);
		item2 = item.poison;
	} else if(item_ == item.snaretrap) {
		item_name += "Stick";
		item_count = 1;
		countCheck = check_inventory(item.stick, item_count, -1);
		item1 = item.stick;
		item_name2 += "Grass";
		item_count2 = 4;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
		item_name3 += "Berry";
		item_count3 = 1;
		countCheck3 = check_inventory(item.berry, item_count3, -1);
		item3 = item.berry;
	} else if(item_ == item.wall) {
		item_name += "Sticks";
		item_count = 4;
		countCheck = check_inventory(item.stick, item_count, -1);
		item1 = item.stick;
	} else if(item_ == item.door) {
		item_name += "Planks";
		item_count = 6;
		countCheck = check_inventory(item.planks, item_count, -1);
		item1 = item.planks;
		item_name2 += "Grass";
		item_count2 = 4;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
	} else if(item_ == item.woodspikes) {
		item_name += "Sticks";
		item_count = 6;
		countCheck = check_inventory(item.stick, item_count, -1);
		item1 = item.stick;
	} else if(item_ == item.metalspikes) {
		item_name += "Metal";
		item_count = 6;
		countCheck = check_inventory(item.metal, item_count, -1);
		item1 = item.metal;
	} else if(item_ == item.bedroll) {
		item_name += "Fur Pelts";
		item_count = 8;
		countCheck = check_inventory(item.furpelt, item_count, -1);
		item1 = item.furpelt;
		item_name2 += "Grass";
		item_count2 = 8;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
	} else if(item_ == item.firepit) {
		item_name += "Sticks";
		item_count = 4;
		countCheck = check_inventory(item.stick, item_count, -1);
		item1 = item.stick;
		item_name2 += "Rocks";
		item_count2 = 8;
		countCheck2 = check_inventory(item.rock, item_count2, -1);
		item2 = item.rock;
	} else if(item_ == item.marker) {
		item_name += "Sticks";
		item_count = 2;
		countCheck = check_inventory(item.stick, item_count, -1);
		item1 = item.stick;
		item_name2 += "Grass";
		item_count2 = 8;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
	} else if(item_ == item.smallcrate) {
		item_name += "Planks";
		item_count = 6;
		countCheck = check_inventory(item.planks, item_count, -1);
		item1 = item.planks;
		item_name2 += "Grass";
		item_count2 = 8;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
	} else if(item_ == item.largecrate) {
		item_name += "Planks";
		item_count = 8;
		countCheck = check_inventory(item.planks, item_count, -1);
		item1 = item.planks;
		item_name2 += "Metal";
		item_count2 = 6;
		countCheck2 = check_inventory(item.metal, item_count2, -1);
		item2 = item.metal;
		item_name3 += "Grass";
		item_count3 = 8;
		countCheck3 = check_inventory(item.grass, item_count2, -1);
		item3 = item.grass;
	} else if(item_ == item.woodenhead) {
		item_name += "Planks";
		item_count = 3;
		countCheck = check_inventory(item.planks, item_count, -1);
		item1 = item.planks;
		item_name2 += "Grass";
		item_count2 = 8;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
	} else if(item_ == item.woodenchest) {
		item_name += "Planks";
		item_count = 6;
		countCheck = check_inventory(item.planks, item_count, -1);
		item1 = item.planks;
		item_name2 += "Grass";
		item_count2 = 8;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
	} else if(item_ == item.metalhead) {
		item_name += "Metal";
		item_count = 4;
		countCheck = check_inventory(item.metal, item_count, -1);
		item1 = item.metal;
		item_name2 += "Grass";
		item_count2 = 8;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
	} else if(item_ == item.metalchest) {
		item_name += "Metal";
		item_count = 8;
		countCheck = check_inventory(item.metal, item_count, -1);
		item1 = item.metal;
		item_name2 += "Grass";
		item_count2 = 8;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
	} else if(item_ == item.splint) {
		item_name += "Planks";
		item_count = 1;
		countCheck = check_inventory(item.planks, item_count, -1);
		item1 = item.planks;
		item_name2 += "Grass";
		item_count2 = 8;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
	} else if(item_ == item.bandage) {
		item_name += "Grass";
		item_count = 5;
		countCheck = check_inventory(item.grass, item_count, -1);
		item1 = item.grass;
	} else if(item_ == item.metalShovelB || item_ == item.metalShovelS) {
		item_name += "Stick";
		item_count = 1;
		countCheck = check_inventory(item.stick, item_count, -1);
		item1 = item.stick;
		item_name2 += "Fur Pelts";
		item_count2 = 2;
		countCheck2 = check_inventory(item.furpelt, item_count2, -1);
		item2 = item.grass;
		item_name3 += "Metal";
		item_count3 = 8;
		countCheck3 = check_inventory(item.metal, item_count3, -1);
		item3 = item.metal;
	} else if(item_ == item.metalaxeB || item_ == item.metalaxeS) {
		item_name += "Stick";
		item_count = 1;
		countCheck = check_inventory(item.stick, item_count, -1);
		item1 = item.stick;
		item_name2 += "Fur Pelts";
		item_count2 = 2;
		countCheck2 = check_inventory(item.furpelt, item_count2, -1);
		item2 = item.furpelt;
		item_name3 += "Metal";
		item_count3 = 6;
		countCheck3 = check_inventory(item.metal, item_count3, -1);
		item3 = item.metal;
	} else if(item_ == item.metalpicB || item_ == item.metalpicS) {
		item_name += "Stick";
		item_count = 1;
		countCheck = check_inventory(item.stick, item_count, -1);
		item1 = item.stick;
		item_name2 += "Fur Pelts";
		item_count2 = 2;
		countCheck2 = check_inventory(item.furpelt, item_count2, -1);
		item2 = item.furpelt;
		item_name3 += "Metal";
		item_count3 = 8;
		countCheck3 = check_inventory(item.metal, item_count3, -1);
		item3 = item.metal;
	} else if(item_ == item.sack) {
		item_name += "Fur Pelts";
		item_count = 8;
		countCheck = check_inventory(item.furpelt, item_count, -1);
		item1 = item.furpelt;
		item_name2 += "Grass";
		item_count2 = 8;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
		item_name3 += "Grass";
		item_count3 = 8;
		countCheck3 = check_inventory(item.grass, item_count3, -1);
		item3 = item.grass;
	} else if(item_ == item.boneaxeB || item_ == item.boneaxeS) {
		item_name += "Stick";
		item_count = 1;
		countCheck = check_inventory(item.stick, item_count, -1);
		item1 = item.stick;
		item_name2 += "Grass";
		item_count2 = 4;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
		item_name3 += "Bone";
		item_count3 = 6;
		countCheck3 = check_inventory(item.bones, item_count3, -1);
		item3 = item.bones;
	} else if(item_ == item.bonepicB || item_ == item.bonepicS) {
		item_name += "Stick";
		item_count = 1;
		countCheck = check_inventory(item.stick, item_count, -1);
		item1 = item.stick;
		item_name2 += "Grass";
		item_count2 = 4;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
		item_name3 += "Bone";
		item_count3 = 8;
		countCheck3 = check_inventory(item.bones, item_count3, -1);
		item3 = item.bones;
	} else if(item_ == item.boneclubB || item_ == item.boneclubS) {
		item_name += "Stick";
		item_count = 2;
		countCheck = check_inventory(item.stick, item_count, -1);
		item1 = item.stick;
		item_name2 += "Grass";
		item_count2 = 4;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
		item_name3 += "Bone";
		item_count3 = 8;
		countCheck3 = check_inventory(item.bones, item_count3, -1);
		item3 = item.bones;
	} else if(item_ == item.bonebolt) {
		item_name += "Bolt";
		item_count = 1;
		countCheck = check_inventory(item.bolt, item_count, -1);
		item1 = item.bolt;
		item_name2 += "Bone";
		item_count2 = 1;
		countCheck2 = check_inventory(item.bones, item_count2, -1);
		item2 = item.bones;
	} else if(item_ == item.flintbolt) {
		item_name += "Bolt";
		item_count = 1;
		countCheck = check_inventory(item.bolt, item_count, -1);
		item1 = item.bolt;
		item_name2 += "Flint";
		item_count2 = 1;
		countCheck2 = check_inventory(item.flint, item_count2, -1);
		item2 = item.flint;
	} else if(item_ == item.metalbolt) {
		item_name += "Bolt";
		item_count = 1;
		countCheck = check_inventory(item.bolt, item_count, -1);
		item1 = item.bolt;
		item_name2 += "Metal";
		item_count2 = 1;
		countCheck2 = check_inventory(item.metal, item_count2, -1);
		item2 = item.metal;
	} else if(item_ == item.poisonbonebolt) {
		item_name += "Bone Bolt";
		item_count = 1;
		countCheck = check_inventory(item.bonebolt, item_count, -1);
		item1 = item.bonebolt;
		item_name2 += "Poison";
		item_count2 = 1;
		countCheck2 = check_inventory(item.poison, item_count2, -1);
		item2 = item.poison;
	} else if(item_ == item.poisonflintbolt) {
		item_name += "Flint Bolt";
		item_count = 1;
		countCheck = check_inventory(item.flintbolt, item_count, -1);
		item1 = item.flintbolt;
		item_name2 += "Poison";
		item_count2 = 1;
		countCheck2 = check_inventory(item.poison, item_count2, -1);
		item2 = item.poison;
	} else if(item_ == item.poisonmetalbolt) {
		item_name += "Metal Bolt";
		item_count = 1;
		countCheck = check_inventory(item.metalbolt, item_count, -1);
		item1 = item.metalbolt;
		item_name2 += "Poison";
		item_count2 = 1;
		countCheck2 = check_inventory(item.poison, item_count2, -1);
		item2 = item.poison;
	} else if(item_ == item.leatherhead) {
		item_name += "Fur Pelts";
		item_count = 6;
		countCheck = check_inventory(item.furpelt, item_count, -1);
		item1 = item.furpelt;
		item_name2 += "Grass";
		item_count2 = 8;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
	} else if(item_ == item.leatherchest) {
		item_name += "Fur Pelts";
		item_count = 8;
		countCheck = check_inventory(item.furpelt, item_count, -1);
		item1 = item.furpelt;
		item_name2 += "Grass";
		item_count2 = 8;
		countCheck2 = check_inventory(item.grass, item_count2, -1);
		item2 = item.grass;
	}
	
#region Drawing

	if(item_count > 0) {
	
		// Drawing text
		draw_title(item_name, 0, xx, yy);
	
		// Drawing count under text
		// Outer rectangle
		draw_rectangle_color(xx-3, yy+30, xx + string_width(string(item_count))+5, yy+55, outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);
		// Inner rectangle
		draw_rectangle_color(xx, yy+33, xx + string_width(string(item_count))+2, yy+52, inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);
		// Count
		if(!countCheck)
			draw_set_color(c_red);
		else
			draw_set_color(outBoxCol);
		
		draw_text(xx+2, yy+30, string(item_count));
	
		// Drawing item sprite
		draw_sprite_ext(s_items, 0, xx+string_width(string(item_count))+25,yy+46, 2, 2, 0, image_blend, 1);
		draw_sprite_ext(s_items, item1, xx+string_width(string(item_count))+25,yy+46, 2, 2, 0, image_blend, 1);
	
	}

	if(item_count2 > 0) {
		xx += string_width(item_name) + 13;
	
		// Drawing text
		draw_title(item_name2, 0, xx, yy);

		// Drawing count under text
		// Outer rectangle
		draw_rectangle_color(xx-3, yy+30, xx + string_width(string(item_count2))+5, yy+55, outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);
		// Inner rectangle
		draw_rectangle_color(xx, yy+33, xx + string_width(string(item_count2))+2, yy+52, inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);
		// Count
		if(!countCheck2)
			draw_set_color(c_red);
		else
			draw_set_color(outBoxCol);
		draw_text(xx+2, yy+30, string(item_count2));
	
		// Drawing item sprite
		draw_sprite_ext(s_items, 0, xx+string_width(string(item_count2))+25,yy+46, 2, 2, 0, image_blend, 1);
		draw_sprite_ext(s_items, item2, xx+string_width(string(item_count2))+25,yy+46, 2, 2, 0, image_blend, 1);
	}

	if(item_count3 > 0) {
		xx += string_width(item_name2) + 13;
	
		// Drawing text
		draw_title(item_name3, 0, xx, yy);

		// Drawing count under text
		// Outer rectangle
		draw_rectangle_color(xx-3, yy+30, xx + string_width(string(item_count3))+5, yy+55, outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);
		// Inner rectangle
		draw_rectangle_color(xx, yy+33, xx + string_width(string(item_count3))+2, yy+52, inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);
		// Count
		if(!countCheck3)
			draw_set_color(c_red);
		else
			draw_set_color(outBoxCol);
		draw_text(xx+2, yy+30, string(item_count3));
	
		// Drawing item sprite
		draw_sprite_ext(s_items, 0, xx+string_width(string(item_count3))+25,yy+46, 2, 2, 0, image_blend, 1);
		draw_sprite_ext(s_items, item3, xx+string_width(string(item_count3))+25,yy+46, 2, 2, 0, image_blend, 1);
	}

#endregion

	if(countCheck == 0 || countCheck2 == 0 || countCheck3 == 0)
		return false;
	else
		return true;


}
