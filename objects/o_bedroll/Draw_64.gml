if(!global.generatingEnvironment){
	draw_interact();

	if(options) {
		global.inOptions = true;
		window_mouse_set(window_mouse_get_x(), mouseY);
	
		var xx = optionsX;
		var yy = optionsY;
	
		// First option
		if(window_mouse_get_x() < mouseX - 79)
			window_mouse_set(mouseX - 79, mouseY);
	
		if(window_mouse_get_x() < mouseX - 10)
			draw_title("Pickup", -1,  xx-79, yy-14);
		else
			draw_title("Pickup", 0,  xx-79, yy-14);
		
		// Second option
	if(o_shaders.minute_of_day > 1140 || o_shaders.minute_of_day < 300) {
		if(window_mouse_get_x() > mouseX + 71)
			window_mouse_set(mouseX + 71, mouseY);
	
		if(window_mouse_get_x() > mouseX + 10)
			draw_title("Sleep", -1, xx+14, yy-14);
		else
			draw_title("Sleep", 0, xx+14, yy-14);
	}
		
	} 

	if(global.isInventoryOpen)
		options = false;
}