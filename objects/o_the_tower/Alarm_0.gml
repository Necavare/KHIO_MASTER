if(collision_circle(mouse_x, mouse_y, 5, self, true, false) && image_alpha < 1)
	image_alpha+=.01;
else if(image_alpha > 0)
	image_alpha-=.01;

alarm[0] = 1;