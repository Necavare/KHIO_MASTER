
if(!global.reLoad){

	// Creating instances for each room
	if(room == r_title) {
		global.mainMenu = true;
		var main = layer_get_id("Controller");
		instance_create_layer(0,0,main,o_shaders);
		instance_create_layer(0,0,main,o_input);
		instance_create_layer(0,0,main,o_title_hud);
		instance_create_layer(0,0,main,o_camera_title);
	} else{
		var main = layer_get_id("Player");
		var ground = layer_get_id("Ground");
	
		//ds_list_clear(global.activemm); //clear list of active elements
		//ds_map_clear(global.minimapVar);//clear map of minimap variables
	
		//loading a cave:
		if(room != r_display_init && room != r_new && room != r_testing && room != r_title){
			o_player.x = 2249;
			o_player.y = 1267;
			var index = ds_list_find_index(global.caveList, room);
			if(!ds_list_find_value(global.caveLoadList, index)){
		
				//o_player.x = 2500;
				//o_player.y = 2500;
			
				//create layers:
				//items
				layer_create(0, "items");
				//main
				layer_create(1, "Main");
				//player
				layer_create(2, "Player");
				//ground
				layer_create(3, "Ground");	
		
				//everything should be set to persistant before moving
		
				var main = layer_get_id("Player");
				var ground = layer_get_id("Ground");
		
				///copy pasta from demo room
		
				//global.demoRoom = true;
				instance_create_layer(0,0,main,o_shaders);
		
				generatorWallAngle = 0;

				//variables for size of blocks 
				/*
				global.blockXNum = room_width/1000; //  <- NEED TO MANUALLY CHANGE WHEN ROOM SIZE CHANGES
				global.blockYNum = room_height/1000;
		
				global.minimapVar = ds_map_create();//map which will be filled with 1d arrays for every object 
				global.chunkLoaded = array_create(global.blockXNum*global.blockYNum, false);
				global.blockUpdateArr = array_create(global.blockXNum*global.blockYNum, false);
				global.blockUpdateHistory = ds_list_create();
				//fill the history list with false
				for(var iv = 0; iv < global.blockXNum*global.blockYNum; iv++){
					ds_list_add(global.blockUpdateHistory, false);
				}
				global.activemm = ds_list_create();
				global.blockArr = array_create(global.blockXNum*global.blockYNum);

				//instance_create_layer(250, 400, main, o_player);
				global.canMove = true;
				o_shaders.fadeOutWorld = false;
				*/
		
				//global.generatingEnvironment = false; //<- this is only for debugging, delete in actual runs with generator
		
				//instance_create_layer(0,0,main,o_hud);
				instance_create_layer(0,0,main,o_camera);
		
		
				//instance_create_layer(0,0,main,o_shaders);
				instance_create_layer(0,0,main,o_debugger);
				instance_create_layer(0,0,main,o_input);
				instance_create_layer(0,0,main,o_weather);
	
				scr_generateCave(index);
				ds_list_set(global.caveLoadList, index, true);
			}
		}
	
		//loading a normal room
		else{
	
			//if its not loading
			if(room == r_testing || global.inCave){
		
				global.demoRoom = true;
				instance_create_layer(0,0,main,o_shaders);
		
				generatorWallAngle = 0;

				//variables for size of blocks 
				global.blockXNum = room_width/1000; //  <- NEED TO MANUALLY CHANGE WHEN ROOM SIZE CHANGES
				global.blockYNum = room_height/1000;
		
				global.minimapVar = ds_map_create();//map which will be filled with 1d arrays for every object 
				global.chunkLoaded = array_create(global.blockXNum*global.blockYNum, false);
				global.blockUpdateArr = array_create(global.blockXNum*global.blockYNum, false);
				global.blockUpdateHistory = ds_list_create();
				//fill the history list with false
				for(var iv = 0; iv < global.blockXNum*global.blockYNum; iv++){
					ds_list_add(global.blockUpdateHistory, false);
				}
				global.activemm = ds_list_create();
				global.blockArr = array_create(global.blockXNum*global.blockYNum);

				//instance_create_layer(250, 400, main, o_player);
				global.canMove = true;
				o_shaders.fadeOutWorld = false;
		
				//instance_create_layer(1200,225,layer_get_id("Player"), o_player); 
				global.generatingEnvironment = false; //<- this is only for debugging, delete in actual runs with generator
				//instance_create_layer(0,0,ground,o_generatorW);
				instance_create_layer(0,0,main,o_hud);
				instance_create_layer(0,0,main,o_camera);
				//instance_create_layer(0,0,main,o_shaders);
	
			}
		 	else if(!global.loadingWorld){
		
				instance_create_layer(0,0,main,o_shaders);
				o_shaders.fadeOutWorld = true;
				global.camera_angle = 0;
				/*
				var chunkGridSize = ceil(room_width/16);
		
				global.smallChunkGrid = ds_grid_create(chunkGridSize,chunkGridSize);
				for(var chunkGridX = 0; chunkGridX < chunkGridSize; chunkGridX++){
					for(var chunkGridY = 0; chunkGridY < chunkGridSize; chunkGridY++){
						ds_grid_add(global.smallChunkGrid, chunkGridX, chunkGridY, ds_list_create());	
					}
				}*/
				generatorWallAngle = 0;

				//variables for size of blocks 
				global.blockXNum = room_width/1000; //  <- NEED TO MANUALLY CHANGE WHEN ROOM SIZE CHANGES
				global.blockYNum = room_height/1000;
		
				global.minimapVar = ds_map_create();//map which will be filled with 1d arrays for every object 
				global.chunkLoaded = array_create(global.blockXNum*global.blockYNum, false);
				global.blockUpdateArr = array_create(global.blockXNum*global.blockYNum, false);
				global.blockUpdateHistory = ds_list_create();
				global.activemm = ds_list_create();
				//fill the history list with false
				for(var iv = 0; iv < global.blockXNum*global.blockYNum; iv++){
					ds_list_add(global.blockUpdateHistory, false);
				}
				global.blockArr = array_create(global.blockXNum*global.blockYNum);

				//instance_create_layer(250, 400, main, o_player);
				instance_create_layer(-1000,-1000, main, o_player);
		
				//global.canMove = true;
				//shaders.fadeOutWorld = false;
		
				//global.generatingEnvironment = false; //<- this is only for debugging, delete in actual runs with generator
				instance_create_layer(0,0,ground,o_generatorW);
				instance_create_layer(0,0,main,o_hud);
				instance_create_layer(0,0,main,o_camera);
				//instance_create_layer(0,0,main,o_shaders);
			}
			//if its loading
			else{
			instance_create_layer(0,0,main,o_shaders);
			o_shaders.fadeOutWorld = true;
			//global.generatingEnvironment = false;
			generatorWallAngle = 0;
		
			global.blockXNum = room_width/1000; //  <- NEED TO MANUALLY CHANGE WHEN ROOM SIZE CHANGES
			global.blockYNum = room_height/1000;
		
			global.minimapVar = ds_map_create();//map which will be filled with 1d arrays for every object 
			global.chunkLoaded = array_create(global.blockXNum*global.blockYNum, false);
			global.blockUpdateArr = array_create(global.blockXNum*global.blockYNum, false);
			global.blockUpdateHistory = ds_list_create();
			global.activemm = ds_list_create();
			global.blockArr = array_create(global.blockXNum*global.blockYNum);
		
			//instance_create_layer(250, 400, main, o_player);
			instance_create_layer(-1000,-1000, main, o_player);
		
			//global.canMove = true;
			instance_create_layer(0,0,main,o_loadingStep);
			instance_create_layer(0,0,main,o_hud);
			//save_loadFile(global.currentFile);
			o_hud.x = o_player.x;
			o_hud.y = o_player.y;
			instance_create_layer(0,0,main,o_camera);
		}
		
		}
		instance_create_layer(0,0,main,o_debugger);
		instance_create_layer(0,0,main,o_input);
		instance_create_layer(0,0,main,o_weather);
	}

}

else if(global.saveLoad){
	//not necessary if just loading in from cave back into world but IS necessary for loading from cave into world
	//for pupose of saving
	instance_activate_all();
	
	/*
	instance_create_depth(0,0,1, o_shaders);
	instance_create_depth(0,0,1, o_camera);
	instance_create_depth(0,0,1, o_debugger);
	instance_create_depth(0,0,1, o_input);
	instance_create_depth(0,0,1, o_weather);*/
}

global.saveLoad = false;
global.reLoad = false;

// Initializing view variables
view_enabled = true;
view_visible[0] = true;

// Setting the camera view size
view_camera[0] = camera_create_view(0,0,ideal_width, ideal_height, 0, -1, -1, -1, ideal_width/2, ideal_height/2);
camera_set_view_size(view_camera[0], ideal_width, ideal_height);