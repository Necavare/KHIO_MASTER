//show_debug_message("destroy shed");
if(instance_exists(instBackWall))
	instance_destroy(instBackWall);
if(instance_exists(instBR))
	instance_destroy(instBR);
if(instance_exists(instBL))
	instance_destroy(instBL);
if(instance_exists(instFR))
	instance_destroy(instFR);
if(instance_exists(instFL))
	instance_destroy(instFL);
if(instance_exists(instDoor))
	instance_destroy(instDoor);
if(instance_exists(instBackWall))
	instance_destroy(instBackWall);
if(instance_exists(instFloor))
	instance_destroy(instFloor);//destroy the roof attacked with this
if(instance_exists(instLeftSide))
	instance_destroy(instLeftSide);
if(instance_exists(instRightSide))
	instance_destroy(instRightSide);

event_inherited();