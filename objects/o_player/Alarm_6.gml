isHit = false;

repeat(8) {
	var blood = instance_create_depth(x, y, depth, o_particles);
		blood.spurt = true;
		var angle = -global.camera_angle-90;
		blood.dir_ = irandom_range(angle-30, angle+30);
}