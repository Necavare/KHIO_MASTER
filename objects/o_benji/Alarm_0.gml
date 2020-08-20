if(collision_circle(mouse_x, mouse_y, 5, self, true, false) && name_alpha < 1)
	name_alpha+=.025;
else if(name_alpha > 0)
	name_alpha-=.025;

alarm[0] = 1;