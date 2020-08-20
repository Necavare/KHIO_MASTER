// Inherit the parent event
event_inherited();

var ran = irandom_range(0, 2);

if(ran == 0)
	sprite_index = pole_wire;
else if(ran == 1)
	sprite_index = pole_wire_broken;
else if(ran == 2)
	sprite_index = pole_wire_broken_1;
	
health_ = 0;