draw_self_3d(0);

if(room != r_title && !global.isInventoryOpen && !global.isPaused && !o_hud.mapOpen && position_meeting(mouse_x, mouse_y, self) && collision_circle(o_player.x, o_player.y, 50, self, true, false) && !global.isInventoryOpen && global.grabbed == -1 && !global.isHolding && !o_player.isHoldingTool) {
	
	// Clicking to interact
	if(mouse_check_button(global.M_LEFT)) { //  && global.interactingLoad >= 16

		audio_emitter_position(rockEmitter, x, y, 0);
		switch(irandom_range(0,1)) {
			case 0: audio_play_sound_on(rockEmitter, sn_rock_pickup_2, 0, 1); break;
			case 1: audio_play_sound_on(rockEmitter, sn_rock_pickup_1, 0, 1); break;
		}
		
		repeat(1) {
			spawnCount++;
			var rock = instance_create_depth(x,y,depth, o_item);
			rock.item_ = item.rock; break;
			
			rock.direction = irandom_range(0,360);
			rock.fountain = true;
			rock.wait = true;
		
			rock.alarm[3] = spawnCount* 6;
			
			o_camera.shake = 2;
		}
		
		instance_destroy(self);
	}

}