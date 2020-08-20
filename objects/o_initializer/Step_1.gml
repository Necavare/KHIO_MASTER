if(global.duraEquipped <= 0)
	global.isHolding = false;

if(room == r_title)
	instance_activate_object(o_title_hud);
	
if(!mouse_check_button(global.M_LEFT) && global.interactingObject != -1) {
	global.interactingObject = -1;
	global.interactingLoad = -1;
}

if(instance_exists(global.interactingObject) && !position_meeting(mouse_x,mouse_y, global.interactingObject) && !global.isInventoryOpen) {
	global.interactingObject = -1;
	global.interactingLoad = -1;
}

if((o_player.isSitting || o_player.isSleeping || global.isHolding || global.inOptions || global.isHoldingFood || global.grabbed || global.isAiming || global.rifleHolding || !global.canMove || instance_exists(o_tool) || instance_exists(o_weapon)) && !global.isInventoryOpen) {
	global.interactingObject = -1;
	global.interactingLoad = -5;
}

if(global.interactingObject == -1) {
	global.inOptions = false;
}

if(window_get_fullscreen() && window_has_focus())
	display_mouse_lock(window_get_x(), window_get_y(), window_get_width(), window_get_height()); 

global.viewBorderX = camera_get_view_border_x(view_camera[0]);
global.viewBorderY = camera_get_view_border_y(view_camera[0]);