if(startZ == -1)
	startZ = z;

//x += irandom_range(-.9,.9);
//y += irandom_range(-.9,.9);

image_alpha -= .05;

if(irandom_range(1,25) == 1)
	instance_destroy(self);
	
image_angle++;