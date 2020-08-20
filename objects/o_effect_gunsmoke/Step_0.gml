//2.5

//xoffset += .15;
//yoffset += .21;

if(incriment){
	image_xscale += .10;//-5
	image_yscale += .10;//-5
}
else if(deminish){
	image_xscale -= .12;//-5
	image_yscale -= .12;//-5
}
x = global.wepX +lengthdir_x(global.barrelLen, global.wepAngle+90); //keep the right distance from weapon
y = global.wepY +lengthdir_y(global.barrelLen, global.wepAngle+90);
x+= lengthdir_x(4, -camera_get_view_angle(view_camera[0]))+xoffset;
y+= lengthdir_y(4, -camera_get_view_angle(view_camera[0]))+yoffset;
if (z = irandom_range(3,5) || z == 6){
	incriment = false;
	deminish = true;
}
	
if(z >= irandom_range(6,8))
	instance_destroy(self);
if(z > 12)
	instance_destroy(self);
if(smoke && irandom_range(1,25) == 1)
	instance_destroy(self);

if(irandom_range(1,25) == 1)
	instance_destroy(self);
	
//angleoffset+=2;
image_angle = global.wepAngle+90+angleoffset;
//image_angle++;

var nearest = instance_nearest(x,y,o_effect_gunsmoke);
if(smoke || collision_circle(x,y,128,nearest,0,1))
	lightOff = true;