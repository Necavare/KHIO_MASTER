if(birch && !change) {
	image_index = irandom_range(5,9);
	change = true;
}

if(grass && !change) {
	image_index = irandom_range(10,11);
	change = true;
	vel = 3;
}

if(stick && !change) {
	image_index = irandom_range(18,19);
	change = true;
	vel = 3;
}

if(rock && !change) {
	image_index = irandom_range(20,21);
	change = true;
	vel = 4;
}

if(spark && !change) {
	image_index = irandom_range(22,23);
	change = true;
	vel = 2;
}

if(blood && !change) {
	image_index = irandom_range(12,14);
	change = true;
	vel = 4;
}

if(spurt && !change) {
	image_index = irandom_range(27,29);
	change = true;
	vel = 2;
}

if(snow && !change) {
	image_index = irandom_range(24,26);
	change = true;
	vel = 4;
}

if(drone && !change) {
	image_index = irandom_range(33,36);
	change = true;
	vel = 2;
}

if(grenade && !change) {
	image_index = irandom_range(38,41);
	change = true;
	vel = 1;
}

if(z > 0) {
	x+=lengthdir_x(dist*4, dir_);
	y+=lengthdir_y(dist*4, dir_);
	
	z-=vel;
	
	image_angle+=5;
} else if(spark || snow) {
	instance_destroy(self);
}

if((blood || spurt) && !changeToBlood && z <= 0) {
	image_index+=3;
	changeToBlood = true;
}

if(spark)
	depth = -9000;
	
if(!global.generatingEnvironment && !global.isPaused && o_weather.isSnowing && alarm[0] == -1)
	alarm[0] = room_speed * 5;