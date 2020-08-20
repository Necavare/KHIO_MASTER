if(image_alpha <= 0)
	instance_destroy(self);

image_alpha -= .01;

alarm[4] = 1;