fire_color = -1;
switch(irandom_range(0,2)) {
	case 0: fire_color = 0; break;
	case 1: fire_color = 1; break;
	case 2: fire_color = 4; break;
}

z = 0;
startZ = -1;

smoke = false;

createAsh = true;

event_inherited();