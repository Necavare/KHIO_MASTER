z = 40;
dir = -1;

// Making thes snow a random size
switch(irandom_range(0,2)) {
	case 0: image_xscale = 1; image_yscale = 1; break;
	case 1: image_xscale = 1.25; image_yscale = 1.25; break;
	case 2: image_xscale = 1.5; image_yscale = 1.5; break;
}

image_index = irandom(1);