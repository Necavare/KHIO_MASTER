/*if(!global.generatingEnvironment){
	draw_interact();

	if(options) {
		
		window_mouse_set(device_mouse_x_to_gui(0), optionsY);
	
		var xx = optionsX;
		var yy = optionsY;
		
		// Second option
		//if(o_shaders.minute_of_day > 1140 || o_shaders.minute_of_day < 300) {	
			if(device_mouse_x_to_gui(0) > optionsX + 71)
				window_mouse_set(optionsX + 71, optionsY);
		
			if(device_mouse_x_to_gui(0) > optionsX + 10 && (o_shaders.minute_of_day > 1140 || o_shaders.minute_of_day < 300))
				draw_title("Sleep", -1, xx+14, yy-14);
			else
				draw_title("Sleep", 0, xx+14, yy-14);
		//}
		
	}

	if(global.isInventoryOpen)
		options = false;
}*/
draw_health(health_, 5);