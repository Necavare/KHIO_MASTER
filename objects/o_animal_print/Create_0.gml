alarm[0] = room_speed * 5;

//image_angle = -o_rabbit.image_angle;

type = irandom_range(0,image_number-2);

if(type % 2 != 0)
	type--;
	
canDestroy = false;
alarm[1] = 120;