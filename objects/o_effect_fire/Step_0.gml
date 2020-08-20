if(startZ == -1)
	startZ = z;

x += .08;
y += .08;

if(z > startZ + 10 && irandom_range(-2,3) > 1) {
	smoke = true;
	//image_xscale = .8;
	//image_yscale = .8;
	fire_color = irandom_range(2,3);
}

if(!smoke && irandom_range(1,25) == 1)
	instance_destroy(self);
	
if(smoke && irandom_range(1,40) == 1)
	instance_destroy(self);
	
image_angle++;

if(irandom_range(0,100) == 1 && createAsh) {
	instance_create_depth(x,y,depth,o_ash);
	createAsh = false;
} else
	createAsh = false;

if(smoke)
	lightOff = true;
	
if(!smoke) {
	if(irandom_range(0,10) == 0) {
		fire_color = 4;
	}
	else {
		if(z > startZ && z < startZ + 4)
			fire_color = 1;
		else if(z > startZ + 4 && z < startZ + 10)
			fire_color = 0;
		else
			fire_color = 0;
	}
}