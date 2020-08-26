
// Drawing marker name
if(collision_circle(o_player.x, o_player.y, 50, self, true, false)) {
	draw_set_font(f_hud);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	if(global.hour > 8 && global.hour < 19)
		draw_set_color($333128);
	else
		draw_set_color(c_white);
		
	var xx = x+lengthdir_x(z, -global.camera_angle+90);
	var yy = y+lengthdir_y(z, -global.camera_angle+90);

	if(editNameSelected) {
		if(o_hud.typer && editNameSelected)
			draw_text(x_to_gui(xx,yy), y_to_gui(xx, yy), keyboard_string + "|");
		else
			draw_text(x_to_gui(xx,yy), y_to_gui(xx, yy), keyboard_string);
	} else {
		draw_text(x_to_gui(xx,yy), y_to_gui(xx, yy), o_hud.markerName[index]);
	}
}

draw_health(health_, 5);

// Drawing interact and options
if(!options && !editNameSelected)
	draw_interact();
	
if(options && !editNameSelected) {
		global.inOptions = true;
	window_mouse_set(window_mouse_get_x(), mouseY);
	
	var xx = optionsX;
	var yy = optionsY;
	
	// First option
	if(window_mouse_get_x() < mouseX - 51)
		window_mouse_set(mouseX - 51, mouseY);
	
	if(window_mouse_get_x() < mouseX - 10)
		draw_title("Edit", -1,  xx-51, yy-14);
	else
		draw_title("Edit", 0,  xx-51, yy-14);
	
	// Drawing colors
	if(window_mouse_get_x() > mouseX + 113)
		window_mouse_set(mouseX + 113, mouseY);
		
	// Green
	if(window_mouse_get_x() > mouseX + 9 && window_mouse_get_x() < mouseX + 43)
		draw_sprite_ext(s_minimap_marker, 9, xx+12, yy-11, 1, 1, 0, image_blend, 1);
	else
		draw_sprite_ext(s_minimap_marker, 8, xx+12, yy-11, 1, 1, 0, image_blend, 1);
	
	// Red
	if(window_mouse_get_x() > mouseX + 46 && window_mouse_get_x() < mouseX + 79)
		draw_sprite_ext(s_minimap_marker, 5, xx+37, yy-11, 1, 1, 0, image_blend, 1);
	else
		draw_sprite_ext(s_minimap_marker, 4, xx+37, yy-11, 1, 1, 0, image_blend, 1);
	
	// Blue
	if(window_mouse_get_x() > mouseX + 80)
		draw_sprite_ext(s_minimap_marker, 7, xx+62, yy-11, 1, 1, 0, image_blend, 1);
	else
		draw_sprite_ext(s_minimap_marker, 6, xx+62, yy-11, 1, 1, 0, image_blend, 1);
		
	
		
}

if(global.isInventoryOpen)
	options = false;