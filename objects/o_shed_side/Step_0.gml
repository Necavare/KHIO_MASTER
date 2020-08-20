if(!global.generatingEnvironment && instance_exists(instChest)){
	if(createChest) {
		sprite_index = s_shed_side_window;
		instChest = instance_create_depth(x+lengthdir_x(-5, image_angle),y+lengthdir_y(-5, image_angle),depth,o_small_crate);
		instChest.sprite_index = s_small_crate_birch;
		instChest.image_angle = image_angle-90;
		instChest.isShed = true;
		instChest.isCamp = true;
		createChest = false;
	}

	if(global.playerInBuilding)
		instChest.playerNear = true;
	else
		instChest.playerNear = false;
}