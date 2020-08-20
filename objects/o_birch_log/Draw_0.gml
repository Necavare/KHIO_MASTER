for (var i = 0; i < image_number; i+=.6)
{
	var xx = x+lengthdir_x(i+z,-camera_get_view_angle(view_camera[0])+90);
	var yy = y+lengthdir_y(i+z,-camera_get_view_angle(view_camera[0])+90);
	
	var sx = x+lengthdir_x(0,-camera_get_view_angle(view_camera[0])+90);
	var sy = y+lengthdir_y(0,-camera_get_view_angle(view_camera[0])+90);
	
	// Drawing log
	draw_sprite_ext(sprite_index, i,xx,yy, 1, .8, image_angle, image_blend, global.alpha);
	
	// Drawing shadow
	if(i == 0 && global.grabbed == self)
		draw_sprite_ext(sprite_index, 1,sx,sy, 1, .8, image_angle, c_black, .1);
}

if(stackCount > 0) {
	if(birch)
	for (var i = 0; i < image_number; i+=.6) {
		var xx = x+lengthdir_x(i+z+4,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(i+z+4,-camera_get_view_angle(view_camera[0])+90);
		draw_sprite_ext(sprite_index, i,xx,yy, 1, .8, image_angle, image_blend, global.alpha);
	}
	if(spruce)
	for (var i = 0; i < image_number; i+=1) {
		var xx = x+lengthdir_x(i+z+4,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(i+z+4,-camera_get_view_angle(view_camera[0])+90);
		draw_sprite_ext(s_spruce_log, i,xx,yy, 1, 1, image_angle, image_blend, global.alpha);
	}
}

if(!global.isInventoryOpen && !global.isPaused && !o_hud.mapOpen && collision_circle(o_player.x, o_player.y, 50, self, true, false) && !global.isInventoryOpen && !isOnFire && !global.isHolding) {
	
	if(mouse_check_button_pressed(global.M_LEFT) && position_meeting(mouse_x, mouse_y, self) && global.grabbed == -1 && global.duraEquipped <= 0) {
		audio_emitter_position(log, x, y, 0);
		audio_play_sound_on(log, sn_log_stack, 0, 1);
		dropPlayed = false;
	}
		
	// Dragging and dropping
	if(mouse_check_button(global.M_LEFT) && position_meeting(mouse_x, mouse_y, self) && global.grabbed == -1 && global.duraEquipped <= 0)
		global.grabbed = self;
	else if(!mouse_check_button(global.M_LEFT) && global.grabbed == self && place_free(x,y))
		global.grabbed = -1;

}