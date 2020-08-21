var angle = -camera_get_view_angle(view_camera[0])+90;
	
var xx = x + lengthdir_x(0,angle);
var yy = y + lengthdir_y(0,angle);
	
draw_sprite_ext(sprite_index, type, xx,yy, image_xscale, image_yscale, image_angle, image_blend, global.alpha);

if(room != r_title && !global.isInventoryOpen && !global.isPaused && !o_hud.mapOpen && !o_player.isHoldingTool && position_meeting(mouse_x, mouse_y, self) && collision_circle(o_player.x, o_player.y, 50, self, true, false) && !global.isInventoryOpen && global.grabbed == -1 && !global.isHolding) {
	
	// Clicking to interact
	if(mouse_check_button(global.M_LEFT)) {
		repeat(1) {
			spawnCount++;
			var stick = instance_create_depth(x,y,depth, o_item);
			stick.item_ = item.stick;
			
			stick.direction = irandom_range(0,360);
			stick.fountain = true;
			stick.wait = true;
		
			stick.alarm[3] = spawnCount* 6;
			
			o_camera.shake = 2;
		}
		
		audio_emitter_position(emitter, x, y, 0);
		
		audio_play_sound_on(emitter, sn_bush_hit_2, 0, 1);
			
		instance_destroy(self);
	}

}