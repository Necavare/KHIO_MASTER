/// @desc save_loadSettingsHub
function save_loadSettingsHub() {

	// name is : "settings_hub"

	//load

	if(file_exists("settings_hub.dat")){
		var _wrapper = save_loadJsonFromFile("settings_hub");	
		var _list = _wrapper[? "ROOT"]; //(ds_map_find_val)
	
		//check version number:
		//18.
		/*
		if(_list[| 17]== undefined || GM_version != _list[| 17]){
			//nuke saves
			save_nuke();
			exit;
		}*/
	
		//1. global.K_UP
		global.K_UP = _list[| 0];// ds_list_find_value

		//2. global.K_LEFT
		global.K_LEFT = _list[| 1];// ds_list_find_value

		//3. global.K_DOWN
		global.K_DOWN = _list[| 2];// ds_list_find_value

		//4. global.K_RIGHT
		global.K_RIGHT = _list[| 3];// ds_list_find_value

		//5. global.K_RUN
		global.K_RUN = _list[| 4];// ds_list_find_value

		//6. global.K_SIT
		global.K_SIT = _list[| 5];// ds_list_find_value

		//7. global.K_DODGE
		global.K_DODGE = _list[| 6];// ds_list_find_value

		//8. global.K_RELOAD
		global.K_RELOAD = _list[| 7];// ds_list_find_value

		//9. global.K_INVENTORY
		global.K_INVENTORY = _list[| 8];// ds_list_find_value

		//10. global.K_CENTER
		global.K_CENTER = _list[| 9];// ds_list_find_value

		//11. global.K_ROTATELEFT
		global.K_ROTATELEFT = _list[| 10];// ds_list_find_value

		//12. global.K_ROTATERIGHT
		global.K_ROTATERIGHT = _list[| 11];// ds_list_find_value

		//13. global.SN_FX
		global.SN_FX = _list[| 12];// ds_list_find_value

		//14. global.SN_MUSIC
		global.SN_MUSIC = _list[| 13];// ds_list_find_value
	
		//15. map
		global.K_MAP = _list[| 14];// ds_list_find_value
	
		//16. display height
		show_debug_message("_list[15]: "+string(_list[| 15]));
		global.display_height = _list[| 15];
		show_debug_message("display_height: "+string(global.display_height))

		//17. display width
		show_debug_message("_list[16]: "+string(_list[| 15]));
		global.display_width = _list[| 16];
		show_debug_message("display_width: "+string(global.display_width));
	
		//18.
		//version number
	

		//**********************new**********************
		//19 censoring
		if (_list[| 18] != undefined){
			global.censoring = _list[| 18];
		}
	
		//20 hints
		if(_list[| 19] != undefined){
			global.hints = _list[| 19];	
		}
	
		//21 tutorial
		if(_list[| 20] != undefined){
			global.isTutorial = _list[| 20];	
		}
	
		window_set_size(global.display_width,global.display_height)
	
		ds_map_destroy(_wrapper);
		show_debug_message("settings Loaded");
	}
	else{
		show_debug_message("load settings failure");	
	}


}
