z-=.8;

if(z <= 0)
	instance_destroy(self);
	
switch(dir) { // 0 = up, 1 = left, 2 = down, 3 = right
	case 0: y+=.5; break;
	case 1:	x-=.5; break;
	case 2: y-=.5; break;
	case 3:	x+=.5; break;
}
	
depth = -9000;