if(isBloomery != -1 && canAdd) {
	switch(other.stackCount) {
		case 0: if(isBloomery < 32) { isBloomery++; instance_destroy(other); global.grabbed = -1; } break;
		case 1: if(isBloomery < 31) { isBloomery+=2; instance_destroy(other); global.grabbed = -1; }  else { isBloomery++; other.stackCount--; }break;
		case 2: if(isBloomery < 30) { isBloomery+=3; instance_destroy(other); global.grabbed = -1; }  else { isBloomery++; other.stackCount--; } break;
	}
}