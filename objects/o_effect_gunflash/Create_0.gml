if(instance_exists(o_weapon))
	fireangle = o_weapon.fireangle;
else
	instance_destroy(self);
fire_color = irandom_range(0,3);
z = 0;
smoke = true;
xoffset = 0;
yoffset = 0;
angleoffset = 0;
incriment = true;
deminish = false;
image_xscale = 1;
image_yscale = 1;
//basex = x;
//basey = y;
//image_xscale-=.32;
//image_yscale-=.32;