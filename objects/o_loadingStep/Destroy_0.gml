global.loadingWorld = false;
global.generatingEnvironment = false;

with(o_camera){
	//instance_deactivate_all(true);
	
	
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
			
	instance_activate_object(o_player_hitBox);
	instance_activate_object(o_shaders);	
	instance_activate_object(o_initializer);
	instance_activate_object(o_weather);
	instance_activate_object(o_hud);
	instance_activate_object(o_debugger);
	instance_activate_object(o_input);
	
	if(instance_exists(o_player))
		ds_queue_enqueue(activationQueue, o_player.id);
	if(instance_exists(o_player_hitBox))
		ds_queue_enqueue(activationQueue, o_player_hitBox.id);
	else{
		var pHitBox = instance_create_depth(o_player.x,o_player.y,1,o_player_hitBox)	
		ds_queue_enqueue(activationQueue, pHitBox);
	}
	if(instance_exists(o_shaders))
		ds_queue_enqueue(activationQueue, o_shaders.id);
	if(instance_exists(o_initializer))
		ds_queue_enqueue(activationQueue, o_initializer.id);
	ds_queue_enqueue(activationQueue, id);
	ds_queue_enqueue(activationQueue, o_weather.id);
	//if(instance_exists(o_weather))
	if(instance_exists(o_hud))
	ds_queue_enqueue(activationQueue, o_hud.id);
	if(instance_exists(o_debugger)){
		show_debug_message("adding debugger");
		ds_queue_enqueue(activationQueue, o_debugger.id);
	}if(instance_exists(o_input))
	ds_queue_enqueue(activationQueue, o_input.id);
	
}

with(o_hud){
	scr_merge_map(global.blockArr, mapWidth, mapHeight);
}

//global.finishedLoading = true;