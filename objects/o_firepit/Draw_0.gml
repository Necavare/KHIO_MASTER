if(coalOpacity > .8 && opswitch)
	coalOpacity-=.01;
else if(coalOpacity <= .8)
	opswitch = false;
	
if(coalOpacity < 1 && !opswitch)
	coalOpacity+=.01;
else if(coalOpacity >= 1)
	opswitch = true;

if(!global.generatingEnvironment || room == r_title){
	if(isBloomery == -1) {
		for (var i = 0; i < 6; i++) {
			var xx = x+lengthdir_x(i+buildZ,-camera_get_view_angle(view_camera[0])+90);
			var yy = y+lengthdir_y(i+buildZ,-camera_get_view_angle(view_camera[0])+90);
			if(i+buildZ >= 0) {
			// Drawing firepit base
			if(i < 3)
				draw_sprite_ext(sprite_index, i,xx,yy, 1, 1, image_angle, image_blend, global.alpha);
		
			// Drawing logs
			if(logCount <= 0 && i < 3) {
				if(hotCoals)
					draw_sprite_ext(s_firepit_coal, i,xx,yy, 1, 1, image_angle, image_blend, coalOpacity);
				draw_sprite_ext(s_firepit_log, i,xx,yy, 1, 1, image_angle, image_blend, .5);
			} if(logCount >= 1 && i < 3)	
				draw_sprite_ext(s_firepit_log, i,xx,yy, 1, 1, image_angle, image_blend, global.alpha);
			if(logCount == 1 && i >= 3 && i < 6)
				draw_sprite_ext(s_firepit_log, i,xx,yy, 1, 1, image_angle, image_blend, .5);
			if(logCount >= 2 && i >= 3 && i < 6)
				draw_sprite_ext(s_firepit_log, i,xx,yy, 1, 1, image_angle, image_blend, global.alpha);
		
				//draw_sprite_ext(s_firepit_log, i,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
			}
		}
	
	} else {
		for (var i = 0; i < 18; i++) {
			var xx = x+lengthdir_x(i,-camera_get_view_angle(view_camera[0])+90);
			var yy = y+lengthdir_y(i,-camera_get_view_angle(view_camera[0])+90);
			// Drawing firepit base
			if(i < 4)
				draw_sprite_ext(s_bloomerypit, i,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
		
			// Drawing bloomery logs
			if(logCount <= 0 && i < 3)
				draw_sprite_ext(s_bloomery_log, i,xx,yy, 1, 1, image_angle, image_blend, .5);
			if(logCount >= 1 && i < 3)	
				draw_sprite_ext(s_bloomery_log, i,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
			if(logCount == 1 && i >= 3 && i < 6)
				draw_sprite_ext(s_bloomery_log, i,xx,yy, 1, 1, image_angle, image_blend, .5);
			if(logCount >= 2 && i >= 3 && i < 6)
				draw_sprite_ext(s_bloomery_log, i,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
		
			// Drawing bloomery rocks
			if(i < 6) {
				if(isBloomery < 7)
					draw_sprite_ext(s_bloomery_1, i+18,xx,yy, 1, 1, image_angle, image_blend, .5);
			
				switch(isBloomery) {
					case 1: draw_sprite_ext(s_bloomery_1, i,xx,yy, 1, 1, image_angle, image_blend, 1); break;
					case 2: draw_sprite_ext(s_bloomery_1, i+3,xx,yy, 1, 1, image_angle, image_blend, 1); break;
					case 3: draw_sprite_ext(s_bloomery_1, i+6,xx,yy, 1, 1, image_angle, image_blend, 1); break;
					case 4: draw_sprite_ext(s_bloomery_1, i+9,xx,yy, 1, 1, image_angle, image_blend, 1); break;
					case 5: draw_sprite_ext(s_bloomery_1, i+12,xx,yy, 1, 1, image_angle, image_blend, 1); break;
					case 6: draw_sprite_ext(s_bloomery_1, i+15,xx,yy, 1, 1, image_angle, image_blend, 1); break;
				}
			
				if(isBloomery >= 7)
					draw_sprite_ext(s_bloomery_1, i+18,xx,yy, 1, 1, image_angle, image_blend, 1);
			} 
		
			if(i >= 3 && i < 6 && isBloomery >= 7) {	
				if(isBloomery < 14)
					draw_sprite_ext(s_bloomery_2, i+15,xx,yy, 1, 1, image_angle, $333128, .5);
			
				switch(isBloomery) {
					case 8: draw_sprite_ext(s_bloomery_2, i-3,xx,yy, 1, 1, image_angle, image_blend, 1); break;
					case 9: draw_sprite_ext(s_bloomery_2, i,xx,yy, 1, 1, image_angle, image_blend, 1); break;
					case 10: draw_sprite_ext(s_bloomery_2, i+3,xx,yy, 1, 1, image_angle, image_blend, 1); break;
					case 11: draw_sprite_ext(s_bloomery_2, i+6,xx,yy, 1, 1, image_angle, image_blend, 1); break;
					case 12: draw_sprite_ext(s_bloomery_2, i+9,xx,yy, 1, 1, image_angle, image_blend, 1); break;
					case 13: draw_sprite_ext(s_bloomery_2, i+12,xx,yy, 1, 1, image_angle, image_blend, 1); break;
				}
			
				if(isBloomery >= 14)
					draw_sprite_ext(s_bloomery_2, i+15,xx,yy, 1, 1, image_angle, image_blend, 1);
			}
		
		
			if(isBloomery < 32) {
				if(i >= 6 && i < 9 && isBloomery >= 14) {
					if(isBloomery < 23)
						draw_sprite_ext(s_bloomery_3, i+18,xx,yy, 1, 1, image_angle, $333128, .5);
			
					switch(isBloomery) {
						case 15: draw_sprite_ext(s_bloomery_3, i-6,xx,yy, 1, 1, image_angle, image_blend, 1); break;
						case 16: draw_sprite_ext(s_bloomery_3, i-3,xx,yy, 1, 1, image_angle, image_blend, 1); break;
						case 17: draw_sprite_ext(s_bloomery_3, i,xx,yy, 1, 1, image_angle, image_blend, 1); break;
						case 18: draw_sprite_ext(s_bloomery_3, i+3,xx,yy, 1, 1, image_angle, image_blend, 1); break;
						case 19: draw_sprite_ext(s_bloomery_3, i+6,xx,yy, 1, 1, image_angle, image_blend, 1); break;
						case 20: draw_sprite_ext(s_bloomery_3, i+9,xx,yy, 1, 1, image_angle, image_blend, 1); break;
						case 21: draw_sprite_ext(s_bloomery_3, i+12,xx,yy, 1, 1, image_angle, image_blend, 1); break;
						case 22: draw_sprite_ext(s_bloomery_3, i+15,xx,yy, 1, 1, image_angle, image_blend, 1); break;
					}
				
					if(isBloomery >= 23)
						draw_sprite_ext(s_bloomery_3, i+18,xx,yy, 1, 1, image_angle, image_blend, 1);
				}
		
				if(i >= 9 && i < 12 && isBloomery >= 23) {
					if(isBloomery < 32)
						draw_sprite_ext(s_bloomery_4, i+15,xx,yy, 1, 1, image_angle, $333128, .5);
			
					switch(isBloomery) {
						case 24: draw_sprite_ext(s_bloomery_4, i-9,xx,yy, 1, 1, image_angle, image_blend, 1); break;
						case 25: draw_sprite_ext(s_bloomery_4, i-6,xx,yy, 1, 1, image_angle, image_blend, 1); break;
						case 26: draw_sprite_ext(s_bloomery_4, i-3,xx,yy, 1, 1, image_angle, image_blend, 1); break;
						case 27: draw_sprite_ext(s_bloomery_4, i,xx,yy, 1, 1, image_angle, image_blend, 1); break;
						case 28: draw_sprite_ext(s_bloomery_4, i+3,xx,yy, 1, 1, image_angle, image_blend, 1); break;
						case 29: draw_sprite_ext(s_bloomery_4, i+6,xx,yy, 1, 1, image_angle, image_blend, 1); break;
						case 30: draw_sprite_ext(s_bloomery_4, i+9,xx,yy, 1, 1, image_angle, image_blend, 1); break;
						case 31: draw_sprite_ext(s_bloomery_4, i+12,xx,yy, 1, 1, image_angle, image_blend, 1); break;
					}
				
					if(isBloomery >= 32)
						draw_sprite_ext(s_bloomery_4, i+15,xx,yy, 1, 1, image_angle, image_blend, 1);
				}
			} else if(i >= 6)
				draw_sprite_ext(s_bloomery_5, i,xx,yy, 1, 1, image_angle, image_blend, 1);	
			
			// Drawing bloomery sulfur
			if(isSulfur <= 3 && isSulfur > 0 && i > 0 && i < 3) {
				switch(isSulfur) {
					case 1: draw_sprite_ext(s_bloomery_sulfur, i-1,xx,yy, 1, 1, image_angle, image_blend, 1); break;
					case 2: draw_sprite_ext(s_bloomery_sulfur, i+1,xx,yy, 1, 1, image_angle, image_blend, 1); break;
					case 3: draw_sprite_ext(s_bloomery_sulfur, i+3,xx,yy, 1, 1, image_angle, image_blend, 1); break;
				}
			} else if(isSulfur > 3 && i > 0 && i < 4) {
				draw_sprite_ext(s_bloomery_sulfur, i+5,xx,yy, 1, 1, image_angle, image_blend, 1);
			}
		
			// Drawing bloomery metal
			if(isMetal <= 3 && isMetal > 0 && i > 0 && i < 3) {
				switch(isMetal) {
					case 1: draw_sprite_ext(s_bloomery_metal, i-1,xx,yy, 1, 1, image_angle, image_blend, 1); break;
					case 2: draw_sprite_ext(s_bloomery_metal, i+1,xx,yy, 1, 1, image_angle, image_blend, 1); break;
					case 3: draw_sprite_ext(s_bloomery_metal, i+3,xx,yy, 1, 1, image_angle, image_blend, 1); break;
				}
			} else if(isMetal > 3 && i > 0 && i < 4) {
				draw_sprite_ext(s_bloomery_metal, i+5,xx,yy, 1, 1, image_angle, image_blend, 1);
			}
		
		}
	}

	if(room != r_title && !global.isInventoryOpen && !global.isPaused && !global.minimapFullscreen && (global.interactingObject == -1 || global.interactingObject == self) && position_meeting(mouse_x, mouse_y, self) && collision_circle(o_player.x, o_player.y, 30, self, true, false)) {
	
		// Clicking to load interact
		if(mouse_check_button(global.M_LEFT) && global.interactingLoad < 16 && !options) {
			global.interactingLoad+=1.5;	
			global.interactingObject = self;
		}
		
		// Clicking to interact
		if(mouse_check_button(global.M_LEFT) && global.interactingLoad >= 16) {
			// Opening crate
			options = true;
			optionsX = device_mouse_x_to_gui(0);
			optionsY = device_mouse_y_to_gui(0);
			mouseX = window_mouse_get_x();
			mouseY = window_mouse_get_y();
		
			// Reseting interact stuff
			global.interactingLoad = -1;
		}

	}

	if(options && (!mouse_check_button(global.M_LEFT) || !collision_circle(o_player.x, o_player.y, 30, self, true, false))) {
		options = false;
		global.interactingObject = -1;
		if(window_mouse_get_x() > mouseX + 10) {
			// Open
			global.isCrateOpen = true;
			global.crate = self;
			window_mouse_set(window_get_width()/2, window_get_height()/2.6);
			global.isInventoryOpen = true;
			global.isInventoryOpening = true;
			o_player.isHarvesting = true;
			o_player.alarm[0] = 1;
			o_player.img_frame = 0;
		} else if(window_mouse_get_x() < mouseX - 10) {
			// Upgrade
			/*if(isBloomery == -1) {
				isBloomery = 0;
			} else if(isBloomery == 0) {
				isBloomery = -1;
			} else if(isBloomery > 0 && isBloomery < 32) { // Grabbing rocks
				var rock = instance_create_depth(x+lengthdir_x(-15, image_angle+90),y+lengthdir_y(-15, image_angle+90),depth,o_rocks);
				rock.image_angle = image_angle;
				global.grabbed = rock;
				isBloomery--;
				canAdd = false;
				if(alarm[2] == -1)
					alarm[2] = 30;
			} else*/ if(isBloomery == 32 && (isSulfur > 0 || isMetal > 0)) {
				
				var xx = x + lengthdir_x(-15, image_angle+90);
				var yy = y + lengthdir_y(-15, image_angle+90);
			
				var char = instance_create_depth(xx,yy,depth, o_item);
				char.image_index = item.charcoal;
				char.direction = irandom_range(0,360);
				char.bounce = true;
				char.item_count = isMetal+isSulfur;
			
				var metal = instance_create_depth(xx,yy,depth, o_item);
				metal.image_index = item.metal;
				metal.direction = irandom_range(0,360);
				metal.bounce = true;
				metal.item_count = isMetal;
			
				var sulfur = instance_create_depth(xx,yy,depth, o_item);
				sulfur.image_index = item.sulfur;
				sulfur.direction = irandom_range(0,360);
				sulfur.bounce = true;
				sulfur.item_count = isSulfur;
			
				isSulfur = 0;
				isMetal = 0;
			}
		}
	}
}

if(!global.isCrateOpen && o_player.isHarvesting) {
	o_player.isHarvesting = false;
	o_player.alarm[0] = 1;
	o_player.img_frame = 0;
}