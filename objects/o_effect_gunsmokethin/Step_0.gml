image_xscale -= 0.0025;
image_yscale -= 0.0025;
if(image_xscale < 0)
	image_xscale = 0;
xoffset += .05;
yoffset += .07;
//image_xscale -= .08;
//image_yscale -= .08;

x = global.wepX+lengthdir_x(global.barrelLen, global.wepAngle+90); //keep the right distance from weapon
y = global.wepY+lengthdir_y(global.barrelLen, global.wepAngle+90);
x+= lengthdir_x(3, -camera_get_view_angle(view_camera[0]))+xoffset;
y+= lengthdir_y(3, -camera_get_view_angle(view_camera[0]))+yoffset;

if(z >= irandom_range(25,30))
	instance_destroy(self);
	
if(smoke && irandom_range(1,25) == 1)
	instance_destroy(self);
	
if(irandom_range(1,25) == 1)
	instance_destroy(self);

angleoffset++;
image_angle = global.wepAngle+90+angleoffset;
//image_angle++;