///@description draw_titleRightAlligned(text, count,  x, y);
/// @param text
/// @param count
/// @param x
/// @param y
function draw_titleRightAlligned(argument0, argument1, argument2, argument3) {


	var text = argument0;//if player has its own name we can show it here and that would be cool
	var count = argument1;
	var xp = argument2;
	var yp = argument3;
	//var color = c_black;

	//var outBoxCol = color;
	//var inBoxCol = c_white;


	if(count == -1) {
		var outBoxCol = c_white;
		var inBoxCol = $333128;
	} else {
		var outBoxCol = $333128;
		var inBoxCol = c_white;
	}

	// Setting font, color, and position
	draw_set_font(f_hud);
	draw_set_color($333128);
	draw_set_valign(fa_top);
	draw_set_halign(fa_right);

	var startX = xp;
	var startY = yp;

	//outser rectangle
	draw_rectangle_color(startX - string_width(text) - 8, startY - 2, startX+3, startY + string_height(text), outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);

	//inner rectangle
	draw_rectangle_color(startX- string_width(text) - 4, startY + 2, startX -1, startY - 4 + string_height(text), inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);

	draw_set_color(outBoxCol);
	draw_text_transformed(startX, startY, text, 1, 1, 0);
	// Outer rectangle
	//draw_rectangle_color(startX - string_width(text) - 12, startY - string_height(text) - 2, startX, startY, outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);

	// Inner rectangle
	//draw_rectangle_color(startX - string_width(text) - 8, startY-24, startX - 4, startY - 4, inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);

	//valign
	//draw_set_valign(fa_top);

	// Text
	//draw_text_transformed(startX - string_width(text) - 4, startY-27, text, 1, 1, 0);

	draw_set_font(f_hud);


}
