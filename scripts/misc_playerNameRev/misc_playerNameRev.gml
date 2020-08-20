/// misc_playerNameRev(index, x, y)
/// @description misc_playerNameRev(index, x, y)
/// @param index
/// @param x
/// @param y
function misc_playerNameRev(argument0, argument1, argument2) {

	//**************************************************
	//	this does the same thing as old only now it is
	//	justt player so that it can be used on objects on
	//			the right of the screen
	//**************************************************

	var index = argument0;
	var name = "player";//if player has its own name we can show it here and that would be cool
	var xp = argument1;
	var yp = argument2;
	var color = c_black;

	var outBoxCol = color;
	var inBoxCol = c_white;

	draw_set_font(f_hud);
	draw_set_color(make_color_rgb(40, 49, 51));
	draw_set_halign(fa_left);

	var startX = xp + 14;
	var startY = yp - 14;

	// Outer rectangle
	draw_rectangle_color(startX - string_width(name) - 12, startY - string_height(name) - 2, startX, startY, outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);

	// Inner rectangle
	draw_rectangle_color(startX - string_width(name) - 8, startY-24, startX - 4, startY - 4, inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);

	//valign
	draw_set_valign(fa_top);

	// Text
	draw_text_transformed(startX - string_width(name) - 4, startY-27, name, 1, 1, 0);

	draw_set_font(f_hud);


}
