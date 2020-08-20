//show_debug_message("firepit destroyed");

for(var ix = 0; ix < width; ix++){
	for(var iy = 0; iy < height; iy++) {
		instance_destroy(slots[# ix, iy]);
	}
}

event_inherited();