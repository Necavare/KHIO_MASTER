#region Depth

// With all objects
with(all)
	depth = -y;

#endregion

#region Movement

if(o_player.isSitting) {
	
if(!isMoving)
{
	x = target_x;
	y = 128;
	
	gx = device_mouse_x_to_gui(0) - 960;
	gy = device_mouse_y_to_gui(0) - 540;
	
	y += gy / 80;
	x += gx / 80;
}

if(isMoving)
{
	if(x > target_x)
		x -= 32;
	else if(x < target_x)
		x += 32;
	else if(x == target_x)
		isMoving = false;
}

} else if(!o_player.isSitting) {
	x += (o_player.x-x)*.025;
	y += (o_player.y-y)*.025; 
	global.canMove = true;
}

#endregion

instance_deactivate_all(true);
instance_activate_region(o_camera_title.x-200, o_camera_title.y-200, 500, 500, true);
instance_activate_object(o_player);
instance_activate_object(o_title_hud);
instance_activate_object(o_shaders);	
instance_activate_object(o_initializer);