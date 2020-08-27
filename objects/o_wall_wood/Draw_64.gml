if(!global.generatingEnvironment){
	// Drawing interact sprite
if(!options && !isOnFire && !isCamp && logs >= 5)
	draw_interact();
	
if(options) {
	global.inOptions = true;
	window_mouse_set(window_mouse_get_x(),mouseY);
	
	var xx = optionsX;
	var yy = optionsY;
	
	// First option
	if(logs >= 5 && !upgraded) {
		if(window_mouse_get_x() > mouseX + 99)
			window_mouse_set(mouseX + 99, mouseY);
	
		if(window_mouse_get_x() > mouseX + 10) {
			draw_title("Upgrade", -1, xx+14, yy-14);
			item_title(-7, -1);
			recipe_title("metalWall");
		} else
			draw_title("Upgrade", 0, xx+14, yy-14);
			
	} else if(logs >= 5 && upgraded) {
		if(window_mouse_get_x() > mouseX + 84)
			window_mouse_set(mouseX + 84, mouseY);
	
		if(window_mouse_get_x() > mouseX + 10)
			draw_title("Rotate", -1, xx+14, yy-14);
		else
			draw_title("Rotate", 0, xx+14, yy-14);
	}
		
} 

if(upgraded)
	draw_health(health_, 25);
else
	draw_health(health_, 20);

if(global.isInventoryOpen || isCamp)
	options = false;
}