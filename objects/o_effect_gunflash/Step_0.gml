//2.5

//xoffset += .15;
//yoffset += .21;

if(incriment){
image_xscale -= .10;
image_yscale -= .10;
}
else if(deminish){
	image_xscale -= .15;
	image_yscale -= .15;
}
if(instance_exists(o_weapon)){
	x = o_weapon.x+lengthdir_x(o_weapon.barrellength, o_weapon.image_angle+90); //keep the right distance from weapon
	y = o_weapon.y+lengthdir_y(o_weapon.barrellength, o_weapon.image_angle+90);
	x+= lengthdir_x(3, -camera_get_view_angle(view_camera[0]))+xoffset;
	y+= lengthdir_y(3, -camera_get_view_angle(view_camera[0]))+yoffset;
}
if (z = irandom_range(3,4) || z == 5){
	incriment = false;
	deminish = true;
}
	
if(z >= irandom_range(6,8))
	instance_destroy(self);
if(z>8)
	instance_destroy(self);
	
if(smoke && irandom_range(1,25) == 1)
	instance_destroy(self);

//angleoffset+=2;
if(instance_exists(o_weapon))
	image_angle = o_weapon.image_angle+90+angleoffset;
//image_angle++;