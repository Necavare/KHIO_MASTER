//remove it from queue in camera
var weaponId = id;
//if(instance_exists(o_camera)){
	with(o_camera){
	var sizeAQ = ds_queue_size(activationQueue);
		for(var queV = 0; queV < sizeAQ; queV++){
			var queueID = ds_queue_dequeue(activationQueue);
			//show_debug_message("activating: "+string(object_get_name(queueID.object_index)));
			if(queueID != weaponId)
				ds_queue_enqueue(activationQueue, queueID);
		}
	}
//}