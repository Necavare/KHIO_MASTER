///@description draw_health(health, max_health)
///@param health
///@param max_health
function draw_health(){
	if(instance_exists(o_tool) && collision_circle(x,y, 20, o_tool, true, true) && !global.isInventoryOpen) {
		var health_ = round(argument[0]);
		var max_health = round(argument[1]);
		
		var text = string(health_) + " | " + string(max_health);
		/*if(health_ < 10)
			text = "0" + string(health_) + "|" + string(max_health);
		if(max_health < 10)
			text = string(health_) + "|" + "0" + string(max_health);
		if(health_ < 10 && max_health < 10)
			text = string(health_) + " | " + string(max_health);*/
			
		var xx = x_to_gui(x,y);
		var yy = y_to_gui(x,y);

		var outBoxCol = $333128;
		var inBoxCol = c_white;

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
	}
}

/* // Setting font, color, and position
		draw_set_font(f_hud);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_color($333128);
	
		// Outer rectangle
		draw_rectangle_color(xx-29, yy-14, xx + string_width(string(text))-18, yy + string_height(text) - 13, outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);

		// Inner rectangle
		draw_rectangle_color(xx-26, yy-11, xx + string_width(string(text))-21, yy + string_height(text) - 16, inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);

		// Text
		draw_set_color(outBoxCol);
		draw_text_transformed(xx, yy, text, 1, 1, 0);
	}*/