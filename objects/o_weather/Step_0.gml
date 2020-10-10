//check offset to keep it in line
/*
if(cloudXOffset > sprite_width)
	cloudXOffset = -(sprite_width/2);
if(cloudYOffset > sprite_height)
	cloudYOffset = -(sprite_height/2);
if(cloudXOffset < -sprite_width)
	cloudXOffset = -(sprite_width/2);
if(cloudYOffset < -sprite_height)
	cloudYOffset = -(sprite_height/2);
*/

if(instance_exists(o_player) && point_distance(cloudX, cloudY, o_player.x, o_player.y) >= 1000){
	cloudX = o_player.x-500;
	cloudY = o_player.y-500;
	fadeInClouds = true;
	alpha = 0;
}
if(fadeInClouds){
	alpha+=0.0001;
	if(alpha >= 0.02){
		fadeInClouds = false;
		alpha = 0.02;
	}
}
// Clouds
cloudX += .1;
cloudY += .05;

// Snow
if(isSnowing) {
	repeat(5) {
		var snow = instance_create_depth(irandom_range(o_camera.x-150,o_camera.x+150), irandom_range(o_camera.y-150,o_camera.y+150), depth, o_snow);
		snow.dir = dir;
	}
	
	if(alarm[0] == -1)
		alarm[0] = 60 * irandom_range(30, 60);
} else {
	alarm[0] = -1;
}

if(room == r_cave)
	isSnowing = false;