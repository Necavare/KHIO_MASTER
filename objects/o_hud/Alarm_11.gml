///@description auto save itself
drawSave = false;
if(!global.generatingEnvironment && !global.loadingWorld && !global.worldShift && !global.worldShifted) {
	//instance_activate_all();
	//show_debug_message("auto saving");
	saveAlarm = true;
	
	
	//savingWorld = true;
	//autoSave = true;
}

alarm[10] = 60*60*5; // Save every 5 minutes