///@description converts world y coordinate to gui y coordinate
///@param x
///@param y
function y_to_gui() {
	var xx = argument[0];
	var yy = argument[1];

	// Width and height of view
	var cw = camera_get_view_width(view_camera[0]);
	var ch = camera_get_view_height(view_camera[0]);
	// Display GUI scale
	var display_scaley = display_get_gui_height()/ch;
	// Camera coords
	var cx = camera_get_view_x(view_camera[0]);
	var cy = camera_get_view_y(view_camera[0]);
	// Getting distance and direction
	var distance = point_distance(cx+(cw/2), cy+(ch/2), xx, yy);
	var dir = point_direction(cx+(cw/2), cy+(ch/2), xx, yy)+camera_get_view_angle(view_camera[0]);
	// Final points in gui
	return ((ch/2) + lengthdir_y(distance, dir))*display_scaley;


}
