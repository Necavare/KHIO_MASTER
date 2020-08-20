if(isTutorial && global.isTutorial) {
	var xx = x+lengthdir_x(1, -global.camera_angle+90);
	var yy = y+lengthdir_y(1, -global.camera_angle+90);

	draw_set_font(f_hud);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	if(o_hud.typer)
		draw_set_color($333128);
	else
		draw_set_color(c_white);

	draw_text(x_to_gui(xx,yy), y_to_gui(xx, yy), "Pickup Axe");
}