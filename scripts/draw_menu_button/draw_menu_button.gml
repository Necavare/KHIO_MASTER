/// @description draw_menu_button(x, y, string, background, highlighted);
/// @param x
/// @param y
/// @param string
/// @param background
/// @param highlighted
function draw_menu_button(argument0, argument1, argument2, argument3, argument4) {
	var xx = argument0;
	var yy = argument1;
	var text = argument2;
	var background = argument3;
	var highlighted = argument4;

	if(background) {
		draw_set_color(c_black);
		if(global.loading)
			draw_set_alpha(global.menuAlpha-.9);
		else
			draw_set_alpha(.1);
		draw_rectangle(xx - 10, yy - 15, xx + string_width(text) + 8, yy + 15, false);
	}

	draw_set_alpha(global.menuAlpha);

	if(highlighted)
		draw_set_color(c_white);
	else
		draw_set_color($333128);

	draw_text(xx, yy, text);


}
