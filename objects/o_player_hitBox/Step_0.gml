if(instance_exists(o_debugger) && o_debugger.debuggerOpen)
	visible=true;
else
	visible = false;
	
x=o_player.x;
y=o_player.y;
image_angle = -global.camera_angle;
image_alpha = 0.8;
image_xscale = 0.6;
image_yscale = 0.6;