show_debug_message("moundNum: "+string(moundNum));

ds_queue_destroy(floorQueue);
ds_queue_destroy(floorHouseQueue);
ds_queue_destroy(floorActiveQueue);
ds_queue_destroy(floorActiveHouseQueue);
ds_queue_destroy(activationQueue);

ds_list_destroy(enemyCampR_list);
ds_list_destroy(enemyCampX_list);
ds_list_destroy(enemyCampY_list);

show_debug_message("generatorStepNEw destroyed");
global.canMove = true;
with(o_camera){
	instance_deactivate_all(true);
	instance_activate_region(o_camera.x-200, o_camera.y-200, 500, 500, true);
	
	/*
	//replaces the commented out section below
	var sizeAQ = ds_queue_size(activationQueue);
	for(var queV = 0; queV < sizeAQ; queV++){
		var queueID = ds_queue_dequeue(activationQueue);
		//show_debug_message("activating: "+string(object_get_name(queueID.object_index)));
		instance_activate_object(queueID);
		ds_queue_enqueue(activationQueue, queueID);
	}*/
	instance_activate_object(o_player);
	
	o_player.isRolling = false;
	o_player.hunger_ = 100;
			
			
	instance_activate_object(o_player_hitBox);
	instance_activate_object(o_shaders);	
	instance_activate_object(o_initializer);
	instance_activate_object(o_weather);
	instance_activate_object(o_hud);
	//instance_activate_object(o_debugger);
	instance_activate_object(o_input);
}
		
//unset global offset
global.xoffset = 0;
global.yoffset = 0;

with(o_hud){
	scr_merge_map(global.blockArr, mapWidth, mapHeight);
}
o_shaders.minute_of_day = 400;

o_hud.initialLoadSave = true;
o_hud.alarm[11] = 1;
global.finishedLoading = true;