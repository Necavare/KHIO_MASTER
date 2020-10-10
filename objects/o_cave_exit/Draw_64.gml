if(!options && collision_circle(o_player.x, o_player.y, 30, self, true, false)) 
	draw_interact();
	
if(options) {
	global.inOptions = true;
	window_mouse_set(window_mouse_get_x(), mouseY);
	
	var xx = optionsX;
	var yy = optionsY;
		
	// Second option
	if(window_mouse_get_x() > mouseX + 66)
		window_mouse_set(mouseX + 66, mouseY);
	
	if(window_mouse_get_x() > mouseX + 10)
		draw_title("Exit", -1, xx+14, yy-14);
	else
		draw_title("Exit", 0, xx+14, yy-14);
		
} 

if(global.isInventoryOpen)
	options = false;