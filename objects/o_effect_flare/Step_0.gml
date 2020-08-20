if(startZ == -1)
	startZ = z;

if(angle != -1) {
	x += lengthdir_x(1, angle+irandom_range(135, 225));
	y += lengthdir_y(1, angle+irandom_range(135, 225));
}
	
image_angle++;
z+=.5;
	
if(irandom_range(0,25) == 0 || z > startZ+25)
	instance_destroy(self);
	
lightOff = false;