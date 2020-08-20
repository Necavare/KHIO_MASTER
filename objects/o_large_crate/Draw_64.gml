// Drawing item names for the inventory and picked up items
if(!global.generatingEnvironment){
if(!global.isItemPicked && global.crate == self)
	for(var ix = 0; ix < width; ix++)
		for(var iy = 0; iy < height; iy++) {
			if(slots[# ix, iy].highlighted && items[# ix, iy] > 1 && count[# ix, iy] > 0)
				item_title(items[# ix, iy], count[# ix, iy]);
		}
		
if(takeAllSlot.highlighted && global.crate == self)
	draw_title("Take All", 0, -1, -1);
		
if(playerNear && !isOnFire && !options)
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
		draw_title("Open", -1, xx+14, yy-14);
	else
		draw_title("Open", 0, xx+14, yy-14);
		
} 

if(global.isInventoryOpen)
	options = false;

}