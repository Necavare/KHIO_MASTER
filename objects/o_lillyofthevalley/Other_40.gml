if(!global.watchTower && room != r_title){
	if(!global.generatingEnvironment && !global.generatingGrass
	&& !global.worldShift && !global.loadingWorld && point_distance(x,y,o_camera.x, o_camera.y) > 200)
		instance_deactivate_object(self);
}
else if(global.watchTower && room != r_title) {
	if(!global.generatingEnvironment && !global.generatingGrass
	&& !global.worldShift && !global.loadingWorld && point_distance(x,y,o_camera.x, o_camera.y) > 300)
		instance_deactivate_object(self);
} else if(room == r_title) {
	if(point_distance(x,y,o_camera_title.x, o_camera_title.y) > 300)
		instance_deactivate_object(self);
}