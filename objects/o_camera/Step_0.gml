if(global.finishedLoading){
	show_debug_message("globalXoffset: "+string(global.xoffset));
	show_debug_message("globalYoffset: "+string(global.yoffset));
}

global.cameraSetupDone = setupActivation;

if(deactivateFrame < 60)
	deactivateFrame++;
else
	deactivateFrame = 0;

#region Moving camera towards player

if((global.itemEquipped == item.rifle || global.itemEquipped == item.crossbow) && !global.isInventoryOpen) {
	if(global.isAiming) {
		var xTo = o_player.x+lengthdir_x(90, -global.camera_angle+90);
		var yTo = o_player.y+lengthdir_y(90, -global.camera_angle+90);
	} else {
		var xTo = o_player.x+lengthdir_x(40, -global.camera_angle+90);
		var yTo = o_player.y+lengthdir_y(40, -global.camera_angle+90);
	}

	x += (xTo-x)*.25;
	y += (yTo-y)*.25; 
} else if((instance_exists(o_tool) || global.itemEquipped == item.shotgun) && !global.isInventoryOpen) {
	var xTo = o_player.x+lengthdir_x(20, -global.camera_angle+90);
	var yTo = o_player.y+lengthdir_y(20, -global.camera_angle+90);
	
	x += (xTo-x)*.25;
	y += (yTo-y)*.25; 
} else {
	var xTo = o_player.x;
	var yTo = o_player.y;
	
	x += (xTo-x)*.25;
	y += (yTo-y)*.25; 
}

// Shaking the screen if shake is set above 0.
x += random_range(-shake, shake);
y += random_range(-shake, shake);
shake *= .9;
//}
#endregion

#region Rotating camera
if(!global.generatingEnvironment && global.canMove && global.targetObject == -1) {
	
if((keyboard_check(vk_alt) || device_mouse_check_button(0, mb_middle)) && !global.isHolding && !o_player.isBlocking &&!global.isAiming && !global.isCrateOpen) {
	global.draw_cursor = false;
	
	if(!initialAngleChange) {
		display_mouse_set(display_get_width()/2, display_get_height()/2);
		global.camera_angle += (display_mouse_get_x() - (display_get_width()/2)) * .05;
		initialAngleChange = true;
	} else {
		global.camera_angle += (display_mouse_get_x() - (display_get_width()/2)) * .05;
		display_mouse_set(display_get_width()/2, display_get_height()/2);
	}

} else {
	initialAngleChange = false;
}	
	
if((keyboard_check(global.K_RIGHT) || keyboard_check(global.K_LEFT)) && !global.no_angle  && !global.isInventoryOpen || (o_player.isHoldingTool && (keyboard_check_direct(global.K_RIGHT) || keyboard_check_direct(global.K_LEFT)))) {
	
		// Rotating left
		if(keyboard_check_direct(global.K_RIGHT)) {
			global.camera_angle += .001;
			last_side = 1;
		}
		else if(keyboard_check_direct(global.K_LEFT)){ // Rotating right
			global.camera_angle -= .001;
			last_side = 0;
		}
		
		delay_loops = .5;
}

if((keyboard_check(ord("Q")) || keyboard_check(ord("E"))) && !global.no_angle && !instance_exists(o_builder)  && !global.isInventoryOpen || (o_player.isHoldingTool && (keyboard_check_direct(global.K_RIGHT) || keyboard_check_direct(global.K_LEFT)))) {
	
		// Rotating left
		if(keyboard_check_direct(ord("Q"))) {
			global.camera_angle += .5;
			last_side = 1;
		}
		else if(keyboard_check_direct(ord("E"))){ // Rotating right
			global.camera_angle -= .5;
			last_side = 0;
		}
		
		delay_loops = .5;
}

// Delaying the camera to slow to a stop.
if(delay_loops > 0 && !o_player.isBlocking && !global.isAiming) {
		if(last_side)
			 global.camera_angle += delay_loops;
		if(!last_side)
		     global.camera_angle -= delay_loops;
			
		// Edit .02 to change how long or short it delays.
		if(delay_loops > 1)
			delay_loops -= .08;
		if(delay_loops <= 1)
			delay_loops -= .08;
	}
} 
#endregion

#region Setting object depths

	if(deactivateFrame == 0 && !global.generatingEnvironment && room != r_testing){
		/*
		
		//find the chunks your in
		var realX = x;
		var realY = y;
		var chunk1 = scr_find_chunk(realX-200,realY-200);
		var chunk2 = scr_find_chunk(realX-200, realY+300);
		var chunk3 = scr_find_chunk(realX+300, realY-200);
		var chunk4 = scr_find_chunk(realX+300, realY+300);
	
		var generatorFStack = ds_stack_create();
		
		if(!global.chunkLoaded[chunk1])
			scr_activate_chunk(chunk1);
		if(!global.chunkLoaded[chunk2] && chunk1 != chunk2)
			scr_activate_chunk(chunk2);
		if(!global.chunkLoaded[chunk3] && chunk3 != chunk2 && chunk3 != chunk1)
			scr_activate_chunk(chunk3);
		if(!global.chunkLoaded[chunk4] && chunk4 != chunk3 && chunk4 != chunk2 && chunk4 != chunk1)
			scr_activate_chunk(chunk4);
		
		*/
	}
	if(deactivateFrame == 1 && room != r_title && !global.generatingEnvironment) {
		//check if it needs to load an unloaded chunk and if it does load in those unloaded
		//chunks
		//offset isnt used super properly look into it!
		// the problem is that objects are being moved but we need to find out where they are
		// which means it probably wont be super accurate
		if(o_shaders.fadeOutWorld){
			o_shaders.fadeOutWorld = false;
		}
		
		/*
		//find the chunks your in
		var realX = x;
		var realY = y;
		var chunk1 = scr_find_chunk(realX-200,realY-200);
		var chunk2 = scr_find_chunk(realX-200, realY+300);
		var chunk3 = scr_find_chunk(realX+300, realY-200);
		var chunk4 = scr_find_chunk(realX+300, realY+300);
		
		var generatorFStack = ds_stack_create();
		//commented out just for debugging!!!!!
		var generatingF = false;
		if(!global.demoRoom){
			if(!global.chunkLoaded[chunk1]){
				//global.generatingGrass = true;
				var genF1 =instance_create_depth(realX-200, realY-200, 1, o_generatorF);
				ds_stack_push(generatorFStack, genF1);
				generatingF = true;
			}
			if(!global.chunkLoaded[chunk2]&&(chunk2!=chunk1)){
				//global.generatingGrass = true;
				var genF2 = instance_create_depth(realX-200, realY+300, 1, o_generatorF);
				ds_stack_push(generatorFStack, genF2);
				generatingF = true;
			}
			if(!global.chunkLoaded[chunk3]&&(chunk3!=chunk2)&&(chunk3!=chunk1)){
				//global.generatingGrass = true;
				var genF3 = instance_create_depth(realX+300, realY-200, 1, o_generatorF);
				ds_stack_push(generatorFStack, genF3);
				generatingF = true;
			}
			if(!global.chunkLoaded[chunk4]&&(chunk4!=chunk3)&&(chunk4!=chunk2)&&(chunk4!=chunk1)){
				//global.generatingGrass = true;
				var genF4 = instance_create_depth(realX+300, realY+300, 1, o_generatorF);
				ds_stack_push(generatorFStack, genF4);
				generatingF = true;
			}
		}
		
		if(generatingF && global.isInventoryOpen && !global.isInventoryOpening){
			with(o_hud){
				scr_update_mm(global.blockArr, global.blockUpdateArr, mapWidth, mapHeight);
				scr_merge_map(global.blockArr, mapWidth, mapHeight);
			}
		}*/
		
		if(setupActivation){
			show_debug_message("setting up activation");
			
			//imf its seting up the activation queue, set that queue up
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
	
			setupActivation = false;
		}
		/*
		if(global.itemEquipped == item.rifle || global.itemEquipped == item.shotgun || global.itemEquipped == item.crossbow){
				
		}*/
		
		//show_debug_message("activate region in step");
		//instance_deactivate_all(true);
		//instance_activate_object(o_generatorF);
		
		//while(ds_stack_size(generatorFStack) > 0)
			//instance_activate_object(ds_stack_pop(generatorFStack));
		
		
		//var tim1 = get_timer();
		instance_activate_region(o_camera.x-500, o_camera.y-500, 1000, 1000, true);
		//var tim2 = get_timer();
		//show_debug_message("time to activate: "+string(tim2-tim1));
		/*
		//find current block
		var xGrid = x+global.xoffset;
		var yGrid = y+global.yoffset;

		//find their old positions by going backwards with offset
		if (yGrid < 0) { yGrid += room_height; }
		if (yGrid >= room_height) { yGrid -= room_height; }
		if (xGrid < 0) { xGrid += room_width; }
		if (xGrid >= room_width) { xGrid -= room_width; }
		//activate region
		scr_activateChunk_region(xGrid, yGrid, 20);
		*/

		
		//replaces object activation
		
		var sizeAQ = ds_queue_size(activationQueue);
		for(var queV = 0; queV < sizeAQ; queV++){
			var queueID = ds_queue_dequeue(activationQueue);
			//show_debug_message("activating: "+string(object_get_name(queueID.object_index)));
			instance_activate_object(queueID);
			ds_queue_enqueue(activationQueue, queueID);
		}
		
		/*
		instance_activate_object(o_player);
		instance_activate_object(o_player_hitBox);
		instance_activate_object(o_shaders);	
		instance_activate_object(o_initializer);
		instance_activate_object(o_weather);
		instance_activate_object(o_hud);
		instance_activate_object(o_debugger);
		instance_activate_object(o_input);*/
	}
	//instance_deactivate_region(0, 0, 5000, 5000, false, true);
//global.overheadArr[xTo+global.xoffset,yTo+global.yoffset] = true;

if(!global.generatingEnvironment){//dont set overhead when generating
	var overheadX = xTo+global.xoffset;
	var overheadY = yTo+global.yoffset;
	
	//ds_grid_set(global.overheadGrid, overheadX, overheadY, true);
	
	
	if(!ds_list_find_index(global.overheadXList, overheadX)){
		ds_list_add(global.overheadXList, overheadX);	
	}
	if(!ds_list_find_index(global.overheadYList, overheadY)){
		ds_list_add(global.overheadYList, overheadY);	
	}
}



#region minimap activation

//if(!global.isInventoryOpen&&!(x==xTo)&&!(y==yTo)){
/*
//new activation for map minimap controls
with(all){ //with all active instances
	if(ds_map_exists(global.minimapVar, id)){ //if its a minimapable thing
		if(!ds_list_find_index(global.activemm,id))//if it is not registered active
			ds_list_add(global.activemm, id); //add it to list of active minimap symbols
	}
}*/
//}

#endregion

//finding the center of the viewport x and y
var viewHeight = view_get_hport(view_camera[0]);
var viewCenX = x+lengthdir_x(viewHeight/2, -90-global.camera_angle);
var viewCenY = y+lengthdir_y(viewHeight/2, -90-global.camera_angle);
var camX = x;
var camY = y;
//Finding all objects in the viewport
with(all)
{
	// With all objects except these set depth (objects that dont need or want to have depth set)
	if(object_get_parent(object_index) != par_no_depth)
	{
		//var newy = 0+(lengthdir_y(x, global.camera_angle) + lengthdir_y(y, global.camera_angle - 90));
		//var newy = sqrt(sqr(x-viewCenX)+sqr(y-viewCenY)); 
		var newy2 = 0;
		var newy3 = 0;
		var newy4 = 0;
		//var newy = distance_to_point(viewCenX, viewCenY);
		
		var newy = point_distance(x,y,viewCenX, viewCenY);
		depth = max(newy,newy2,newy3,newy4);
		
		
		//circular method
		/*
		if(object_index == o_cliff){
			var x2 = x+lengthdir_x(110,image_angle-global.camera_angle);
			var y2 = y+lengthdir_y(110, image_angle-global.camera_angle);
			newy2 = point_distance(x2,y2,viewCenX, viewCenY);
			var xn = x+lengthdir_x(110, image_angle+180-global.camera_angle);
			var yn = y+lengthdir_y(110, image_angle+180-global.camera_angle);
			newy = point_distance(xn,yn, viewCenX, viewCenY);
			if(point_distance(camX, camY, x2, y2)>200)
				newy2 = 0;
			if(point_distance(camX, camY, xn, yn)>200)
				newy = 0;
		}*/
		
	}
	/*
	if(ds_map_exists(global.minimapVar, id)){ //if its a minimapable thing
		//this seems very slow
		if(!ds_list_find_index(global.activemm,id))//if it is not registered active
			ds_list_add(global.activemm, id); //add it to list of active minimap symbols
	}*/
}
#endregion

#region Centering the camera angle

// When "C" is pressed then center the camera
if(keyboard_check_pressed(global.K_CENTER) && !center_camera && !global.no_angle && global.canMove)
	center_camera = true;

// If center camera is true
if(center_camera)
{
	// Check if camera is not already centered
    if(!global.camera_angle == 0)
        {
			// Decide which way to rotate the camera
            if(global.camera_angle > 0 && global.camera_angle <= 180)
                global.camera_angle -= 2;

            if(global.camera_angle > 180)
                global.camera_angle += 2;
     
            if(global.camera_angle < 2 && global.camera_angle > -2)
                global.camera_angle = 0;
        }
    else 
        center_camera = false;
}

#endregion

if(global.isCrateOpen) {
	//global.camera_angle = 
	var target_angle = point_direction(o_player.x, o_player.y, global.crate.x, global.crate.y);

	/*if(round(global.camera_angle) != target_angle) {
		if(global.camera_angle < target_angle)
			global.camera_angle++;
		else if(global.camera_angle > target_angle)
			global.camera_angle--;
	}*/
	//show_debug_message(string(target_angle))
	
	// Finding angle
	var distance1 = -global.camera_angle-target_angle+90;
	var distance2 = -360-global.camera_angle-target_angle+90;
	var distance3 = 360-global.camera_angle-target_angle+90;

	var distancefinal = min(abs(distance1), abs(distance2), abs(distance3));

	if(distancefinal = abs(distance1))
		distancefinal = distance1;
	if(distancefinal = abs(distance2))
		distancefinal = distance2;
	if(distancefinal = abs(distance3))
		distancefinal = distance3;
	global.camera_angle += (distancefinal)*.05;
	
	if(global.camera_angle > 0){
		global.camera_angle = global.camera_angle-360;	
	}
	if(global.camera_angle < -360){
		global.camera_angle = 360 + global.camera_angle;
	}
}

if(global.target && instance_exists(global.targetObject)) {
	//global.camera_angle = 
	var target_angle = point_direction(o_player.x, o_player.y, global.targetObject.x, global.targetObject.y);

	/*if(round(global.camera_angle) != target_angle) {
		if(global.camera_angle < target_angle)
			global.camera_angle++;
		else if(global.camera_angle > target_angle)
			global.camera_angle--;
	}*/
	//show_debug_message(string(target_angle))
	
	// Finding angle
	var distance1 = -global.camera_angle-target_angle+90;
	var distance2 = -360-global.camera_angle-target_angle+90;
	var distance3 = 360-global.camera_angle-target_angle+90;

	var distancefinal = min(abs(distance1), abs(distance2), abs(distance3));

	if(distancefinal = abs(distance1))
		distancefinal = distance1;
	if(distancefinal = abs(distance2))
		distancefinal = distance2;
	if(distancefinal = abs(distance3))
		distancefinal = distance3;
	global.camera_angle += (distancefinal)*.05;
	
	if(global.camera_angle > 0){
		global.camera_angle = global.camera_angle-360;	
	}
	if(global.camera_angle < -360){
		global.camera_angle = 360 + global.camera_angle;
	}
} else
	global.target = false;

#region Setting final camera rotation and global dir

// Setting camera angle back to 0 or 360 if it goes under or over
if(global.camera_angle >= 360)
	global.camera_angle = global.camera_angle-360;
if(global.camera_angle < 0)
    global.camera_angle = 360+global.camera_angle;
	
// Setting final camera Angle
camera_set_view_angle(view_camera[0],global.camera_angle);

// Setting player_dir variable based on final camera angle
if(global.camera_angle > 337.5 || global.camera_angle < 22.5)
	global.dir = 0;
if(global.camera_angle > 22.5 && global.camera_angle < 67.5)
	global.dir = 1;
if(global.camera_angle > 67.5 && global.camera_angle < 112.5)
	global.dir = 2;
if(global.camera_angle > 112.5 && global.camera_angle < 157.5)
	global.dir = 3;
if(global.camera_angle > 157.5 && global.camera_angle < 202.5)
	global.dir = 4;
if(global.camera_angle > 202.5 && global.camera_angle < 247.5)
	global.dir = 5;
if(global.camera_angle > 247.5 && global.camera_angle < 292.5)
	global.dir = 6;
if(global.camera_angle > 292.5 && global.camera_angle < 337.5)
	global.dir = 7;
	
#endregion

slotAnimated = false;