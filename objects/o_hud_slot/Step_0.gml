image_index = 0;

if(room != r_title && !highlighted && collision_point(mouse_x, mouse_y, self, true, false)&&(!global.minimapFullscreen)){
	highlighted = true;
} else if(room != r_title && !collision_point(mouse_x, mouse_y, self, true, false))
	highlighted = false;