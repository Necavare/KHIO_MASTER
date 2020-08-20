if(global.watchTower) {
	// Setting the camera view size
	camera_set_view_size(view_camera[0], o_initializer.ideal_width*2, o_initializer.ideal_height*2);
	camera_set_view_pos(view_camera[0], o_camera.x - o_initializer.ideal_width, o_camera.y - o_initializer.ideal_height);
} else {
	camera_set_view_size(view_camera[0], o_initializer.ideal_width, o_initializer.ideal_height);
}
