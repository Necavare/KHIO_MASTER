if(startZ == -1)
	startZ = z;
	
image_angle++;

var ran = irandom_range(1, 3);

image_xscale = 1+(ran/10);
image_yscale = 1+(ran/10);

depth = o_player.depth + 1;