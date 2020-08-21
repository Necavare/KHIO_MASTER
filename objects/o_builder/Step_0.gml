if(o_player.isDead || o_player.isDying)
	instance_destroy(self);

// Moving object towards mouse
x += (mouse_x-x)*.1;
y += (mouse_y-y)*.1; 
	
// Destroying self if item equipped is not a buildable item	
/*var isBuildable = false;
for(var i = 0; i < array_length(global.buildableItems); i++) {
	isBuildable = false;
	if(global.buildableItems[i] == global.itemEquipped) {
		isBuildable = true;
		break;
	}
}*/
		
if(itemEquip != global.itemEquipped) {
	instance_destroy(self);
	global.isHolding = false;
	global.grabbed = -1;
	global.itemEquipped = -1;
}



if(object != -1) {
	global.interactingObject = -1;
	global.interactingLoad = -5;
	
	if(mouse_check_button_pressed(global.M_LEFT) && spaceFree && object > 0) {
		global.buildangle = image_angle;
		var inst = -1;
		//if(object == 2)
			//inst = instance_create_depth(x+lengthdir_x(11, image_angle),y+lengthdir_y(11, image_angle), 100, buildables[# object, 1]);
		//else
			inst = instance_create_depth(x,y, 100, buildables[# object, 1]);
			
		audio_emitter_position(builder, x, y, 0);
		switch(irandom_range(0,4)) {
			case 0: audio_play_sound_on(builder, sn_snowwalk_1, 0, 1); break;
			case 1: audio_play_sound_on(builder, sn_snowwalk_2, 0, 1); break;
			case 2: audio_play_sound_on(builder, sn_snowwalk_3, 0, 1); break;
			case 3: audio_play_sound_on(builder, sn_snowwalk_4, 0, 1); break;
			case 4: audio_play_sound_on(builder, sn_snowwalk_5, 0, 1); break;
		}
		
		/*
		maybe uncomment, if builder breaks or something
		
		//add it to the minimapable list
		if(ds_map_exists(global.minimapVar, inst)){ //if its a minimapable thing
			if(!ds_list_find_index(global.activemm,inst))//if it is not registered active
				ds_list_add(global.activemm, inst); //add it to list of active minimap symbols
		}*/
		
		//refresh map
		//scr_refresh_update(x+global.xoffset,y+global.yoffset);
		
		// Removing item from hotbar
		if(o_hud.hotbarSlot > -1 && o_hud.hotbarCount[# 0, o_hud.hotbarSlot] > 0) {
			o_hud.hotbarCount[# 0, o_hud.hotbarSlot]--;
			if(o_hud.hotbarCount[# 0, o_hud.hotbarSlot] == 0) {
				o_hud.hotbarItems[# 0, o_hud.hotbarSlot] = 0;
				o_hud.hotbarCount[# 0, o_hud.hotbarSlot] = 0;
				o_hud.hotbarDurability[# 0, o_hud.hotbarSlot] = -1;
			}
		}
			
	} 
	else if(mouse_check_button_pressed(global.M_LEFT) && !spaceFree && object == 0) {
		for(var i = 1; i < width; i++){
			var inst = instance_destroy(instance_position(x,y, buildables[# i, 1]));
				
		}
	}
	
	// Rotating the object
	//scr_update_mm
	if(keyboard_check_pressed(global.K_ROTATELEFT)){
		image_angle+=30;
		//refresh map
		//scr_refresh_update(x+global.xoffset,y+global.yoffset);	
	}
	else if(keyboard_check_pressed(global.K_ROTATERIGHT)){
		image_angle-=30;
		//refresh map
		//scr_refresh_update(x+global.xoffset,y+global.yoffset);	
	}
	
	image_index = 0;
	image_speed = 0;
	
	sprite_index = buildables[# object, 0];
	mask_index = buildables[# object, 0];
	
	
	//if this if statement fires ever it means a change has been made so
}

// Not letting player build if too far away or object is in the way
if(place_free(x,y))
	spaceFree = true;
else
	spaceFree = false;
	
if(!collision_circle(o_player.x, o_player.y, 50, self, true, false))
	spaceFree = false;
	
if(global.isInventoryOpen)
	instance_destroy(self);
	
depth = -9000;