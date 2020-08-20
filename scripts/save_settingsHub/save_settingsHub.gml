/// @desc save_settingsHub
function save_settingsHub() {

	//SAVED UNDER NAME
	//   settings_hub


	//******************************************************
	//other objects need to also be added down here \/\/\/\/
	//******************************************************

	var settingsList = ds_list_create();

	//1. global.K_UP
	ds_list_add(settingsList, global.K_UP);

	//2. global.K_LEFT
	ds_list_add(settingsList, global.K_LEFT);

	//3. global.K_DOWN
	ds_list_add(settingsList, global.K_DOWN);

	//4. global.K_RIGHT
	ds_list_add(settingsList, global.K_RIGHT);

	//5. global.K_RUN
	ds_list_add(settingsList, global.K_RUN);

	//6. global.K_SIT
	ds_list_add(settingsList, global.K_SIT);

	//7. global.K_DODGE
	ds_list_add(settingsList, global.K_DODGE);

	//8. global.K_RELOAD
	ds_list_add(settingsList, global.K_RELOAD);

	//9. global.K_INVENTORY
	ds_list_add(settingsList, global.K_INVENTORY);

	//10. global.K_CENTER
	ds_list_add(settingsList, global.K_CENTER);

	//11. global.K_ROTATELEFT
	ds_list_add(settingsList, global.K_ROTATELEFT);

	//12. global.K_ROTATERIGHT
	ds_list_add(settingsList, global.K_ROTATERIGHT);

	//13. global.SN_FX
	ds_list_add(settingsList, global.SN_FX);

	//14. global.SN_MUSIC
	ds_list_add(settingsList, global.SN_MUSIC);

	//15. map
	ds_list_add(settingsList, global.K_MAP);

	//16. display height
	show_debug_message("saving display_height: "+string(global.display_height));
	ds_list_add(settingsList, global.display_height);

	//17. display width
	show_debug_message("saving display_width: "+string(global.display_width));
	ds_list_add(settingsList, global.display_width);

	//18. set version number
	ds_list_add(settingsList, GM_version);

	//19 censoring
	ds_list_add(settingsList, global.censoring);
	
	//20 hints
	ds_list_add(settingsList, global.hints);

	//21 
	ds_list_add(settingsList, global.isTutorial);

	//wrap root List in a map
	var _wrapper = ds_map_create();
	ds_map_add_list(_wrapper, "ROOT", settingsList);

	//save all of this to a string
	var _string = json_encode(_wrapper);
	save_StringToFile("settings_hub", _string); //saved file name with the string of data

	//nuke data
	//ds_map_destroy(_wrapper);

	show_debug_message("***************");
	show_debug_message("settings saved");
	show_debug_message("***************");


}
