/// @description maybe update the minimap
if(room != r_title) {
	if((global.isInventoryOpen || global.minimapActive) && (xdir != 0 || ydir != 0) && !global.isInventoryOpening &&!global.minimapUpdated){
		with(o_hud){
			overhead_update_mm1(mapWidth/5, mapHeight/5);
			//overhead_update_mm1(mmHeight, mmWidth)	
		}
	}


	if(overheadDoOnce && !global.generatingEnvironment){
		with(o_hud){
			overhead_update_mm1(mapWidth/5, mapHeight/5);
		}
		overheadDoOnce = false;
	}
}
//ow_debug_message("xoffset: "+string(global.xoffset));
//ow_debug_message("yoffset: "+string(global.yoffset));
alarm[8] = 60;