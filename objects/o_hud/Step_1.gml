

/*
if(exitPressed&&instanceActivated){
	save_createNew(global.currentFile);
	global.isPaused = false;
	global.play = false;
	game_end();	
}*/

if(savingWorld){
	if(room != r_testing && room != r_cave)
		save_createNew(global.currentFile);
	savingWorld = false;
	
	if(goToMenu) {
		//show_debug_message("deleting stuff");
		
		
		global.camera_angle = 0;
		room_instance_clear(r_new);
		room_restart();
		//room_restart();
		ds_map_destroy(global.minimapVar);

		global.xoffset = 0;
		global.yoffset = 0;
		
		global.menuAlpha = 1;
		global.chunkLoaded = 0;
		global.blockUpdateArr = 0;
		ds_list_destroy(global.activemm);
		ds_list_destroy(global.blockUpdateHistory);


		if(global.mmOverheadSprite != pointer_null)
			sprite_delete(global.mmOverheadSprite);
		if(global.mmSprite != pointer_null)
			sprite_delete(global.mmSprite);
		
		iv = 0;
		//clear out block arr array of sprites
		for(var bx1 = 0; bx1 < global.blockXNum; bx1++){
			for(var by1 = 0; by1 < global.blockYNum; by1++){
				sprite_delete(global.blockArr[iv]);
				//draw_sprite(sprArr[iv], 0 , bx, by);
				iv++;
			}
		}
		global.blockArr = -1;
		global.blockArr = array_create(global.blockXNum*global.blockYNum);

		global.biomeArray = 0;
		
		global.mmOverheadSprite = pointer_null; //set the overhead sprite to null
		global.mmSprite = pointer_null; //set the map sprite to null
		global.loading = false;
		global.generatingEnvironment =  true; //change to false if turned off generator
		global.generatingGrass = false; //keep it from doing un necessary stuff
		global.biomeArray[0,0] = 0; //2d array for storing what biome every block is
		//initiate the overheadArr for use 
		//uses 8x8 blocks
		ds_list_destroy(global.overheadXList);
		ds_list_destroy(global.overheadYList);
		global.overheadXList = ds_list_create();
		global.overheadYList = ds_list_create();
		global.overheadXIndex = 0;

		ds_queue_destroy(global.bigLakeIDQ);
		global.bigLakeIDQ = ds_queue_create();
		//global.bigLakePointer = -1;
		
		ds_list_destroy(global.enemyInstList);
		global.enemyInstList = ds_list_create();
		ds_list_destroy(global.enemyXList);
		ds_list_destroy(global.enemyYList);
		global.enemyXList = ds_list_create();
		global.enemyYList = ds_list_create();
		
		ds_stack_destroy(global.newGamePlusItemList);
		ds_stack_destroy(global.newGamePlusDurList);
		ds_stack_destroy(global.newGamePlusCountList);
		global.newGamePlusItemList = ds_stack_create();
		global.newGamePlusDurList = ds_stack_create();
		global.newGamePlusCountList = ds_stack_create();

		ds_map_destroy(global.weaponAmmo);
		global.weaponAmmo = ds_map_create();

		//maybe unnecessary
		//surface_free(global.surfmm);
		//global.surfmm = surface_create(2000, 2000);//map height and width if those are changed

		

		room_goto(r_title);
		global.isPaused = false;
		global.play = false;
	} else if(!autoSave){
		game_end();
	} else if(autoSave){
		//instance_deactivate_region()
		//show_debug_message("saved deactivation");
		activate_essential();
		instance_activate_region(o_camera.x-200, o_camera.y-200, 500, 500, true);
		
		saveAlarm = false;
		savingWorld = false;
		autoSave = false;
		
		if(initialLoadSave){
			o_player.isSleeping = true;
			o_player.isSpawning = true;
			o_player.img_frame = 0;
			initialLoadSave = false;
		}
	}
}
if(newGamePlus){
	
	//show_debug_message("new game plus?");
	
	#region add items to the new game plus list
	
	//var widthI = width;
	//var heightI = height;
	for(var yyI = 0; yyI < height; yyI++){
			for(var xxI = 0; xxI < width; xxI++){
				if(count[# xxI, yyI] >= 1){
					ds_stack_push(global.newGamePlusItemList, items[# xxI, yyI]);
					ds_stack_push(global.newGamePlusDurList, durability[# xxI, yyI]);
					ds_stack_push(global.newGamePlusCountList, count[# xxI, yyI]);
				}
			
			}
	}
	//show_debug_message("size of stack: "+string(ds_stack_size(global.newGamePlusItemList)));
	
	#endregion
	
	
	
	global.camera_angle = 0;
	room_instance_clear(r_new);
	room_restart();
	//room_restart();
	ds_map_destroy(global.minimapVar);

	global.menuAlpha = 1;
	global.chunkLoaded = 0;
	global.blockUpdateArr = 0;
	ds_list_destroy(global.activemm);
	ds_list_destroy(global.blockUpdateHistory);

	if(global.mmOverheadSprite != pointer_null)
		sprite_delete(global.mmOverheadSprite);
	if(global.mmSprite != pointer_null)
		sprite_delete(global.mmSprite);
		global.biomeArray = 0;
		
		iv = 0;
		//clear out block arr array of sprites
		for(var bx1 = 0; bx1 < global.blockXNum; bx1++){
			for(var by1 = 0; by1 < global.blockYNum; by1++){
				sprite_delete(global.blockArr[iv]);
				//draw_sprite(sprArr[iv], 0 , bx, by);
				iv++;
			}
		}
		global.blockArr = -1;
		global.blockArr = array_create(global.blockXNum*global.blockYNum);
		
	global.mmOverheadSprite = pointer_null; //set the overhead sprite to null
	global.mmSprite = pointer_null; //set the map sprite to null
	global.loading = false;
	global.generatingEnvironment =  true; //change to false if turned off generator
	global.generatingGrass = false; //keep it from doing un necessary stuff
	global.biomeArray[0,0] = 0; //2d array for storing what biome every block is
	//initiate the overheadArr for use 
	//uses 8x8 blocks
	ds_list_destroy(global.overheadXList);
	ds_list_destroy(global.overheadYList);
	global.overheadXList = ds_list_create();
	global.overheadYList = ds_list_create();
	global.overheadXIndex = 0;

	ds_queue_destroy(global.bigLakeIDQ);
	global.bigLakeIDQ = ds_queue_create();
	//global.bigLakePointer = -1;
		
	ds_list_destroy(global.enemyInstList);
	global.enemyInstList = ds_list_create();
	ds_list_destroy(global.enemyXList);
	ds_list_destroy(global.enemyYList);
	global.enemyXList = ds_list_create();
	global.enemyYList = ds_list_create();
		
	//maybe unnecessary
	surface_free(global.surfmm);
	global.surfmm = surface_create(2000, 2000);//map height and width if those are changed

	room_goto(r_new);
	global.isPaused = false;
	global.play = false;
	
	newGamePlus = false;
}

// Checking if mouse is moving
if(gx != device_mouse_x_to_gui(0) || gy != device_mouse_y_to_gui(0)) {
	mouseMoving = true;
	gx = device_mouse_x_to_gui(0);
	gy = device_mouse_y_to_gui(0);
} else
	mouseMoving = false;
	
