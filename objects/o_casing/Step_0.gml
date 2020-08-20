if(directionV != 2){
	//spin around
	//var rotation = irandom_range(12,18);
	image_angle += 15;

	//move to the right ->
	if(directionV == 0)
		var rightD =random_range(0,3);
	else if(directionV == 1)
		var rightD = random_range(0,1);
	x+= lengthdir_x(rightD, -camera_get_view_angle(view_camera[0]));
	y+= lengthdir_y(rightD, -camera_get_view_angle(view_camera[0]));
}

//move up or down

//if moving up
if(directionV == 0){
	x+=lengthdir_x(1,-camera_get_view_angle(view_camera[0])+90);
	y+=lengthdir_y(1,-camera_get_view_angle(view_camera[0])+90);
	height++;
}
else if(directionV == 1){
	x+=lengthdir_x(1,+camera_get_view_angle(view_camera[0])-90);
	y+=lengthdir_y(1,+camera_get_view_angle(view_camera[0])-90);
	height--;
}

if(height <= 0){
	directionV = 2;
}


