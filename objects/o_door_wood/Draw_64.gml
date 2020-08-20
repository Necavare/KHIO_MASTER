if(!global.generatingEnvironment && canInteract){
	
	draw_interact();

	if(options) {
		global.inOptions = true;
		window_mouse_set(window_mouse_get_x(), mouseY);
	
		var xx = optionsX;
		var yy = optionsY;
		
		if(!isLocked) {
			// Second option
			if(window_mouse_get_x() > mouseX + 66)
				window_mouse_set(mouseX + 66, mouseY);
	
			if(window_mouse_get_x() > mouseX + 10)
				draw_title("Lock", -1, xx+14, yy-14);
			else
				draw_title("Lock", 0, xx+14, yy-14);
		} else {
			// Second option
			if(window_mouse_get_x() > mouseX + 66)
				window_mouse_set(mouseX + 66, mouseY);
	
			if(window_mouse_get_x() > mouseX + 10)
				draw_title("Unlock", -1, xx+14, yy-14);
			else
				draw_title("Unlock", 0, xx+14, yy-14);
		}
		
	} 

	if(global.isInventoryOpen || global.isPaused)
			options = false;
		
}