/*
if(createTower) {
	instBotLeftLog = instance_create_depth(x+lengthdir_x(-14, image_angle),y+lengthdir_y(-14, image_angle),depth,o_tower_log);
	instBotLeftLog.image_angle = image_angle;

	instBotRightLog = instance_create_depth(x+lengthdir_x(13, image_angle),y+lengthdir_y(13, image_angle),depth,o_tower_log);
	instBotRightLog.image_angle = image_angle;

	instTopLeftLog = instance_create_depth(x+lengthdir_x(-14, image_angle),y+lengthdir_y(-14, image_angle),depth,o_tower_log);
	instTopLeftLog.x += lengthdir_x(-27, image_angle-90);
	instTopLeftLog.y += lengthdir_y(-27, image_angle-90);
	instTopLeftLog.image_angle = image_angle;

	instTopRightLog = instance_create_depth(x+lengthdir_x(13, image_angle),y+lengthdir_y(13, image_angle),depth,o_tower_log);
	instTopRightLog.x += lengthdir_x(-27, image_angle-90);
	instTopRightLog.y += lengthdir_y(-27, image_angle-90);
	instTopRightLog.image_angle = image_angle;

	instLadder = instance_create_depth(x+lengthdir_x(2, image_angle-90),y+lengthdir_y(2, image_angle-90),depth,o_tower_ladder);
	instLadder.image_angle = image_angle;

	instRoof = instance_create_depth(x,y,depth,o_tower_roof);
	instRoof.image_angle = image_angle;
	
	createTower = false;
}*/
	
if(instLadder.zoomOut) {
	o_player.x = x+lengthdir_x(z,-camera_get_view_angle(view_camera[0])+90)+lengthdir_x(16, image_angle+90);
	o_player.y = y+lengthdir_y(z,-camera_get_view_angle(view_camera[0])+90)+lengthdir_y(16, image_angle+90);
	o_player.depth = depth - 1;
	playerGround = true;
} if(playerGround && !instLadder.zoomOut) {
	o_player.x = instLadder.x+lengthdir_x(12, image_angle-90);
	o_player.y = instLadder.y+lengthdir_y(12, image_angle-90);
	playerGround = false;
}

instRoof.depth = depth - 1;

if(instBotLeftLog.isBuilt && instBotRightLog.isBuilt && instTopLeftLog.isBuilt && instTopRightLog.isBuilt)
	instLadder.canClimb = true;
else
	instLadder.canClimb = false;
	
if(instBotLeftLog.isBuilt || instBotRightLog.isBuilt || instTopLeftLog.isBuilt || instTopRightLog.isBuilt)
	canPickup = false;

if(buildZ < 0)
	buildZ+=.5;