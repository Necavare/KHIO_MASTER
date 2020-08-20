//image_xscale = 0.25;
//image_yscale = 1;
bulletdamage = 2;
if(instance_exists(o_weapon)){
	image_angle = o_weapon.fireangle;
	bulletfirex = o_weapon.firex;
	bulletfirey = o_weapon.firey;
}
else
	instance_destroy(self);
doOnce = true;