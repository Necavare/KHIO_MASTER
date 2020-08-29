//set >= accordingly, this value might make it glitch on small rooms but it will make it happen less often in large rooms
//			only happening when absolutely necessary
if(global.worldShifted = true)
	global.worldShifted = false;

/*
if(roomShiftDelay){
	roomShiftDelayTick++;	
}
if(roomShiftDelay && roomShiftDelayTick  > 5){
*/
if (point_distance(o_player.x, o_player.y, room_center_x, room_center_y) >= (room_height/2)-400  && !global.generatingEnvironment && global.finishedLoading && roomShift){
	roomShiftDelay = false;
	roomShiftDelayTick = 0;
	
	
	global.worldShifted = true;
	global.worldShift = true;
	// shift the whole room
    var xoffset, yoffset;
    xoffset = o_player.x - room_center_x; 
    yoffset = o_player.y - room_center_y;
	
	global.xoffset += xoffset;
	global.yoffset += yoffset;
	
	var tim1 = get_timer();
	instance_activate_all();
	var instShift = 0;
	
	with (all) {
		instShift++;
		x -= xoffset;
        y -= yoffset;
        
		if (y < 0) { y += room_height; }
        if (y >= room_height) { y -= room_height; }
        if (x < 0) { x += room_width; }
        if (x >= room_width) { x -= room_width; }
    }
	//show_debug_message("instances shifted: "+string(instShift));
	
	global.drawLoad = false;
	global.worldShift = false;
	
	/*
	var gridXSize = ds_grid_width(global.smallChunkGrid);
	var gridYSize = ds_grid_height(global.smallChunkGrid);
	for(var gridXP = 0; gridXP < gridXSize; gridXP++){
		for(var gridYP = 0; gridYP < gridYSize; gridYP++){
			var gridList = ds_grid_get(global.smallChunkGrid, gridXP, gridYP);
			var gridListSize = ds_list_size(gridList);
			for(var gridListP = 0; gridListP < gridListSize; gridListP++){
				var gridListInst = ds_list_find_value(gridList, gridListP);	
				//instance_activate_object(gridListInst);
				if(instance_exists(gridListInst)){
					var gridListInstX = gridListInst.x;
					var gridListInstY = gridListInst.y;
				
					//move it and wrap it
					gridListInstX -= xoffset;
					gridListInstY -= yoffset; 
					if (gridListInstY < 0) { gridListInstY += room_height; }
			        if (gridListInstY >= room_height) { gridListInstY -= room_height; }
			        if (gridListInstX < 0) { gridListInstX += room_width; }
			        if (gridListInstX >= room_width) { gridListInstX -= room_width; }
				
					//reset it
					gridListInst.x = gridListInstX;
					gridListInst.y = gridListInstY;
				}
				else
					ds_list_delete(gridList, gridListP);
			}
		}
	}*/
	var tim2 = get_timer();
	//show_debug_message("wrap time : "+string(tim2-tim1));
	
	//instance_deactivate_region(o_camera.x-200, o_camera.y-200, 500, 500, false, true);
	if((room != r_title)) {

		if(setupActivation){
			//imf its seting up the activation queue, set that queue up
			if(instance_exists(o_player))
				ds_queue_enqueue(activationQueue, o_player.id);
			//ds_queue_enqueue(activationQueue, o_player_hitBox.id);
			if(instance_exists(o_shaders))
				ds_queue_enqueue(activationQueue, o_shaders.id);
			if(instance_exists(o_initializer))
				ds_queue_enqueue(activationQueue, o_initializer.id);
			ds_queue_enqueue(activationQueue, id);
			//if(instance_exists(o_weather))
				ds_queue_enqueue(activationQueue, o_weather.id);
			if(instance_exists(o_hud))
				ds_queue_enqueue(activationQueue, o_hud.id);
			if(instance_exists(o_debugger))
				ds_queue_enqueue(activationQueue, o_debugger.id);
			if(instance_exists(o_input))
				ds_queue_enqueue(activationQueue, o_input.id);
	
			setupActivation = false;
		}
		
		instance_deactivate_all(true);
		instance_activate_object(o_debugger);
		instance_activate_region(o_camera.x-200, o_camera.y-200, 500, 500, true);
		
		//find current block

		
		//replaces object activation
		var sizeAQ = ds_queue_size(activationQueue);
		for(var queV = 0; queV < sizeAQ; queV++){
			var queueID = ds_queue_dequeue(activationQueue);
			//show_debug_message("activating: "+string(object_get_name(queueID.object_index)));
			instance_activate_object(queueID);
			ds_queue_enqueue(activationQueue, queueID);
		}
		
		/*
		instance_activate_object(o_generatorF);
		//instance_activate_region(x-200, y-200, 500, 500, true);
		instance_activate_object(o_player);
		instance_activate_object(o_player_hitBox);
		instance_activate_object(o_shaders);	
		instance_activate_object(o_initializer);
		instance_activate_object(o_weather);
		instance_activate_object(o_hud);
		instance_activate_object(o_debugger);
		instance_activate_object(o_input);*/
	}
	//show_debug_message("bruh");
	
		
		//move markers and camp positions back into place
		var xscale = o_hud.mapWidth/room_width;
		var yscale = o_hud.mapHeight/room_height;

		//for all markers
		for(var i = 0; i < 10; i++){
			if(o_hud.markerX[i] != -1){
				//undo the scaling
				var realX = o_hud.markerX[i]/xscale;
				var realY = o_hud.markerY[i]/yscale;
	
				realX -= xoffset;
		        realY -= yoffset;
				if (realY < 0) { realY += room_height; }
		        if (realY >= room_height) { realY -= room_height; }
		        if (realX < 0) { realX += room_width; }
		        if (realX >= room_width) { realX -= room_width; }
		
				o_hud.markerX[i] = realX*xscale;
				o_hud.markerY[i] = realY*yscale;
			}
		}

		//for all enemy camps
		for(var h = 0; h < ds_list_size(global.campIdList); h++){
			var realX = ds_list_find_value(global.campXList, h)/xscale;
			var realY = ds_list_find_value(global.campYList, h)/yscale;
	
			realX -= xoffset;
			realY -= yoffset;
			if (realY < 0) { realY += room_height; }
		    if (realY >= room_height) { realY -= room_height; }
		    if (realX < 0) { realX += room_width; }
		    if (realX >= room_width) { realX -= room_width; }
	
			ds_list_set(global.campXList, h, realX*xscale);
			ds_list_set(global.campYList, h, realY*yscale);
		}
		//for all misc camps
		for(var mc = 0; mc < ds_list_size(global.moundXList); mc++){
			var realX = ds_list_find_value(global.moundXList, mc)/xscale;
			var realY = ds_list_find_value(global.moundYList, mc)/yscale;
	
			realX -= xoffset2;
			realY -= yoffset2;
			
			//if (realY < 0) {realY += room_height; }
			//if (realY >= room_height) { realY -=room_height; }
			//if (realX < 0) {realX += room_width; }
			//if (realX >= room_width) {realX -= room_width; }
			
			ds_list_set(global.moundXList, mc, realX*xscale);
			ds_list_set(global.moundYList, mc, realY*yscale);
		}
		
	
}

/*
if (point_distance(o_player.x, o_player.y, room_center_x, room_center_y) >= (room_height/2)-400  && !global.generatingEnvironment && global.finishedLoading){
	roomShiftDelay = true;
	global.drawLoad = true;
}*/

//if player offset position is over boundries put it back in place


var xoffset2 = 0;
var yoffset2 = 0;
if((o_player.x+global.xoffset) < 0){ 
	global.xoffset+=room_width;
	xoffset2=room_width;	
}
if((o_player.x+global.xoffset) >= room_width) { 
	global.xoffset -= room_width; 
	xoffset2= -room_width;
}
if((o_player.y+global.yoffset) < 0){ 
	global.yoffset += room_height; 
	yoffset2 = room_height;
}
if((o_player.y+global.yoffset) >= room_height) { 
	global.yoffset -= room_height; 
	yoffset2 = -room_height;
}


if((xoffset2 != 0 || yoffset2 != 0) && (!global.loadingWorld) && !global.generatingEnvironment && global.finishedLoading){
	show_debug_message("shifting locations");
	
	//move markers and camp positions back into place
		var xscale = o_hud.mapWidth/room_width;
		var yscale = o_hud.mapHeight/room_height;

		//for all markers
		for(var i = 0; i < 10; i++){
			if(o_hud.markerX[i] != -1){
				//undo the scaling
				var realX = o_hud.markerX[i]/xscale;
				var realY = o_hud.markerY[i]/yscale;
	
				realX -= xoffset2;
		        realY -= yoffset2;

				//if (realY < 0) { realY += room_height; }
				//if (realY >= room_height) { realY -= room_height; }
				//if (realX < 0) {realX += room_width; }
				//if (realX >= room_width) {realX -= room_width;}
				
				o_hud.markerX[i] = realX*xscale;
				o_hud.markerY[i] = realY*yscale;
			}
		}

		//for all enemy camps
		for(var h = 0; h < ds_list_size(global.campIdList); h++){
			var realX = ds_list_find_value(global.campXList, h)/xscale;
			var realY = ds_list_find_value(global.campYList, h)/yscale;
	
			realX -= xoffset2;
			realY -= yoffset2;
			
			//if (realY < 0) {realY += room_height; }
			//if (realY >= room_height) { realY -=room_height; }
			//if (realX < 0) {realX += room_width; }
			//if (realX >= room_width) {realX -= room_width; }
			
			ds_list_set(global.campXList, h, realX*xscale);
			ds_list_set(global.campYList, h, realY*yscale);
		}
		
		//for all misc camps
		for(var mc = 0; mc < ds_list_size(global.moundXList); mc++){
			var realX = ds_list_find_value(global.moundXList, mc)/xscale;
			var realY = ds_list_find_value(global.moundYList, mc)/yscale;
	
			realX -= xoffset2;
			realY -= yoffset2;
			
			//if (realY < 0) {realY += room_height; }
			//if (realY >= room_height) { realY -=room_height; }
			//if (realX < 0) {realX += room_width; }
			//if (realX >= room_width) {realX -= room_width; }
			
			ds_list_set(global.moundXList, mc, realX*xscale);
			ds_list_set(global.moundYList, mc, realY*yscale);
		}

}

if(!global.finishedLoading && !global.generatingEnvironment && !global.loadingWorld && !global.loading){
	alarm[0] = 2;
}