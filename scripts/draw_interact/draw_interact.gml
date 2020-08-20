function draw_interact() {
	// Drawing interact sprite and grabbing
	if(global.hints && !position_meeting(mouse_x, mouse_y, self) && collision_circle(o_player.x, o_player.y, 50, self, true, false) 
	&& !global.isInventoryOpen && global.grabbed == -1 && !global.isCrateOpen && room != r_title && !o_player.isHoldingTool
	 && (!o_player.isSleeping && !o_player.isSitting) && !instance_exists(o_builder)) {
		var xx = x+lengthdir_x(1,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(1,-camera_get_view_angle(view_camera[0])+90);
		draw_sprite_ext(s_interact1, o_hud.typer, x_to_gui(xx,yy), y_to_gui(xx,yy), 3, 3, 0, image_blend, global.alpha);	
	}

	if(position_meeting(mouse_x, mouse_y, self) && collision_circle(o_player.x, o_player.y, 50, self, true, false) 
	&& !global.isInventoryOpen && global.grabbed == -1 && !global.isCrateOpen && room != r_title && !o_player.isHoldingTool
	 && (!o_player.isSleeping && !o_player.isSitting) && !instance_exists(o_builder)) {
		var xx = x+lengthdir_x(1,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(1,-camera_get_view_angle(view_camera[0])+90);
		draw_sprite_ext(s_interact, o_hud.typer, x_to_gui(xx,yy), y_to_gui(xx,yy), 3, 3, 0, image_blend, global.alpha);	
	} 


}
