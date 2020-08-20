if(keyboard_check_pressed(vk_f6) && global.isDev)
	showHud = !showHud;

if(collision_circle(o_player.x, o_player.y, 50, o_anvil, true, false))
	isAnvil = true;
else
	isAnvil = false;

if(global.isInventoryOpen) {

// Drawing icons
if(isAnvil) {
	var offX = -22;
	var offY = -13.5;

	var xx = x+lengthdir_x(z, -global.camera_angle+90)+lengthdir_x(offX, angle)+lengthdir_x(offY, angle-90);
	var yy = y+lengthdir_y(z, -global.camera_angle+90)+lengthdir_y(offX, angle)+lengthdir_y(offY, angle-90);
	if(typer)
		draw_sprite_ext(s_icons, 0,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
	else
		draw_sprite_ext(s_icons, 3,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
}

#region Crafting/Recipes

// Drawing Crafting slots 
for(var ix = 0; ix < 1; ix++) {	
	var iy = 0;
		// Calculating the slot positions
		var offX = -20;
		var offY = -7;
		var xx = x+lengthdir_x(z, -global.camera_angle+90)+lengthdir_x(offX, angle)+lengthdir_x(offY+(ix*9), angle-90);
		var yy = y+lengthdir_y(z, -global.camera_angle+90)+lengthdir_y(offX, angle)+lengthdir_y(offY+(ix*9), angle-90);
		
		// Setting slots to highlighted
		var slot = crafting[# ix, iy];
		slot.x = xx;
		slot.y = yy;
		slot.image_angle = angle;
		
		if(crafting[# ix, iy].highlighted && slotAnimated != crafting[# ix, iy]) {
			global.slotHighlighted = true;
			animateSlot = true;
			holdSlot = true;
			slotAnimated = crafting[# ix, iy];
		}
		
		// Resetting slot if not highlighted
		if(slotAnimated != -1 && !slotAnimated.highlighted)
			slotAnimated = -1;
			
		if(animateSlot && crafting[# ix, iy].highlighted) {
			animateSlot = false;
			audio_play_sound(sn_menu_highlight, 1, 0);
		}
		
		// Drawing slot background
		draw_sprite_ext(s_slots, 5,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
		
		if(holdSlot && crafting[# ix, iy].highlighted) {
			// Drawing slots
			draw_sprite_ext(s_slots, crafting[# ix, iy].highlighted,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
			// Drawing items
			if(craftingCount[# ix, iy] > 0)
				draw_sprite_ext(s_items, craftingItems[# ix, iy],xx,yy, image_xscale/1.75, image_yscale/1.75, angle, image_blend, image_alpha);
		} else {
			// Drawing slots
			draw_sprite_ext(s_slots, crafting[# ix, iy].highlighted,xx,yy, image_xscale/1.75, image_yscale/1.75, angle, image_blend, 1);
			// Drawing items
			if(craftingCount[# ix, iy] > 0)
				draw_sprite_ext(s_items, craftingItems[# ix, iy],xx,yy, image_xscale/1.75, image_yscale/1.75, angle, image_blend, image_alpha);
		}
		
		// Drawing durability
		if(craftingDurability[# ix, iy] > -1)
			draw_sprite_ext(s_durability, item_durability(craftingDurability, craftingItems, ix, iy)  ,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
			
		// Drawing quickmove
		if(quickMoveX == -1 && quickMoveY == iy && quickMove)
			draw_sprite_ext(s_quickmove, quickMoveLoad+11,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
			
		#region Dragging items
			
			// Quickmoving / Full stack Dragging
				if(crafting[# ix, iy].highlighted) {
					if(mouse_check_button(global.M_LEFT) && mouseMoving && !global.isItemPicked) 
						drag_item(craftingItems, craftingCount, craftingDurability, ix, iy, false);
					else if(mouse_check_button_released(global.M_LEFT) && global.isItemPicked && !inventory_full(global.last_item))
						drag_item(craftingItems, craftingCount, craftingDurability, ix, iy, false);
					else if(mouse_check_button_released(global.M_LEFT) && global.isItemPicked && inventory_full(global.last_item)) {
						// Spawning new item					
						var new_item = instance_create_layer(o_player.x, o_player.y, "items", o_item);

						new_item.image_index = global.last_item; 
						new_item.direction = point_direction(x,y,mouse_x,mouse_y);
						new_item.item_count = global.picked_quantity;
						new_item.durability = global.picked_durability;
						new_item.long = true;
			
						if(!global.generatingEnvironment)
							switch(irandom_range(0,3)) {
								case 0: audio_play_sound(sn_equip_1, 1, 0); break;
								case 1: audio_play_sound(sn_equip_2, 1, 0); break;
								case 2: audio_play_sound(sn_equip_3, 1, 0); break;
								case 3: audio_play_sound(sn_equip_4, 1, 0); break; 
							}
				
						// Resetting picked variables
						global.picked_quantity = 0;
						global.last_item = 0;
						global.isItemPicked = false;
					    global.picked_durability = -1;
					}
				
					if(mouse_check_button_released(global.M_RIGHT) && !mouseMoving && quickMoveItem == -1 && craftingItems[# ix, iy] > 0 && !global.isItemPicked) {
						quickMove = true;
						quickMoveLoad = 0;
						quickMoveItem = craftingItems[# ix, iy];
						quickMoveCount = craftingCount[# ix, iy];
						quickMoveDurability = craftingDurability[# ix, iy];
						quickMoveX = -1;
						quickMoveY = iy;
						fromHotbar = true;
					} else if((mouse_check_button(global.M_RIGHT) && !global.isItemPicked && mouseMoving) || mouse_check_button_released(global.M_RIGHT)) 
						drag_item(craftingItems, craftingCount, craftingDurability, ix, iy, true);
				}
			
				if(quickMoveX == -1 && quickMoveY == iy && quickMoveLoad >= 10) {
					craftingItems[# ix, iy] = 0;
					craftingCount[# ix, iy] = 0;
					craftingDurability[# ix, iy] = -1;
				}
		#endregion
		
}

#region Adding recipes to crafting

	ds_grid_clear(recipeItems, item.none);
	
	if(alarm[5] == -1)
		alarm[5] = 120;
	
	var recipeitem = craftingItems[# 0, 0];
	// Add 9 most common recipes when no items in crafting
	if(craftingCount[# 0, 0] <= 0) {
		add_recipe(recipeItems, item.bandage);
		add_recipe(recipeItems, item.splint);
		add_recipe(recipeItems, item.torch);
		
		add_recipe(recipeItems, item.firepit);
		add_recipe(recipeItems, item.wall);
		add_recipe(recipeItems, item.door);
		
		add_recipe(recipeItems, item.woodspikes);
		add_recipe(recipeItems, item.snaretrap);
		add_recipe(recipeItems, item.smallcrate);
		
		if(!birchOrSpruce)
			add_recipe(recipeItems, item.stoneaxeB);
		else
			add_recipe(recipeItems, item.stoneaxeS);
		if(!birchOrSpruce)
			add_recipe(recipeItems, item.stonepicB);
		else
			add_recipe(recipeItems, item.stonepicS);
		if(!birchOrSpruce)
			add_recipe(recipeItems, item.stoneShovelB);
		else
			add_recipe(recipeItems, item.stoneShovelS);
		
	} else if(recipeitem == item.stick) {
		add_recipe(recipeItems, item.wall);
		add_recipe(recipeItems, item.woodspikes);
		add_recipe(recipeItems, item.snaretrap);
		
		add_recipe(recipeItems, item.marker);
		
		if(!birchOrSpruce)
			add_recipe(recipeItems, item.stoneaxeB);
		else
			add_recipe(recipeItems, item.stoneaxeS);
		if(!birchOrSpruce)
			add_recipe(recipeItems, item.stonepicB);
		else
			add_recipe(recipeItems, item.stonepicS);
			
		add_recipe(recipeItems, item.torch);
		add_recipe(recipeItems, item.bolt);
	} else if(recipeitem == item.grass) {
		add_recipe(recipeItems, item.bandage);
		add_recipe(recipeItems, item.splint);
		add_recipe(recipeItems, item.bedroll);
		add_recipe(recipeItems, item.torch);
		add_recipe(recipeItems, item.lantern);
		add_recipe(recipeItems, item.sack);
		add_recipe(recipeItems, item.woodenhead);
		add_recipe(recipeItems, item.woodenchest);
		add_recipe(recipeItems, item.leatherhead);
		add_recipe(recipeItems, item.leatherchest);
		add_recipe(recipeItems, item.metalhead);
		add_recipe(recipeItems, item.metalchest);
	} else if(recipeitem == item.furpelt) {
		add_recipe(recipeItems, item.leatherhead);
		add_recipe(recipeItems, item.leatherchest);
		add_recipe(recipeItems, item.sack);
		add_recipe(recipeItems, item.bedroll);
	} else if(recipeitem == item.planks) {
		add_recipe(recipeItems, item.splint);
		add_recipe(recipeItems, item.woodenhead);
		add_recipe(recipeItems, item.woodenchest);
		add_recipe(recipeItems, item.smallcrate);
		add_recipe(recipeItems, item.largecrate);
		add_recipe(recipeItems, item.door);
	} else if(recipeitem == item.lilly) {
		add_recipe(recipeItems, item.poison);
	} else if(recipeitem == item.charcoal) {
		add_recipe(recipeItems, item.gunpowder);
	} else if(recipeitem == item.sulfur) {
		add_recipe(recipeItems, item.gunpowder);
	} else if(recipeitem == item.metal) {
		add_recipe(recipeItems, item.metalhead);
		add_recipe(recipeItems, item.metalchest);
		add_recipe(recipeItems, item.metalspikes);
		add_recipe(recipeItems, item.largecrate);
		
		add_recipe(recipeItems, item.lantern);
		add_recipe(recipeItems, item.sword);
		add_recipe(recipeItems, item.knife);
			
		if(!birchOrSpruce)
			add_recipe(recipeItems, item.metalaxeB);
		else
			add_recipe(recipeItems, item.metalaxeS);
			
		if(!birchOrSpruce)
			add_recipe(recipeItems, item.metalpicB);
		else
			add_recipe(recipeItems, item.metalpicS);
			
		if(!birchOrSpruce)
			add_recipe(recipeItems, item.metalShovelB);
		else
			add_recipe(recipeItems, item.metalShovelS);
				
		add_recipe(recipeItems, item.rifleammo);
		add_recipe(recipeItems, item.buckshot);	
	} else if(recipeitem == item.bones) {
		if(!birchOrSpruce)
			add_recipe(recipeItems, item.boneaxeB);
		else
			add_recipe(recipeItems, item.boneaxeS);
			
		if(!birchOrSpruce)
			add_recipe(recipeItems, item.bonepicB);
		else
			add_recipe(recipeItems, item.bonepicS);
				
		if(!birchOrSpruce)
			add_recipe(recipeItems, item.boneclubB);
		else
			add_recipe(recipeItems, item.boneclubS);
	} else if(recipeitem == item.bolt) {
		add_recipe(recipeItems, item.flamebolt);
		add_recipe(recipeItems, item.flintbolt);
		add_recipe(recipeItems, item.bonebolt);
		add_recipe(recipeItems, item.metalbolt);
	} else if(recipeitem == item.flare) {
		add_recipe(recipeItems, item.flamebolt);
	} else if(recipeitem == item.rock) {
		add_recipe(recipeItems, item.firepit);
		if(!birchOrSpruce)
			add_recipe(recipeItems, item.stoneaxeB);
		else
			add_recipe(recipeItems, item.stoneaxeS);
		if(!birchOrSpruce)
			add_recipe(recipeItems, item.stonepicB);
		else
			add_recipe(recipeItems, item.stonepicS);
		
	} else if(recipeitem == item.berry) {
		add_recipe(recipeItems, item.snaretrap);
	}
		
#endregion

// Drawing Recipe slots
for(var ix = 0; ix < 10; ix++)
	for(var iy = 0; iy < 3; iy++) {	
		// Calculating the slot positions
		var offX = -30.5;
		var offY = -28;
		var xx = x+lengthdir_x(z, -global.camera_angle+90)+lengthdir_x(offX+(-ix*10.5), angle)+lengthdir_x(offY+(iy*10.5), angle-90);
		var yy = y+lengthdir_y(z, -global.camera_angle+90)+lengthdir_y(offX+(-ix*10.5), angle)+lengthdir_y(offY+(iy*10.5), angle-90);
		
		// Setting slots to highlightedf
		var slot = recipe[# ix, iy];
		slot.x = xx;
		slot.y = yy;
		slot.image_angle = angle;
		
		if(recipe[# ix, iy].highlighted && slotAnimated != recipe[# ix, iy] && recipeItems[# ix, iy] > 1) {
			global.slotHighlighted = true;		
			animateSlot = true;
			holdSlot = true;
			slotAnimated = recipe[# ix, iy];
		}
		
		// Resetting slot if not highlighted
		if(slotAnimated != -1 && !slotAnimated.highlighted)
			slotAnimated = -1;
			
		if(animateSlot && recipe[# ix, iy].highlighted) {
			animateSlot = false;
			audio_play_sound(sn_menu_highlight, 1, 0);
		}
		
		// Drawing divider lines
		if(ix == 0 && iy == 0 && global.isCrateOpen)
			draw_sprite_ext(s_crafting_lines, 0,xx,yy, image_xscale, image_yscale, angle, image_blend, image_alpha);
		else if(ix == 0 && iy == 0)
			draw_sprite_ext(s_crafting_lines, 1,xx,yy, image_xscale, image_yscale, angle, image_blend, image_alpha);
		
		// Drawing slot background
		if(recipeItems[# ix, iy] > 1)
			draw_sprite_ext(s_slots, 4,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
			
		if(holdSlot && recipe[# ix, iy].highlighted) {
			// Drawing slots
			if(recipeItems[# ix, iy] > 1)
				draw_sprite_ext(s_items, recipe[# ix, iy].highlighted,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
	
			// Drawing items
			if(recipeItems[# ix, iy] > 1)
				draw_sprite_ext(s_items, recipeItems[# ix, iy],xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
		} else {
			// Drawing slots
			if(recipeItems[# ix, iy] > 1)
				draw_sprite_ext(s_items, recipe[# ix, iy].highlighted,xx,yy, image_xscale/1.75, image_yscale/1.75, angle, image_blend, 1);
	
			// Drawing items
			if(recipeItems[# ix, iy] > 1)
				draw_sprite_ext(s_items, recipeItems[# ix, iy],xx,yy, image_xscale/1.75, image_yscale/1.75, angle, image_blend, 1);
		}
			
		#region Clicking recipes
			if(mouse_check_button(global.M_LEFT)) {
				if(!inventory_full(recipeItems[# ix, iy]) && recipe[# ix, iy].highlighted && recipe_title(recipeItems[# ix, iy]) && recipeItems[# ix, iy] > 1 && o_shaders.minute_target == -1) {
					// Clicking to load interact
					global.interactingObject = self;
					if(mouse_check_button(global.M_LEFT) && global.interactingLoad < 16) 
						global.interactingLoad+=1;
		
					// Clicking to interact
					if(mouse_check_button(global.M_LEFT) && global.interactingLoad >= 16) {
						global.crafted = true;
						
						pickup_item(o_hud, recipeItems[# ix, iy], 1, 11);
						audio_play_sound(sn_craft, 1, 0);
						
						remove_count(recipeItems[# ix, iy])
						
						// Changing time of day
						var timeOfRecipe = 0;
						if(recipeItems[# ix, iy] == item.poison)
							timeOfRecipe = 5;
						else if(recipeItems[# ix, iy] == item.rope)
							timeOfRecipe = 10;
						else if(recipeItems[# ix, iy] == item.gunpowder)
							timeOfRecipe = 5;
						else if(recipeItems[# ix, iy] == item.stoneaxeB || recipeItems[# ix, iy] == item.stoneaxeS)
							timeOfRecipe = 15;
						else if(recipeItems[# ix, iy] == item.stonepicB || recipeItems[# ix, iy] == item.stonepicS)
							timeOfRecipe = 15;
						else if(recipeItems[# ix, iy] == item.rifleammo)
							timeOfRecipe = 5;
						else if(recipeItems[# ix, iy] == item.buckshot)
							timeOfRecipe = 5;
						else if(recipeItems[# ix, iy] == item.bolt)
							timeOfRecipe = 5;
						else if(recipeItems[# ix, iy] == item.poisonbolt)
							timeOfRecipe = 1;
						else if(recipeItems[# ix, iy] == item.flamebolt)
							timeOfRecipe = 5;
						else if(recipeItems[# ix, iy] == item.torch)
							timeOfRecipe = 5;
						else if(recipeItems[# ix, iy] == item.lantern)
							timeOfRecipe = 15;
						else if(recipeItems[# ix, iy] == item.sword)
							timeOfRecipe = 45;
						else if(recipeItems[# ix, iy] == item.poisonsword)
							timeOfRecipe = 1;
						else if(recipeItems[# ix, iy] == item.knife)
							timeOfRecipe = 30;
						else if(recipeItems[# ix, iy] == item.poisonknife)
							timeOfRecipe = 1;
						else if(recipeItems[# ix, iy] == item.snaretrap)
							timeOfRecipe = 5;
						else if(recipeItems[# ix, iy] == item.wall)
							timeOfRecipe = 5;
						else if(recipeItems[# ix, iy] == item.door)
							timeOfRecipe = 20;
						else if(recipeItems[# ix, iy] == item.woodspikes)
							timeOfRecipe = 5;
						else if(recipeItems[# ix, iy] == item.metalspikes)
							timeOfRecipe = 10;
						else if(recipeItems[# ix, iy] == item.bedroll)
							timeOfRecipe = 15;
						else if(recipeItems[# ix, iy] == item.firepit)
							timeOfRecipe = 10;
						else if(recipeItems[# ix, iy] == item.marker)
							timeOfRecipe = 10;
						else if(recipeItems[# ix, iy] == item.smallcrate)
							timeOfRecipe = 15;
						else if(recipeItems[# ix, iy] == item.largecrate)
							timeOfRecipe = 30;
						else if(recipeItems[# ix, iy] == item.woodenchest)
							timeOfRecipe = 20;
						else if(recipeItems[# ix, iy] == item.woodenhead)
							timeOfRecipe = 15;
						else if(recipeItems[# ix, iy] == item.metalchest)
							timeOfRecipe = 45;
						else if(recipeItems[# ix, iy] == item.metalhead)
							timeOfRecipe = 30;
						else if(recipeItems[# ix, iy] == item.splint)
							timeOfRecipe = 10;
						else if(recipeItems[# ix, iy] == item.bandage)
							timeOfRecipe = 5;
						else if(recipeItems[# ix, iy] == item.metalaxeB || recipeItems[# ix, iy] == item.metalaxeS)
							timeOfRecipe = 30;
						else if(recipeItems[# ix, iy] == item.metalpicB || recipeItems[# ix, iy] == item.metalpicS)
							timeOfRecipe = 30;
						else if(recipeItems[# ix, iy] == item.sack)
							timeOfRecipe = 15;
						else if(recipeItems[# ix, iy] == item.boneaxeB || recipeItems[# ix, iy] == item.boneaxeS)
							timeOfRecipe = 15;
						else if(recipeItems[# ix, iy] == item.bonepicB || recipeItems[# ix, iy] == item.bonepicS)
							timeOfRecipe = 15;
						else if(recipeItems[# ix, iy] == item.boneclubB || recipeItems[# ix, iy] == item.boneclubS)
							timeOfRecipe = 15;
						else if(recipeItems[# ix, iy] == item.bonebolt)
							timeOfRecipe = 5;
						else if(recipeItems[# ix, iy] == item.flintbolt)
							timeOfRecipe = 5;
						else if(recipeItems[# ix, iy] == item.metalbolt)
							timeOfRecipe = 5;
						else if(recipeItems[# ix, iy] == item.poisonbonebolt || recipeItems[# ix, iy] == item.poisonflintbolt || recipeItems[# ix, iy] == item.poisonmetalbolt)
							timeOfRecipe = 1;
						else if(recipeItems[# ix, iy] == item.leatherhead)
							timeOfRecipe = 15;
						else if(recipeItems[# ix, iy] == item.leatherchest)
							timeOfRecipe = 20;
						
						if(o_shaders.minute_of_day + timeOfRecipe > 1440)
							o_shaders.minute_target = 0 + (1440 - (o_shaders.minute_of_day + timeOfRecipe))
						else
							o_shaders.minute_target += o_shaders.minute_of_day + timeOfRecipe;
						
						global.interactingLoad = -1;
						global.interactingObject = -1;
					}
				}
			}
		#endregion
}
#endregion
	
#region Equipment

// Drawing line from player to equip
for (var i = 0; i < 10; i++) {
	var offX = 13;
	var offY = 1;
	var xx = x+lengthdir_x(i+z-10, -global.camera_angle+90)+lengthdir_x(offX, angle)+lengthdir_x(offY, angle-90);
	var yy = y+lengthdir_y(i+z-10, -global.camera_angle+90)+lengthdir_y(offX, angle)+lengthdir_y(offY, angle-90);
	
	draw_sprite_ext(s_equip_line, i,xx,yy, -image_xscale, image_yscale, angle, image_blend, image_alpha);
}

// Drawing equipment slots
for(var ix = 0; ix < 1; ix++)
	for(var iy = 0; iy < 2; iy++) {	
		if(equipItems[# ix, iy] <= 1)
			equipDurability[# ix, iy] = -1;
			
		if(equipDurability[# ix, iy] <= 0)	
			for(var i = 0; i < array_length_1d(global.durabilityItems); i++)
			 if(equipItems[# ix, iy] == global.durabilityItems[i]) {
				equipItems[# ix, iy] = 0;
				equipDurability[# ix, iy] = -1;
				break;
	 		}
			
		// Calculating the slot positions
		var offX = 19;
		var offY = 6.5;
		var xx = x+lengthdir_x(z, -global.camera_angle+90)+lengthdir_x(offX+(ix*11), angle)+lengthdir_x(offY+(iy*10.5), angle-90);
		var yy = y+lengthdir_y(z, -global.camera_angle+90)+lengthdir_y(offX+(ix*11), angle)+lengthdir_y(offY+(iy*10.5), angle-90);
		
		// Setting slots to highlighted
		var slot = equip[# ix, iy];
		slot.x = xx;
		slot.y = yy;
		slot.image_angle = angle;
		
		if(equip[# ix, iy].highlighted && slotAnimated != equip[# ix, iy]) {
			global.slotHighlighted = true;
			animateSlot = true;
			holdSlot = true;
			slotAnimated = equip[# ix, iy];
		}
		
		// Resetting slot if not highlighted
		if(slotAnimated != -1 && !slotAnimated.highlighted)
			slotAnimated = -1;
			
		if(animateSlot && equip[# ix, iy].highlighted) {
			showDescription = false;
			alarm[3] = 60;
			animateSlot = false;
			audio_play_sound(sn_menu_highlight, 1, 0);
		}
		
		// Drawing slot background
		draw_sprite_ext(s_slots, 4,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
		
		if(holdSlot && equip[# ix, iy].highlighted) {
			// Drawing slots
			draw_sprite_ext(s_slots, equip[# ix, iy].highlighted+(8-(2*iy)),xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
	
			// Drawing items
			if(equipItems[# ix, iy] > 1)
				draw_sprite_ext(s_items, equipItems[# ix, iy],xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
		} else {
			// Drawing slots
			draw_sprite_ext(s_slots, equip[# ix, iy].highlighted+(8-(2*iy)),xx,yy, image_xscale/1.75, image_yscale/1.75, angle, image_blend, 1);
	
			// Drawing items
			if(equipItems[# ix, iy] > 1)
				draw_sprite_ext(s_items, equipItems[# ix, iy],xx,yy, image_xscale/1.75, image_yscale/1.75, angle, image_blend, 1);
		}
		
		// Drawing durability
		if(equipDurability[# ix, iy] > -1)
			draw_sprite_ext(s_durability, item_durability(equipDurability, equipItems, ix, iy)  ,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
			
		// Drawing quickmove
		if(quickMoveX == -2 && quickMoveY == iy && quickMove)
			draw_sprite_ext(s_quickmove, quickMoveLoad,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
		
		#region Dragging items
			var canPlace = false;
			// Checking if head armor
			if(iy == 0)
				for(var i = 0; i < 3; i++)
					if(equipItems == global.headItems[i] || (global.isItemPicked && global.last_item == global.headItems[i]) || equipItems[# ix, iy] == global.headItems[i])
						canPlace = true;
			
			// Checking if body armor
			if(iy == 1)
				for(var i = 0; i < 3; i++)
					if(equipItems == global.bodyItems[i] || (global.isItemPicked && global.last_item == global.bodyItems[i]) || equipItems[# ix, iy] == global.bodyItems[i])
						canPlace = true;
			
			global.headEquipped = equipItems[# ix, 0];
			global.bodyEquipped = equipItems[# ix, 1];
			
				// Quickmoving / Full stack Dragging
				if(equip[# ix, iy].highlighted && canPlace) {
					if(mouse_check_button(global.M_LEFT) && mouseMoving && !global.isItemPicked) 
						drag_item(equipItems, 0, equipDurability, ix, iy, 0);
					else if(mouse_check_button_released(global.M_LEFT) && global.isItemPicked && !inventory_full(global.last_item))
						drag_item(equipItems, 0, equipDurability, ix, iy, 0);
					else if(mouse_check_button_released(global.M_LEFT) && global.isItemPicked && inventory_full(global.last_item)) {
						// Spawning new item					
						var new_item = instance_create_layer(o_player.x, o_player.y, "items", o_item);

						new_item.image_index = global.last_item; 
						new_item.direction = point_direction(x,y,mouse_x,mouse_y);
						new_item.item_count = global.picked_quantity;
						new_item.durability = global.picked_durability;
						new_item.long = true;
			
						if(!global.generatingEnvironment)
							switch(irandom_range(0,3)) {
								case 0: audio_play_sound(sn_equip_1, 1, 0); break;
								case 1: audio_play_sound(sn_equip_2, 1, 0); break;
								case 2: audio_play_sound(sn_equip_3, 1, 0); break;
								case 3: audio_play_sound(sn_equip_4, 1, 0); break; 
							}
				
						// Resetting picked variables
						global.picked_quantity = 0;
						global.last_item = 0;
						global.isItemPicked = false;
					    global.picked_durability = -1;
					}
				
					if(mouse_check_button_released(global.M_RIGHT) && !mouseMoving && quickMoveItem == -1 && equipItems[# ix, iy] > 0 && !global.isItemPicked) {
						quickMove = true;
						quickMoveLoad = 0;
						quickMoveItem = equipItems[# ix, iy];
						quickMoveCount = 1;
						quickMoveDurability = equipDurability[# ix, iy];
						quickMoveX = -2;
						quickMoveY = iy;
					} else if((mouse_check_button(global.M_RIGHT) && !global.isItemPicked && mouseMoving) || mouse_check_button_released(global.M_RIGHT)) 
						drag_item(equipItems, 0, equipDurability, 0, iy, true);
				}
			
				if(quickMoveX == -2 && quickMoveY == iy && quickMoveLoad >= 10) {
					equipItems[# ix, iy] = 0;
					equipDurability[# ix, iy] = -1;
				}
			
			#endregion
	}
	
	#region Drawing Stats
	//show_debug_message("HEALTH: " + string(o_player.health_));
	// Health
	/*
	for (var i = -1; i < 11; i++) {
		var offX = 19;
		var offY = 21;
		var xx = x+lengthdir_x(z, -global.camera_angle+90)+lengthdir_x(offX+(i*2), angle)+lengthdir_x(offY, angle-90);
		var yy = y+lengthdir_y(z, -global.camera_angle+90)+lengthdir_y(offX+(i*2), angle)+lengthdir_y(offY, angle-90);
		
		if(i < 10) {
			var slot = health_[# i+1, 0];
			slot.x = xx;
			slot.y = yy;
			slot.image_angle = angle;
		}
		
		if(i == -1 || i == 10)
			draw_sprite_ext(s_stats, 0,xx,yy, -image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
		else if(i < o_player.health_ / 10)
			draw_sprite_ext(s_stats, 2,xx,yy, -image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
			
	}
	
	// Hunger
	for (var i = -1; i < 11; i++) {
		var offX = 19;
		var offY = 24;
		var xx = x+lengthdir_x(z, -global.camera_angle+90)+lengthdir_x(offX+(i*2), angle)+lengthdir_x(offY, angle-90);
		var yy = y+lengthdir_y(z, -global.camera_angle+90)+lengthdir_y(offX+(i*2), angle)+lengthdir_y(offY, angle-90);
		
		if(i < 10) {
			var slot = hunger[# i+1, 0];
			slot.x = xx;
			slot.y = yy;
			slot.image_angle = angle;
		}
		
		if(o_player.hunger_ <= 5) {
			if((i == -1 && typer) || i == 10)
				draw_sprite_ext(s_stats, 0,xx,yy, -image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
			else if(i < o_player.hunger_ / 10)
				draw_sprite_ext(s_stats, 3,xx,yy, -image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
		} else {
			if(i == -1 || i == 10)
				draw_sprite_ext(s_stats, 0,xx,yy, -image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
			else if(i < o_player.hunger_ / 10)
				draw_sprite_ext(s_stats, 3,xx,yy, -image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
		}
	}
	*/
	#endregion

#endregion

#region Journal

// Calculating the slot positions
var offX = 19;
var offY = 27.5;
var xx = x+lengthdir_x(z, -global.camera_angle+90)+lengthdir_x(offX, angle)+lengthdir_x(offY, angle-90);
var yy = y+lengthdir_y(z, -global.camera_angle+90)+lengthdir_y(offX, angle)+lengthdir_y(offY, angle-90);
		
// Setting slots to highlighted
var slot = journal[# 0, 0];
slot.x = xx;
slot.y = yy;
slot.image_angle = angle;
		
if(journal[# 0, 0].highlighted && slotAnimated != journal[# 0, 0]) {
	global.slotHighlighted = true;
	animateSlot = true;
	holdSlot = true;
	slotAnimated = journal[# 0, 0];
}
		
// Resetting slot if not highlighted
if(slotAnimated != -1 && !slotAnimated.highlighted)
	slotAnimated = -1;
			
if(animateSlot && journal[# 0, 0].highlighted) {
	showDescription = false;
	alarm[3] = 60;
	animateSlot = false;
	audio_play_sound(sn_menu_highlight, 1, 0);
}

// Drawing slot background
draw_sprite_ext(s_slots, 4,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
	
if(holdSlot && journal[# 0, 0].highlighted) {
	// Drawing slots
	draw_sprite_ext(s_items, journal[# 0, 0].highlighted,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
			
	//Drawing items
	draw_sprite_ext(s_items, journalItems[# 0, 0],xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
} else {
	// Drawing slots
	draw_sprite_ext(s_items, journal[# 0, 0].highlighted,xx,yy, image_xscale/1.75, image_yscale/1.75, angle, image_blend, 1);
	
	// Drawing items
	draw_sprite_ext(s_items, journalItems[# 0, 0],xx,yy, image_xscale/1.75, image_yscale/1.75, angle, image_blend, 1);
}
			

#endregion

#region Inventory

// Drawing line from backpack to inventory
for (var i = 0; i < 14; i++) {
	var offX = -14;
	var offY = 1;
	var xx = x+lengthdir_x(i+z-14, -global.camera_angle+90)+lengthdir_x(offX, angle)+lengthdir_x(offY, angle-90);
	var yy = y+lengthdir_y(i+z-14, -global.camera_angle+90)+lengthdir_y(offX, angle)+lengthdir_y(offY, angle-90);

	draw_sprite_ext(s_inventory_line, i+z-14,xx,yy, image_xscale, image_yscale, angle, image_blend, image_alpha);
}

#region Hotbar slots
		// Drawing  Hotbar
	if(showHud)
		for(var iy = 0; iy < 3; iy++) {
			
			if(hotbarDurability[# 0, iy] <= 0)
				for(var i = 0; i < array_length_1d(global.durabilityItems); i++)
					if(hotbarItems[# 0, iy] == global.durabilityItems[i]) {
						hotbarItems[# 0, iy] = 0;
						hotbarCount[# 0, iy] = 0;
						hotbarDurability[# 0, iy] = -1;
						break;
	 				}
		
			// Calculating slot position
			var offX = -47;
			var offY = 6.5;
			var xx = x+lengthdir_x(z, -global.camera_angle+90)+lengthdir_x(offX+(3*9), angle)+lengthdir_x(offY+(iy*10.5), angle-90);
			var yy = y+lengthdir_y(z, -global.camera_angle+90)+lengthdir_y(offX+(3*9), angle)+lengthdir_y(offY+(iy*10.5), angle-90);
			
			// Setting slots to highlighted
			var slot = hotbarSlots[# 0, iy];
			slot.x = xx+1;
			slot.y = yy+1;
			slot.image_angle = angle;
		
			if(hotbarSlots[# 0, iy].highlighted && slotAnimated != hotbarSlots[# 0, iy]) {
				global.slotHighlighted = true;
				animateSlot = true;
				holdSlot = true;
				slotAnimated = hotbarSlots[# 0, iy];
			}
		
			// Resetting slot if not highlighted
			if(slotAnimated != -1 && !slotAnimated.highlighted)
				slotAnimated = -1;
			
			if(animateSlot && hotbarSlots[# 0, iy].highlighted) {
				showDescription = false;
				alarm[3] = 60;
				animateSlot = false;
				audio_play_sound(sn_menu_highlight, 1, 0);		
			}
			
			// Drawing slot background
			draw_sprite_ext(s_slots, 5,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
			
			if(holdSlot && hotbarSlots[# 0, iy].highlighted) {
				// Drawing slots
				draw_sprite_ext(s_slots, hotbarSlots[# 0, iy].highlighted+(iy*2)+10,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
				
	
				// Drawing items
				if(hotbarCount[# 0, iy] > 0)
					draw_sprite_ext(s_items, hotbarItems[# 0, iy],xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
			} else {
				// Drawing slots
				draw_sprite_ext(s_slots, hotbarSlots[# 0, iy].highlighted+(iy*2)+10,xx,yy, image_xscale/1.75, image_yscale/1.75, angle, image_blend, 1);
	
				// Drawing items
				if(hotbarCount[# 0, iy] > 0)
					draw_sprite_ext(s_items, hotbarItems[# 0, iy],xx,yy, image_xscale/1.75, image_yscale/1.75, angle, image_blend, 1);
			}
			
			// Drawing durability
			if(hotbarDurability[# 0, iy] > -1)
				draw_sprite_ext(s_durability, item_durability(hotbarDurability, hotbarItems, 0, iy)  ,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
		
				
			// Drawing quickmove
			if(quickMoveX == -1 && quickMoveY == iy && quickMove)
				draw_sprite_ext(s_quickmove, quickMoveLoad+11,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
				
			#region Dragging items
				// Quickmoving / Full stack Dragging
				if(hotbarSlots[# 0, iy].highlighted) {
					if(mouse_check_button(global.M_LEFT) && mouseMoving && !global.isItemPicked) 
						drag_item(hotbarItems, hotbarCount, hotbarDurability, 0, iy, false);
					else if((mouse_check_button(global.M_LEFT) && !mouseMoving && !global.isItemPicked)) {
						if(hotbarItems[# ix, iy] == item.treasureMap || hotbarItems[# ix, iy] == item.enemymap) {
							// Clicking to load interact
							global.interactingObject = self;
							if(mouse_check_button(global.M_LEFT) && global.interactingLoad < 16) 
								global.interactingLoad+=1;
		
							// Clicking to interact
							if(mouse_check_button(global.M_LEFT) && global.interactingLoad >= 16) {
								// Discover enemy camp
								if(hotbarItems[# ix, iy] == item.enemymap) {
									var uncovered = false;
									for(var i = 0; i < ds_list_size(global.campIdList); i++){
										if(!uncovered && ds_list_find_value(global.campCol, i) != 0){
											uncovered = true;
											ds_list_set(global.campCol, i, 1);
				
											global.enemyMap = true;
											o_hud.enemyMapTime = 0;
										}
									}
								}
								
								// Discover treasure
								if(hotbarItems[# ix, iy] == item.treasureMap) {
									var uncovered = false;
									for(var i =0; i < ds_list_size(global.moundXList); i++){
										if(!uncovered && ds_list_find_value(global.moundTypeList, i) == 0) {
											uncovered = true;
											ds_list_set(global.moundTypeList, i, 1);
				
											global.enemyMap = true;
											o_hud.enemyMapTime = 0;
											//set a treasure icon (no library)
				
											i = ds_list_size(global.moundXList);
										}
									}
								}
								
								hotbarItems[# ix, iy] = 0;
								hotbarCount[# ix, iy] = 0;
								
								global.interactingObject = -1;
								global.interactingLoad = -1;
							}
						}
					} else if(mouse_check_button_released(global.M_LEFT) && global.isItemPicked && !inventory_full(global.last_item))
						drag_item(hotbarItems, hotbarCount, hotbarDurability, 0, iy, false);
					else if(mouse_check_button_released(global.M_LEFT) && global.isItemPicked && inventory_full(global.last_item)) {
						// Spawning new item					
						var new_item = instance_create_layer(o_player.x, o_player.y, "items", o_item);

						new_item.image_index = global.last_item; 
						new_item.direction = point_direction(x,y,mouse_x,mouse_y);
						new_item.item_count = global.picked_quantity;
						new_item.durability = global.picked_durability;
						new_item.long = true;
			
						if(!global.generatingEnvironment)
							switch(irandom_range(0,3)) {
								case 0: audio_play_sound(sn_equip_1, 1, 0); break;
								case 1: audio_play_sound(sn_equip_2, 1, 0); break;
								case 2: audio_play_sound(sn_equip_3, 1, 0); break;
								case 3: audio_play_sound(sn_equip_4, 1, 0); break; 
							}
				
						// Resetting picked variables
						global.picked_quantity = 0;
						global.last_item = 0;
						global.isItemPicked = false;
					    global.picked_durability = -1;
					}
				
					if(mouse_check_button_released(global.M_RIGHT) && !mouseMoving && quickMoveItem == -1 && hotbarItems[# 0, iy] > 0 && !global.isItemPicked) {
						quickMove = true;
						quickMoveLoad = 0;
						quickMoveItem = hotbarItems[# 0, iy];
						quickMoveCount = hotbarCount[# 0, iy];
						quickMoveDurability = hotbarDurability[# 0, iy];
						quickMoveX = -1;
						quickMoveY = iy;
						fromHotbar = true;
					} else if((mouse_check_button(global.M_RIGHT) && !global.isItemPicked && mouseMoving) || mouse_check_button_released(global.M_RIGHT)) 
						drag_item(hotbarItems, hotbarCount, hotbarDurability, 0, iy, true);
				}
			
				if(quickMoveX == -1 && quickMoveY == iy && quickMoveLoad >= 10) {
					hotbarItems[# 0, iy] = 0;
					hotbarCount[# 0, iy] = 0;
					hotbarDurability[# 0, iy] = -1;
				}
			
			#endregion
		}
				
	#endregion

// Drawing inventory 
for(var ix = 0; ix < width; ix++)
	for(var iy = 0; iy < height; iy++) {
		if(items[# ix, iy] <= 2)
			durability[# ix, iy] = -1;
			
		if(durability[# ix, iy] <= 0)
			for(var i = 0; i < array_length_1d(global.durabilityItems); i++)
				if(items[# ix, iy] == global.durabilityItems[i]) {
					items[# ix, iy] = 0;
					count[# ix, iy] = 0;
					durability[# ix, iy] = -1;
					break;
	 			}
		
		// Calculating slot position
		var offX = -51.5;
		var offY = 6.5;
		var xx = x+lengthdir_x(z, -global.camera_angle+90)+lengthdir_x(offX+(ix*10.5), angle)+lengthdir_x(offY+(iy*10.5), angle-90);
		var yy = y+lengthdir_y(z, -global.camera_angle+90)+lengthdir_y(offX+(ix*10.5), angle)+lengthdir_y(offY+(iy*10.5), angle-90);

		// Setting slots to highlighted
		var slot = slots[# ix, iy];
		slot.x = xx;
		slot.y = yy;
		slot.image_angle = angle;
		
		if(slots[# ix, iy].highlighted && slotAnimated != slots[# ix, iy]) {
			global.slotHighlighted = true;
			animateSlot = true;
			holdSlot = true;
			slotAnimated = slots[# ix, iy];
		}			
			
		// Resetting slot if not highlighted
		if(slotAnimated != -1 && !slotAnimated.highlighted) 
			slotAnimated = -1;		
			
		if(animateSlot && slots[# ix, iy].highlighted) {
			showDescription = false;
			alarm[3] = 60;
			animateSlot = false;
			audio_play_sound(sn_menu_highlight, 1, 0);
		}
		
		
		// Drawing slot background
		draw_sprite_ext(s_slots, 4,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
		
		if(holdSlot && slots[# ix, iy].highlighted) {
			// Drawing slots
			draw_sprite_ext(s_items, slots[# ix, iy].highlighted,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
			// Drawing items
			if(count[# ix, iy] > 0)
				draw_sprite_ext(s_items, items[# ix, iy],xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
		} else {
			// Drawing slotss
			draw_sprite_ext(s_items, slots[# ix, iy].highlighted,xx,yy, image_xscale/1.75, image_yscale/1.75, angle, image_blend, 1);
			// Drawing items
			if(count[# ix, iy] > 0)
				draw_sprite_ext(s_items, items[# ix, iy],xx,yy, image_xscale/1.75, image_yscale/1.75, angle, image_blend, image_alpha);
		}
		
		// Drawing durability
		if(durability[# ix, iy] > -1)
			draw_sprite_ext(s_durability, item_durability(durability, items, ix, iy)  ,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
			
		if(quickMove && quickMoveX == ix && quickMoveY == iy)
			draw_sprite_ext(s_quickmove, quickMoveLoad,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
		
		#region Dragging items
		
				
				// Quickmoving / Full stack Dragging
				if(slots[# ix, iy].highlighted) {
					if((mouse_check_button(global.M_LEFT) && mouseMoving && !global.isItemPicked)) {
						drag_item(items, count, durability, ix, iy, false);
					} else if((mouse_check_button(global.M_LEFT) && !mouseMoving && !global.isItemPicked)) {
						if(items[# ix, iy] == item.treasureMap || items[# ix, iy] == item.enemymap) {
							// Clicking to load interact
							global.interactingObject = self;
							if(mouse_check_button(global.M_LEFT) && global.interactingLoad < 16) 
								global.interactingLoad+=1;
		
							// Clicking to interact
							if(mouse_check_button(global.M_LEFT) && global.interactingLoad >= 16) {
								// Discover enemy camp
								if(items[# ix, iy] == item.enemymap) {
									var uncovered = false;
									for(var i = 0; i < ds_list_size(global.campIdList); i++){
										if(!uncovered && ds_list_find_value(global.campCol, i) != 0){
											uncovered = true;
											ds_list_set(global.campCol, i, 1);
				
											global.enemyMap = true;
											o_hud.enemyMapTime = 0;
										}
									}
								}
								
								// Discover treasure
								if(items[# ix, iy] == item.treasureMap) {
									var uncovered = false;
									for(var i =0; i < ds_list_size(global.moundXList); i++){
										if(!uncovered && ds_list_find_value(global.moundTypeList, i) == 0) {
											uncovered = true;
											ds_list_set(global.moundTypeList, i, 1);
				
											global.enemyMap = true;
											o_hud.enemyMapTime = 0;
											//set a treasure icon (no library)
				
											i = ds_list_size(global.moundXList);
										}
									}
								}
								
								items[# ix, iy] = 0;
								count[# ix, iy] = 0;
								
								global.interactingObject = -1;
								global.interactingLoad = -1;
							}
						}
					} else if(mouse_check_button_released(global.M_LEFT) && global.isItemPicked && !inventory_full(global.last_item))
						drag_item(items, count, durability, ix, iy, false);
					else if(mouse_check_button_released(global.M_LEFT) && global.isItemPicked && inventory_full(global.last_item)) {
							// Spawning new item					
							var new_item = instance_create_layer(o_player.x, o_player.y, "items", o_item);

							new_item.image_index = global.last_item; 
							new_item.direction = point_direction(x,y,mouse_x,mouse_y);
							new_item.item_count = global.picked_quantity;
							new_item.durability = global.picked_durability;
							new_item.long = true;
			
							if(!global.generatingEnvironment)
								switch(irandom_range(0,3)) {
									case 0: audio_play_sound(sn_equip_1, 1, 0); break;
									case 1: audio_play_sound(sn_equip_2, 1, 0); break;
									case 2: audio_play_sound(sn_equip_3, 1, 0); break;
									case 3: audio_play_sound(sn_equip_4, 1, 0); break; 
								}
				
							// Resetting picked variables
							global.picked_quantity = 0;
							global.last_item = 0;
							global.isItemPicked = false;
						    global.picked_durability = -1;
						}
				
					if(mouse_check_button_released(global.M_RIGHT) && !mouseMoving && quickMoveItem == -1 && items[# ix, iy] > 0 && !global.isItemPicked) {
						quickMove = true;
						quickMoveLoad = 0;
						quickMoveItem = items[# ix, iy];
						quickMoveCount = count[# ix, iy];
						quickMoveDurability = durability[# ix, iy];
						quickMoveX = ix;
						quickMoveY = iy;
					} else if((mouse_check_button(global.M_RIGHT) && !global.isItemPicked && mouseMoving) || mouse_check_button_released(global.M_RIGHT))
						drag_item(items, count, durability, ix, iy, true);
				}
			
				if(quickMoveX == ix && quickMoveY == iy && quickMoveLoad >= 10) {
					items[# ix, iy] = 0;
					count[# ix, iy] = 0;
					durability[# ix, iy] = -1;
				}
			
			#endregion
			
		#endregion
		
		// Drawing item thats picked up
		if(global.isItemPicked) {
			draw_sprite_ext(s_items, global.last_item, mouse_x+lengthdir_x(-1, angle), mouse_y+lengthdir_y(-1, angle), image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);

			if(global.picked_durability > -1 
			&& global.last_item != item.cookedmeat && global.last_item != item.cookedhuman 
			&& global.last_item != item.meat && global.last_item != item.human 
			&& global.last_item != item.fungi && global.last_item != item.cookedfungi
			&& global.last_item != item.berry)
				draw_sprite_ext(s_durability, 11 - global.picked_durability,mouse_x+lengthdir_x(-1, angle), mouse_y+lengthdir_y(-1, angle), image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
			else if(global.picked_durability > -1 
			&& (global.last_item == item.cookedmeat || global.last_item == item.cookedhuman)
			|| (global.last_item == item.meat || global.last_item == item.human)
			|| (global.last_item == item.fungi || global.last_item == item.cookedfungi)
			|| (global.last_item == item.berry))
				draw_sprite_ext(s_durability, 23 - global.picked_durability,mouse_x+lengthdir_x(-1, angle), mouse_y+lengthdir_y(-1, angle), image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
			
		}
	
	}
	
// Drawing drop item indicator
if(global.isItemPicked && !global.slotHighlighted) {
	var dx = o_player.x+lengthdir_x(0, -global.camera_angle+90);
	var dy = o_player.y+lengthdir_y(0, -global.camera_angle+90);
			
	draw_sprite_ext(s_drop, 0, dx, dy, .5, .5, point_direction(o_player.x,o_player.y,mouse_x,mouse_y)+90, image_blend, image_alpha);
	// Dropping items out of inventory
	if(mouse_check_button_released(global.M_LEFT) || mouse_check_button_released(global.M_RIGHT)) {
		if(global.isItemPicked && !global.slotHighlighted) {
			// Spawning new item					
			var new_item = instance_create_layer(o_player.x, o_player.y, "items", o_item);

			new_item.image_index = global.last_item; 
			new_item.direction = point_direction(x,y,mouse_x,mouse_y);
			new_item.item_count = global.picked_quantity;
			new_item.durability = global.picked_durability;
			new_item.long = true;
			
			if(!global.generatingEnvironment)
				switch(irandom_range(0,3)) {
					case 0: audio_play_sound(sn_equip_1, 1, 0); break;
					case 1: audio_play_sound(sn_equip_2, 1, 0); break;
					case 2: audio_play_sound(sn_equip_3, 1, 0); break;
					case 3: audio_play_sound(sn_equip_4, 1, 0); break; 
				}
				
			// Resetting picked variables
			global.picked_quantity = 0;
			global.last_item = 0;
			global.isItemPicked = false;
		    global.picked_durability = -1;
		}
	}
}

} else if(!global.isInventoryOpen && !global.generatingEnvironment && !o_player.isDead) {
	#region Hotbar slots
		
		// Drawing hotbar next to player
	if(showHud)
		for(var iy = 0; iy < 3; iy++) {
			if(hotbarDurability[# 0, iy] <= 0)
				for(var i = 0; i < array_length_1d(global.durabilityItems); i++)
					if(hotbarItems[# 0, iy] == global.durabilityItems[i]) {
						hotbarItems[# 0, iy] = 0;
						hotbarCount[# 0, iy] = 0;
						hotbarDurability[# 0, iy] = -1;
						break;
	 				}
			
			// Calculating slot position
			var offX = -47;
			var offY = 6.5;
			var xx = x+lengthdir_x(z, -global.camera_angle+90)+lengthdir_x(offX+(3*9), angle)+lengthdir_x(offY+(iy*10.5), angle-90);
			var yy = y+lengthdir_y(z, -global.camera_angle+90)+lengthdir_y(offX+(3*9), angle)+lengthdir_y(offY+(iy*10.5), angle-90);
			
			// Drawing slot background
			draw_sprite_ext(s_slots, 5,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, hotbarAlpha);
			
			// Drawing slots
			draw_sprite_ext(s_slots,(iy == hotbarSlot)+(iy*2)+10,xx,yy, image_xscale/1.75, image_yscale/1.75, angle, image_blend, hotbarAlpha);
	
			// Drawing items
			if(hotbarItems[# 0, iy] > 0)
				draw_sprite_ext(s_items, hotbarItems[# 0, iy],xx,yy, image_xscale/1.75, image_yscale/1.75, angle, image_blend, hotbarAlpha);
				
			// Drawing durability
			if(hotbarDurability[# 0, iy] > -1)
				draw_sprite_ext(s_durability, item_durability(hotbarDurability, hotbarItems, 0, iy) ,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, hotbarAlpha);
				
			// Setting the global equipped item
			if(hotbarSlot == -1) {
				global.itemEquipped = -1;
				global.duraEquipped = -1;
				equippedDurability = -1;
			} else {
				global.itemEquipped = hotbarItems[# 0, hotbarSlot];
				equippedDurability = hotbarDurability[# 0, hotbarSlot];
				global.duraEquipped = hotbarDurability[# 0, hotbarSlot];
			}
		}
		
		// Checking if buildable item is in hotbar			
		for(var i = 0; i < array_length_1d(global.buildableItems); i++) {
			if(global.itemEquipped == global.buildableItems[i] && !instance_exists(o_builder) && global.itemEquipped > 0) {
				instance_create_depth(x,y,depth,o_builder);
			}
		}
					
	#endregion
	
	#region Stats
	if(!o_player.isDead && showHud) {
		// Stamina
		if(o_player.stamina < 100)
			for (var i = 0; i < 11; i++) {
				var offX = 15;
				var offY = -3.5;
				var xx = x+lengthdir_x(i*2, -global.camera_angle+90)+lengthdir_x(offX, angle)+lengthdir_x(offY, angle-90);
				var yy = y+lengthdir_y(i*2, -global.camera_angle+90)+lengthdir_y(offX, angle)+lengthdir_y(offY, angle-90);
				
				if(o_player.stamina <= 0 && i == 0) {
					if(typer) {
						draw_sprite_ext(s_stats, 0,xx,yy, -image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
					} else {
						draw_sprite_ext(s_stats, 1,xx,yy, -image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
					}
				} else if(o_player.stamina > 0 && i < 10) {	
					if(i < o_player.stamina/10)
						draw_sprite_ext(s_stats, 1,xx,yy, -image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
				}
				
				if(i == 10 && global.hour > 6 && global.hour < 22) {
					draw_sprite_ext(s_stats, 0,xx,yy, -image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
				} else if(i == 10) {
					draw_sprite_ext(s_stats, 4,xx,yy, -image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
				}
			}
			
		
			/*
		// Health
		if(o_player.health_ < 100)
			for (var i = -1; i < 11; i++) {
				var offX = 19;
				var offY = -3.5;
				var xx = x+lengthdir_x(i*2, -global.camera_angle+90)+lengthdir_x(offX, angle)+lengthdir_x(offY, angle-90);
				var yy = y+lengthdir_y(i*2, -global.camera_angle+90)+lengthdir_y(offX, angle)+lengthdir_y(offY, angle-90);
				
				if(i == -1 || i == 10)
					draw_sprite_ext(s_stats, 0,xx,yy, -image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
				else if(i < o_player.health_ / 10)
					draw_sprite_ext(s_stats, 2,xx,yy, -image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
			}
			
		// Hunger
		if(o_player.hunger_ < 50)
			for (var i = -1; i < 11; i++) {
				var offX = 23;
				var offY = -3.5;
				var xx = x+lengthdir_x(i*2, -global.camera_angle+90)+lengthdir_x(offX, angle)+lengthdir_x(offY, angle-90);
				var yy = y+lengthdir_y(i*2, -global.camera_angle+90)+lengthdir_y(offX, angle)+lengthdir_y(offY, angle-90);
				
				if(i == -1 || i == 10)
					draw_sprite_ext(s_stats, 0,xx,yy, -image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
				else if(i < o_player.hunger_ / 10)
					draw_sprite_ext(s_stats, 3,xx,yy, -image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
			}*/
	}
	#endregion
}


global.no_angle = global.isItemPicked;
	
if((mouse_check_button_released(global.M_LEFT) || mouse_check_button_released(global.M_RIGHT)) && global.slotHighlighted && global.isItemPicked && global.picked_quantity > 0) {
	
	if(!global.isCrateOpen && !inventory_full())
		pickup_item(o_hud, global.last_item, global.picked_quantity, global.picked_durability);
	else if(global.isCrateOpen)
		pickup_item(global.crate, global.last_item, global.picked_quantity, global.picked_durability);
	else {
		// Spawning new item					
		var new_item = instance_create_layer(o_player.x, o_player.y, "items", o_item)
		new_item.image_index = global.last_item; 
		new_item.direction = point_direction(x,y,mouse_x,mouse_y);
		new_item.item_count = global.picked_quantity;
		new_item.durability = global.picked_durability;
	}
    
    global.picked_quantity = 0;
    global.last_item = 0;
    global.isItemPicked = false;
    global.picked_durability = -1;
}

if(slotAnimated == -1 && !global.isCrateOpen)
	global.slotHighlighted = false;
	
// Quick Moving items
if(quickMove) {	
	quickMoveLoad += 1;
			
	if(quickMoveLoad >= 11) {
		if(!global.generatingEnvironment)
			switch(irandom_range(0,3)) {
				case 0: audio_play_sound(sn_equip_1, 1, 0); break;
				case 1: audio_play_sound(sn_equip_2, 1, 0); break;
				case 2: audio_play_sound(sn_equip_3, 1, 0); break;
				case 3: audio_play_sound(sn_equip_4, 1, 0); break; 
			}

		var armor = -1;
		if(quickMoveX != -2) {
			for(var i = 0; i < 3; i++) {
				if(quickMoveItem == global.headItems[i] && equipItems[# 0, 0] == item.none)
					armor = 0;
				else if(quickMoveItem == global.bodyItems[i] && equipItems[# 0, 1] == item.none)
					armor = 1;
			}
		}
			
		if(armor == -1) {
			if(!global.isCrateOpen) {
				if(quickMoveX == -1 || quickMoveX == -2 || quickMoveY == -1)
					pickup_item(o_hud, quickMoveItem, quickMoveCount, quickMoveDurability);	
				else
					for(var iy = 0; iy < 3; iy++) {
						if(hotbarItems[# 0, iy] <= 0) {
							hotbarItems[# 0, iy] = quickMoveItem;
							hotbarCount[# 0, iy] = quickMoveCount;
							hotbarDurability[# 0, iy] = quickMoveDurability;
							break;
						} else if(iy == 2)
							pickup_item(o_hud, quickMoveItem, quickMoveCount, quickMoveDurability);
					}
			} else if(global.isCrateOpen)
				pickup_item(global.crate, quickMoveItem, quickMoveCount, quickMoveDurability);	
		} else if(armor == 0) {
			equipItems[# 0, 0] = quickMoveItem;
			equipDurability[# 0, 0] = quickMoveDurability;
		} else if(armor == 1) {
			equipItems[# 0, 1] = quickMoveItem;
			equipDurability[# 0, 1] = quickMoveDurability;
		}
		
		quickMove = false;
		fromHotbar = false;
	}
} 
		
if(!quickMove) {
	quickMoveLoad = -1;
	quickMoveItem = -1;
	quickMoveCount = -1;
	quickMoveDurability = -1;
}