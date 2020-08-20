// Drawing text
var xx = x+lengthdir_x(-12, -global.camera_angle+90);
var yy = y+lengthdir_y(-12, -global.camera_angle+90);
draw_set_font(f_hud);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

draw_set_color($333128);
	
draw_set_alpha(name_alpha);
draw_text(x_to_gui(xx, yy), y_to_gui(xx, yy), "Benji");

draw_set_alpha(1);