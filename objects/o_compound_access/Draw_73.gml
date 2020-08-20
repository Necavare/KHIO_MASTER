if(!global.generatingEnvironment){
	if(global.isCrateOpen && global.crate == self) {
		var angle = o_hud.angle;

		// Drawing crate inventory
		for(var ix = 0; ix < width; ix++)
			for(var iy = 0; iy < height; iy++) {
				if(items[# ix, iy] <= 2)
					durability[# ix, iy] = -1;
				// Calculating slot position
				var offX = -9;
				var offY = -5;
				var xx = o_hud.x+lengthdir_x(z, -global.camera_angle+90)+lengthdir_x(offX+(ix*9), angle)+lengthdir_x(offY+(iy*9.1), angle-90);
				var yy = o_hud.y+lengthdir_y(z, -global.camera_angle+90)+lengthdir_y(offX+(ix*9), angle)+lengthdir_y(offY+(iy*9.1), angle-90);

				// Drawing slots
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
					alarm[4] = 60;
					animateSlot = false;
					audio_play_sound(sn_menu_highlight, 1, 0);
				}
			
				if(holdSlot && slots[# ix, iy].highlighted) {
					// Drawing slots
					draw_sprite_ext(s_items, slots[# ix, iy].highlighted,xx,yy, image_xscale/1.75, image_yscale/1.75, angle, image_blend, 1);
					// Drawing items
					if(count[# ix, iy] > 0)
						draw_sprite_ext(s_items, items[# ix, iy],xx,yy, image_xscale/1.75, image_yscale/1.75, angle, image_blend, image_alpha);
				} else {
					// Drawing slotss
					draw_sprite_ext(s_items, slots[# ix, iy].highlighted,xx,yy, image_xscale/2, image_yscale/2, angle, image_blend, 1);
					// Drawing items
					if(count[# ix, iy] > 0)
						draw_sprite_ext(s_items, items[# ix, iy],xx,yy, image_xscale/1.75, image_yscale/1.75, angle, image_blend, image_alpha);
				}
		
				// Drawing durability	
				if(durability[# ix, iy] > -1)
					draw_sprite_ext(s_durability, item_durability(durability, items, ix, iy)  ,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
			
				// Drawing quickmove
				if(quickMove && quickMoveX == ix && quickMoveY == iy)
					draw_sprite_ext(s_quickmove, quickMoveLoad,xx,yy, image_xscale/1.5, image_yscale/1.5, angle, image_blend, 1);
				#region Dragging items
		
					// Quickmoving / Full stack Dragging
					if(slots[# ix, iy].highlighted) {
						if((mouse_check_button(global.M_LEFT) && mouseMoving && !global.isItemPicked))
							drag_item(items, count, durability, ix, iy, false);
						else if(mouse_check_button_released(global.M_LEFT) && global.isItemPicked)
							drag_item(items, count, durability, ix, iy, false);
				
				
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
			
			}
		
		if(slotAnimated == -1 && o_hud.slotAnimated == -1)
			global.slotHighlighted = false;
	}

	// Quick Moving items
	if(quickMove) {	
		quickMoveLoad += 1;
			
		if(quickMoveLoad >= 11) {

			if(!inventory_full(quickMoveItem)) {
				pickup_item(o_hud, quickMoveItem, quickMoveCount, quickMoveDurability);	
				quickMove = false;
			} else {
				pickup_item(self, quickMoveItem, quickMoveCount, quickMoveDurability);	
				quickMove = false;
			}
		
		}
	} 
		
	if(!quickMove) {
		quickMoveLoad = -1;
		quickMoveItem = -1;
		quickMoveCount = -1;
		quickMoveDurability = -1;
	}
}