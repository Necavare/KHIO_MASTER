if(!global.generatingEnvironment) {
	for (var i = 0; i < image_number; i+=.8) {
		var xx = x+lengthdir_x(i+z,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(i+z,-camera_get_view_angle(view_camera[0])+90);
	
		var sx = x+lengthdir_x(0,-camera_get_view_angle(view_camera[0])+90);
		var sy = y+lengthdir_y(0,-camera_get_view_angle(view_camera[0])+90);
		
		// Drawing anvil
		draw_sprite_ext(sprite_index, i,xx,yy, 1, .8, image_angle, image_blend, global.alpha);
	
		// Drawing shadow
		if(i == 0 && global.grabbed == self)
			draw_sprite_ext(sprite_index, 3,sx,sy, 1, .8, image_angle, c_black, .1);
	}
	
	// Dragging and dropping
	if(!global.isInventoryOpen && !global.isPaused && !o_hud.mapOpen && collision_circle(o_player.x, o_player.y, 50, self, true, false) && !global.isInventoryOpen && !global.isHolding) {
		if(mouse_check_button(global.M_LEFT) && position_meeting(mouse_x, mouse_y, self) && global.grabbed == -1 && global.duraEquipped <= 0) {
			global.grabbed = self;
			dropPlayed = false;
		} else if(!mouse_check_button(global.M_LEFT) && global.grabbed == self && place_free(x,y))
			global.grabbed = -1;
	}
}