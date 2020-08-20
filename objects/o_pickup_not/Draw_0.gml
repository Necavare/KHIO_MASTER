if(o_hud.showHud) {
	var px = o_player.x;
	var py = o_player.y;

	// Drawing the item floating
	var xx = px+lengthdir_x(z,-camera_get_view_angle(view_camera[0])+90);
	var yy = py+lengthdir_y(z,-camera_get_view_angle(view_camera[0])+90);

	// Drawing sprite
	draw_sprite_ext(sprite_index, item_, xx, yy, .6, .6, image_angle, image_blend, image_alpha);
}