// Checking if mouse is moving
if(gx != device_mouse_x_to_gui(0) || gy != device_mouse_y_to_gui(0)) {
	mouseMoving = true;
	gx = device_mouse_x_to_gui(0);
	gy = device_mouse_y_to_gui(0);
} else
	mouseMoving = false;