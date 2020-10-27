/*if(window_mouse_get_x() > window_get_width())
	window_mouse_set(window_get_width(), window_mouse_get_y());
	
if(window_mouse_get_y() > window_get_height())
	window_mouse_set(window_mouse_get_y(), window_get_height());
	*/

//window_mouse_set(clamp(window_mouse_get_x(),0,window_get_width()),clamp(window_mouse_get_y(),0,window_get_height()));
//window_mouse_set(500, 500);
//show_debug_message(string(global.headEquipped))
//show_debug_message(string(global.bodyEquipped))

// Pickup crafting itesms
if(!global.isInventoryOpen && craftingCount[# 0, 0] > 0) {
	pickup_item(o_hud, craftingItems[# 0, 0], craftingCount[# 0, 0], craftingDurability[# 0, 0]);
	craftingItems[# 0, 0] = 0;
	craftingCount[# 0, 0] = 0;
	craftingDurability[# 0, 0] = -1;
}

//check for minimap button
if(keyboard_check_pressed(global.K_MAP) && global.canMove && !global.generatingEnvironment){
		quickMapOpen = true;
	
		if(global.isInventoryOpen && !quickMapOpen)
			mapInventory = true;
		else
			mapInventory = false;
		
		if(!mapOpen) {
			global.isInventoryOpening = true;
			global.isInventoryOpen = true;
			mapOpen = true;
			
			mmXoffset = fullscreen_mmXoffset;
			mmYoffset = fullscreen_mmYoffset;
			
			zoom = fullscreenZoom;
			fullscreenSelected = true;
			markerLibrarySelected = false;
			fullscreenSelected = true;
			//mmWidth = 1853;
			mmWidth = 1880;
			mmHeight = 1040;
			xp = 20;
			yp = 20;
			//yp = 70;
		}
} else if(((!keyboard_check(global.K_MAP)&&!global.isInventoryOpen) || (global.isInventoryOpen&&keyboard_check_released(global.K_MAP))) && global.canMove) {
	quickMapOpen = false;
	
	//if inventroy was open before hand just minimize
	fullscreen_mmXoffset = mmXoffset;
	fullscreen_mmYoffset = mmYoffset;
	fullscreenZoom = zoom;	
	if(mapInventory) {
		if(!global.minimapActive)
			zoom = minimizedZoom;
		mmXoffset = 0;
		mmYoffset = 0;
		//mmXoffset = minim;
		//mmYoffset = fullscreen_mmYoffset;
		global.minimapFullscreen = false;
		markerLibrarySelected = false;
		fullscreenSelected = false;
		mmHeight = 480;
		mmWidth = 480;
		xp = 1394;
		//yp = 20;
		yp = 70;
		mapInventory = false;
	}
	else {
		global.minimapFullscreen = false;
		global.isInventoryOpen = false;	
		global.isInventoryOpening = false;
	}
}

if(!fullscreenSelected)
	minimizedZoom = zoom;
	
// Lantern stuff
if(check_inventory(item.lantern, 1, 0))
	global.lantern = true;
else
	global.lantern = false;

if(global.lantern) {
	if(lanternInst == -1)
		lanternInst = instance_create_depth(o_player.x, o_player.y, depth, o_lantern);
} else {
	if(instance_exists(lanternInst) && lanternInst != -1)
		instance_destroy(lanternInst);
	lanternInst = -1;
}

// Sack stuff
if(check_inventory(item.sack, 1, -1))
	global.sack = true;
else
	global.sack = false;
		
if(global.sack) {
	if(sackInst == -1)
		sackInst = instance_create_depth(o_player.x, o_player.y, depth, o_sack);
} else {
	if(instance_exists(sackInst) && sackInst != -1)
		instance_destroy(sackInst);
	sackInst = -1;
}

if(holdSlot && alarm[2] == -1)
	alarm[2] = 5;
	
if(!global.isHolding && !keyboard_check_direct(vk_alt))
	global.draw_cursor = true;
	
#region Pause Menu

if(exitPressed){
	instance_activate_all();
	instanceActivated = true;
}
if(keyboard_check_pressed(global.K_PAUSE) && !global.isInventoryOpen && !global.generatingEnvironment && !confirm && !global.options  && !savingWorld && !o_player.isDead) {
	if(instance_exists(o_tool))
		instance_destroy(o_tool);
		
	if(instance_exists(o_weapon))
		instance_destroy(o_weapon);
		
	if(instance_exists(o_builder))
		instance_destroy(o_builder);
	
	///application_surface_draw_enable(false);
	audio_play_sound(sn_inventory_open, 1, 0);
	global.isPaused = !global.isPaused;

	
	if(global.isPaused) {
		global.interactingObject = -1;
		global.interactingLoad = -1;
		o_player.checkNearestShed = false;
		global.pausedBackground = sprite_create_from_surface(global.pixelSurf,0,0,view_get_wport(view_camera[0]),view_get_hport(view_camera[0]),false,false,0,0);
		instance_deactivate_all(true);
		instance_activate_object(o_player);
		instance_activate_object(o_input);
	}
	else
	{
		global.canMove = true;
		sprite_delete(global.pausedBackground);
		activate_essential();
		instance_activate_region(o_camera.x-200, o_camera.y-200, 500, 500, true);
		alarm[7] = 60;
	}
}
else if(keyboard_check_pressed(global.K_PAUSE) && global.isInventoryOpen && !isGameover) {
	global.isInventoryOpen = false;
	
	if(global.isCrateOpen) {
		global.isCrateOpen = false;
		global.crate = 0;
	}
} else if(keyboard_check_pressed(global.K_PAUSE) && confirm && !isGameover) {
	confirm = false;
	exitHighlighted = false;
} else if(keyboard_check_pressed(global.K_PAUSE) && global.options && !isGameover) {
	if(settings)
		settings = false;
	else if(controls && controlSelected == -1) {
		controls = false;
		controlSelected = -1;
	} else if(controls && controlSelected != -1) {
		controlSelected = -1;
	} else if(!settings && !controls) {
		global.options = false;
		save_settingsHub();
		optionsHighlighted = false;
	}
}

if(global.isPaused) {
	global.draw_cursor = true;
	global.canMove = false;
}
	

if(!global.options) {
	settings = false;
	controls = false;
}

// Opening the inventory
if(keyboard_check_pressed(global.K_INVENTORY) && !o_player.isSleeping && !global.generatingEnvironment && !o_player.isDead) {
	
	audio_play_sound(sn_inventory_open, 1, 0);
	
	if(!global.isInventoryOpen)
		global.isInventoryOpening = true;
	else if(instance_exists(o_weapon)){
		inventoryclosing = true;	
	}
	global.isInventoryOpen = !global.isInventoryOpen;
	
	if(global.isCrateOpen) {
		global.isCrateOpen = false;
		global.crate = 0;
	}
	
	if(global.isInventoryOpen)
		window_mouse_set(window_get_width()/2, window_get_height()/2.6);
}

if(global.isPaused)
	buttonAlpha += .02;
else
	buttonAlpha = 0;

#endregion

#region Inventory

// Moving towards player
x += (o_player.x-x)*.1;
y += (o_player.y-y)*.1;

depth = -9000;

// Finding angle
var distance1 = -global.camera_angle-angle;
var distance2 = -360-global.camera_angle-angle;
var distance3 = 360-global.camera_angle-angle;

var distancefinal = min(abs(distance1), abs(distance2), abs(distance3));

if(distancefinal = abs(distance1))
	distancefinal = distance1;
if(distancefinal = abs(distance2))
	distancefinal = distance2;
if(distancefinal = abs(distance3))
	distancefinal = distance3;
angle += (distancefinal)*.05;
	
if(angle > 0){
	angle = angle-360;	
}
if(angle < -360){
	angle = 360 + angle;
}

// Dropping item if picked up and inventory closed
if(!global.isInventoryOpen && global.isItemPicked) {
	// Moving picked up items back into inventory
	pickup_item(o_hud, global.last_item, global.picked_quantity);
	
	global.picked_quantity = 0;
	global.last_item = 0;
	global.isItemPicked = false;
}

if(!o_player.isRolling && !o_player.isDead && !o_player.isDying && !o_player.isSleeping && !global.isPaused) {
	if(!o_player.isSitting) {
		// Spawning held items
		if(equippedDurability > 0) {
			if(!instance_exists(o_tool) 
			&& (global.itemEquipped == item.stoneaxeS || global.itemEquipped == item.stoneaxeB
			|| global.itemEquipped == item.stonepicB || global.itemEquipped == item.stonepicS
			|| global.itemEquipped == item.boneaxeS || global.itemEquipped == item.boneaxeB
			|| global.itemEquipped == item.bonepicB || global.itemEquipped == item.bonepicS
			|| global.itemEquipped == item.metalaxeS || global.itemEquipped == item.metalaxeB
			|| global.itemEquipped == item.metalpicB || global.itemEquipped == item.metalpicS
			|| global.itemEquipped == item.boneclubS || global.itemEquipped == item.boneclubB
			|| global.itemEquipped == item.stoneShovelS || global.itemEquipped == item.stoneShovelB
			|| global.itemEquipped == item.metalShovelS || global.itemEquipped == item.metalShovelB))
				instance_create_depth(o_player.x, o_player.y, depth, o_tool);
			
			if(!instance_exists(o_tool) && global.itemEquipped == item.torch)
				instance_create_depth(o_player.x, o_player.y, depth, o_tool);
			
			if(!instance_exists(o_tool) && global.itemEquipped == item.flare)
				instance_create_depth(o_player.x, o_player.y, depth, o_tool);
	
			if(!instance_exists(o_tool) && (global.itemEquipped == item.sword || global.itemEquipped == item.poisonsword))
				instance_create_depth(o_player.x, o_player.y, depth, o_tool);
			
			if(!instance_exists(o_weapon) && (global.itemEquipped == item.rifle || global.itemEquipped == item.shotgun || global.itemEquipped == item.crossbow)){
				instance_create_depth(o_player.x, o_player.y, depth, o_weapon);
				//show_debug_message("creating gun");	
			}
		}
			
		if(!instance_exists(o_tool) && global.itemEquipped == item.grenade)
			instance_create_depth(o_player.x, o_player.y, depth, o_tool);
			
		if(!instance_exists(o_tool) && global.itemEquipped == item.snowball)
			instance_create_depth(o_player.x, o_player.y, depth, o_tool);
			
		if(!instance_exists(o_tool) && (global.itemEquipped == item.knife || global.itemEquipped == item.poisonknife))
			instance_create_depth(o_player.x, o_player.y, depth, o_tool);
	}
	
	if(!instance_exists(o_food) 
	&& (global.itemEquipped == item.meat || global.itemEquipped == item.cookedmeat
	|| global.itemEquipped == item.human || global.itemEquipped == item.cookedhuman
	|| global.itemEquipped == item.berry || global.itemEquipped == item.fungi || global.itemEquipped == item.cookedfungi
	|| global.itemEquipped == item.bandage || global.itemEquipped == item.medkit || global.itemEquipped == item.soup
	 || global.itemEquipped == item.treasureMap || global.itemEquipped == item.enemymap)) {
		instance_create_depth(o_player.x, o_player.y, depth, o_food);
		global.isHoldingFood = true;
	}
}

// Selecting hotbar slot
if((!global.isInventoryOpen && !o_player.isSleeping && global.canMove) || o_player.isSitting) {
	if(keyboard_check_pressed(global.K_ONE) && hotbarSlot != 0)
		hotbarSlot = 0;
	else if(keyboard_check_pressed(global.K_ONE) && hotbarSlot == 0)
		hotbarSlot = -1;
	else if(keyboard_check_pressed(global.K_TWO) && hotbarSlot != 1)
		hotbarSlot = 1;
	else if(keyboard_check_pressed(global.K_TWO) && hotbarSlot == 1)
		hotbarSlot = -1;
	else if(keyboard_check_pressed(global.K_THREE) && hotbarSlot != 2)
		hotbarSlot = 2;
	else if(keyboard_check_pressed(global.K_THREE) && hotbarSlot == 2)
		hotbarSlot = -1;
		
	if(keyboard_check_pressed(global.K_ONE) || keyboard_check_pressed(global.K_TWO) || keyboard_check_pressed(global.K_THREE) || showHotbar) {
		showHotbar = false;
		hotbarAlpha = 1;
		hotbarOut = false;
		alarm[1] = 120;//3 secs
	}
	
	if(mouse_wheel_down()) {
		if(hotbarSlot == -1)
			hotbarSlot = 0;
		else if(hotbarSlot == 0)
			hotbarSlot = 1;
		else if(hotbarSlot == 1)
			hotbarSlot = 2;
		else if(hotbarSlot == 2)
			hotbarSlot = 0;
			
		showHotbar = false;
		hotbarAlpha = 1;
		hotbarOut = false;
		alarm[1] = 120;//3 secs
	}
	
	if(mouse_wheel_up()) {
		if(hotbarSlot == 0)
			hotbarSlot = 2;
		else if(hotbarSlot == 2)
			hotbarSlot = 1;
		else if(hotbarSlot == 1)
			hotbarSlot = 0;
		else if(hotbarSlot == -1)
			hotbarSlot = 2;
			
		showHotbar = false;
		hotbarAlpha = 1;
		hotbarOut = false;
		alarm[1] = 120;//3 secs
	}
}
	


if(hotbarOut)
	hotbarAlpha-=.01;
#endregion