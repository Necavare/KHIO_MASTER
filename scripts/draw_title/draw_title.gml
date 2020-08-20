///@description draw_title(text, count, x, y);
/// @param text
/// @param count
/// @param x
/// @param y
function draw_title() {
	var text = argument[0];
	var count = argument[1];
	var xx = argument[2];
	var yy = argument[3];

	if(text == "")
		text = " ";

	if(argument[2] == -1 && argument[3] == -1) {
		xx = device_mouse_x_to_gui(0) + 14;
		yy = device_mouse_y_to_gui(0) - 14;
	}

	if(count == -1) {
		var outBoxCol = c_white;
		var inBoxCol = $333128;
	} else {
		var outBoxCol = $333128;
		var inBoxCol = c_white;
	}

	// Setting font, color, and position
	draw_set_font(f_hud);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color($333128);
	
	// Outer rectangle
	draw_rectangle_color(xx-3, yy+1, xx + string_width(text) + 6, yy + string_height(text), outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);

	// Inner rectangle
	draw_rectangle_color(xx, yy+4, xx + string_width(text) + 3, yy + string_height(text) - 3, inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);

	// Text
	draw_set_color(outBoxCol);
	draw_text_transformed(xx+3, yy+1, text, 1, 1, 0);

	if(count > 0) {
		// Outer rectangle
		draw_rectangle_color(xx-2, yy-27, xx + string_width(string(count))+6, yy-3, outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);
		// Inner rectangle
		draw_rectangle_color(xx+1, yy-24, xx + string_width(string(count))+3, yy-6, inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);
		// Count
		draw_set_color(outBoxCol);
		draw_text(xx+3, yy-27, string(count));
	}


}
