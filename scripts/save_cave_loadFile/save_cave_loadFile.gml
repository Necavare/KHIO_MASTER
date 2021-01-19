/// @desc save_cave_loadFile(filename)
/// @arg filename
function save_cave_loadFile(argument0, indexVal) {
	
	//setup a new save for next
	var _root_list = ds_list_create(); // saves all objects into one list
	ds_list_add(global.caveInstances, _root_list); // add the list to the global list
	ds_list_add(global.caveInstanceIndexVal, indexVal); // add a corresponding index value to another array
	ds_list_set(global.caveInstanceLoaded, indexVal, true);


	var _filename = argument0;

	//load

	//enter a new empty room of correct size
	// ...

	//create any objects that need to be created that were not saved
	// ...
	var numAdded = 0;

	if(file_exists(_filename+".dat")){
		var _wrapper = save_loadJsonFromFile(_filename);	
		var _list = _wrapper[? "ROOT"]; //(ds_map_find_val)
	
		var ground = layer_get_id("Ground");
		for(var i = 0; i < ds_list_size(_list); i++){
			var _map = _list[| i];// ds_list_find_value
			var type = _map[? "type"];
			if(type==1){	
				numAdded++;
			
				var _obj = _map[? "obj"];
				var _x = _map[? "x"];
				var _y = _map[? "y"];
				generatorWallAngle = _map[? "image_angle"];
			
				//since saving layer is not working, no loading it either
				//var _layer = _map[? "layer"];
				var _inst =instance_create_layer(_x, _y, ground, asset_get_index(_obj));
				with(_inst)
				{
				
				#region tower, shed, hosuse
					/*
					if(object_index == o_shed || object_index == o_tower || object_index == o_house){
						o_initializer = _map[? "image_angle"];
					}*/
				#endregion
				
					//if its basic
					image_blend = _map[? "image_blend"];
					image_index = _map[? "image_index"];
					image_angle = _map[? "image_angle"];
					var mmdepth = _map[? "mmdepth"];
				
				#region o_wall
					if(object_index == o_wall_wood){
					
						logs = _map[? "logs"];
						//add the log array into the wall
						for(var logI = 0; logI < 5; logI++){
							logType[logI] = _map[? ("logType["+string(logI)+"]")];
						}
						upgraded = _map[? "upgraded"];
						isCamp = _map[? "isCamp"];

						//copy over the logs array and values necessary!!!!!
					
						numberLogs = 0;
						logId = 1000000;//making a made up id for the logs
		
						for(var walli = 0; walli < 20; walli+=4) {
							xx = x+lengthdir_x(walli,-camera_get_view_angle(view_camera[0])+90);
							yy = y+lengthdir_y(walli,-camera_get_view_angle(view_camera[0])+90);
							if (yy < 0) { yy += room_height; }
							if (yy >= room_height) { yy -= room_height; }
							if (xx < 0) { xx += room_width; }
							if (xx >= room_width) { xx -= room_width; }
	
							// add logs to minimap
							if((walli == 0) && (logs > 0)) {
								//log1S;
								if(logType[0] == 0)
									log1S = s_birch_log;
								if(logType[0] == 1)
									log1S = s_spruce_log
								miniValues1S[0] = log1S; //set sprite for minimap
								miniValues1S[1] = image_angle; //set angle of rotation
								miniValues1S[2] = xx; //x position
								miniValues1S[3] = yy; //y position
								miniValues1S[4] = yy; //general depth, some objects can set this to 0 or other small number if bottom layer
								ds_map_add(global.minimapVar, id+(logId*1), miniValues1S);
								ds_list_add(global.activemm, id+(logId*1)); //add it to list of active minimap symbols
								//show_debug_message("idLog: "+string(id+(logId*1)));
								numberLogs++;
							}
							if((walli == 4) && (logs > 1)) {
								//var log2S;
								if(logType[1] == 0)
									log2S = s_birch_log;
								if(logType[1] == 1)
									log2S = s_spruce_log;

								miniValues2S[0] = log2S; //set sprite for minimap
								miniValues2S[1] = image_angle; //set angle of rotation
								miniValues2S[2] = xx; //x position
								miniValues2S[3] = yy; //y position
								miniValues2S[4] = yy; //general depth, some objects can set this to 0 or other small number if bottom layer
								ds_map_add(global.minimapVar, id+(logId*2), miniValues2S);
								ds_list_add(global.activemm, id+(logId*2)); //add it to list of active minimap symbols
								//show_debug_message("idLog: "+string(id+(logId*2)));
								numberLogs++;
							} 
							if((walli == 8) && (logs > 2)) {
								//var log3S;
								if(logType[2] == 0)
									log3S = s_birch_log;
								if(logType[2] == 1)
									log3S = s_spruce_log;

								miniValues3S[0] = log3S; //set sprite for minimap
								miniValues3S[1] = image_angle; //set angle of rotation
								miniValues3S[2] = xx; //x position
								miniValues3S[3] = yy; //y position
								miniValues3S[4] = yy; //general depth, some objects can set this to 0 or other small number if bottom layer
								ds_map_add(global.minimapVar, id+(logId*3), miniValues3S);
								ds_list_add(global.activemm, id+(logId*3)); //add it to list of active minimap symbols
								//show_debug_message("idLog: "+string(id+(logId*3)));
								numberLogs++;
							}
							if((walli == 12) && (logs > 3)) {
								//var log4S;
								if(logType[3] == 0)
									log4S = s_birch_log;
								if(logType[3] == 1)
									log4S = s_spruce_log;

								miniValues4S[0] = log4S; //set sprite for minimap
								miniValues4S[1] = image_angle; //set angle of rotation
								miniValues4S[2] = xx; //x position
								miniValues4S[3] = yy; //y position
								miniValues4S[4] = yy; //general depth, some objects can set this to 0 or other small number if bottom layer
								ds_map_add(global.minimapVar, id+(logId*4), miniValues4S);
								ds_list_add(global.activemm, id+(logId*4)); //add it to list of active minimap symbols
								//show_debug_message("idLog: "+string(id+(logId*4)));
								numberLogs++;
							}
							if((walli == 16) && (logs > 4)) {
								//var log5S;
								if(logType[4] == 0)
									log5S = s_birch_log;
								if(logType[4] == 1)
									log5S = s_spruce_log;

								miniValues5S[0] = log5S; //set sprite for minimap
								miniValues5S[1] = image_angle; //set angle of rotation
								miniValues5S[2] = xx; //x position
								miniValues5S[3] = yy; //y position
								miniValues5S[4] = yy; //general depth, some objects can set this to 0 or other small number if bottom layer
								ds_map_add(global.minimapVar, id+(logId*5), miniValues5S);
								ds_list_add(global.activemm, id+(logId*5)); //add it to list of active minimap symbols
								//show_debug_message("idLog: "+string(id+(logId*5)));
								numberLogs++;
							}
							// Drawing metal wall
							if((walli == 0) && (upgraded)){
								if((image_angle >90) && (image_angle < 270)){
									//if at the top of the circle else use the other y
									yy2 = y+lengthdir_y(17,-camera_get_view_angle(view_camera[0])+90);
									if (yy2 < 0) { yy2 += room_height; }
									if (yy2 >= room_height) { yy2 -= room_height; }
								}
								else
									yy2=yy;
				
								miniValues6S[0] = s_wall_metal; //set sprite for minimap
								miniValues6S[1] = image_angle; //set angle of rotation
								miniValues6S[2] = xx; //x position
								miniValues6S[3] = yy; //y position
								miniValues6S[4] = yy2; //general depth, some objects can set this to 0 or other small number if bottom layer
								ds_map_add(global.minimapVar, id+(logId*6), miniValues6S);
								ds_list_add(global.activemm, id+(logId*6)); //add it to list of active minimap symbols	
								//show_debug_message("idLog: "+string(id+(logId*6)));
							}	
						}
	
					
					}
				#endregion
				
				#region o_door_wall
					if(object_index == o_door_wood){
						isCamp = _map[? "isCamp"];	
					}
				
				#endregion
				
				#region o_firepit
					if(object_index == o_firepit){
					
						ds_grid_read(items, _map[? "itemsString"]);
						ds_grid_read(count, _map[? "countString"]);
						ds_grid_read(durability, _map[? "druabilityString"]);
					
						logCount = _map[? "logCount"];
						isLit = _map[? "isLit"];
						isBloomery = _map[? "isBloomery"];
						isSulfur = _map[? "isSulfur"];
						isMetal = _map[? "isMetal"];
						canAdd = _map[? "canAdd"];
					
						/*    (the stuff thats saved just for reference)
						var firepit_itemsString = ds_grid_write(items);
						var firepit_countString = ds_grid_write(count);
						var firepit_durabilityString = ds_grid_write(durability)
		
						ds_map_add(_map, "itemsString", firepit_itemsString);
						ds_map_add(_map, "countString", firepit_countString);
						ds_map_add(_map, "durabilityString", firepit_durabilityString);
		
						ds_map_add(_map, "logCount", logCount)
						ds_map_add(_map, "isLit", isLit);
						ds_map_add(_map, "isBloomery", isBloomery);
						ds_map_add(_map, "isSulfur", isSulfur);
						ds_map_add(_map, "isMetal", isMetal);
						ds_map_add(_map, "canAdd", canAdd);*/
					
					}
				#endregion
				
				#region car, smallchest, largechest
					if(object_index == o_car){
						spawnItems = false;
						ds_grid_read(items, _map[? "itemsString"]);
						ds_grid_read(count, _map[? "countString"]);
						ds_grid_read(durability, _map[? "durabilityString"]);
						/*
						ds_map_add(_map, "itemsString", car_itemsString);
						ds_map_add(_map, "countString", car_countString);
						ds_map_add(_map, "durabilityString", car_durabilityString);
						*/
					}
					if(object_index == o_enemy_dead){
						spawnItems = false;
						ds_grid_read(items, _map[? "itemsString"]);
						ds_grid_read(count, _map[? "countString"]);
						ds_grid_read(durability, _map[? "durabilityString"]);
					}
					if(object_index == o_small_crate){
						show_debug_message("reading for small crate");
						ds_grid_read(items, _map[? "itemsString"]);
						ds_grid_read(count, _map[? "countString"]);
						ds_grid_read(durability, _map[? "durabilityString"]);
					
						health_ = _map[? "health"];
					
					}
					if(object_index == o_large_crate){
						show_debug_message("reading for large crate");
						ds_grid_read(items, _map[? "itemsString"]);
						ds_grid_read(count, _map[? "countString"]);
						ds_grid_read(durability, _map[? "durabilityString"]);
					
						health_ = _map[? "health"];
					
					}
				
				#endregion
				
				#region o_enemySword
				
					//with(o_enemySword){
					if(object_index == o_enemySword){
						acceleration = _map[? "acceleration"];
						p_speed = _map[? "p_speed"];
						xdir = _map[? "xdir"];
						ydir = _map[? "ydir"];
						move_dir = _map[? "move_dir"];
						move_dis = _map[? "move_dis"];
						img_index = _map[? "img_index"];
						dir_ref = _map[? "dir_ref"];
						img_frame = _map[? "img_frame"];
						enemy_health = _map[? "enemy_health"];
						healthMax = _map[? "healthMax"];
						isDying = _map[? "isDying"];
						isDead = _map[? "isDead"];
						isIdle = _map[? "isIdle"];
						isWalking = _map[? "isWalking"];
						isRunning = _map[? "isRunning"];
					}
	
					//with(o_enemyBow){
					if(object_index == o_enemyBow){	
						acceleration = _map[? "acceleration"];
						p_speed = _map[? "p_speed"];
						xdir = _map[? "xdir"];
						ydir = _map[? "ydir"];
						move_dir = _map[? "move_dir"];
						move_dis = _map[? "move_dis"];
						img_index = _map[? "img_index"];
						dir_ref = _map[? "dir_ref"];
						img_frame = _map[? "img_frame"];
						enemy_health = _map[? "enemy_health"];
						healthMax = _map[? "healthMax"];
						isDying = _map[? "isDying"];
						isDead = _map[? "isDead"];
						isIdle = _map[? "isIdle"];
						isWalking = _map[? "isWalking"];
						isRunning = _map[? "isRunning"];
						playerFlee = _map[? "playerFlee"];
					}
				#endregion
				
				#region goblin
				
				if(object_index == o_goblin){
					mode = _map[? "modeString"];
					anim = _map[? "animString"];
					canHit = _map[? "canHitString"];
					enemy_health = _map[? "enemy_health_string"];
					healthMax = _map[? "healthMaxString"];
					deathAngle = _map[? "deathAngleString"];
				}
				
				#endregion
				
				
					//change its minimap values now that its correctly made
					if(ds_list_find_index(global.activemm,_inst.id)){//if it is registered active
						var miniValues = ds_map_find_value(global.minimapVar, _inst.id);
						miniValues[0] = sprite_index; //set sprite for minimap
						miniValues[1] = _map[? "image_angle"]; //set angle of rotation
						miniValues[2] = _map[? "xmm"]; //x position
						miniValues[3] = _map[? "ymm"]; //y position
						miniValues[4] = mmdepth; //general depth, some objects can set this to 0 or other small number if bottom layer
						ds_map_replace(global.minimapVar, _inst.id ,miniValues);
					}
					else{//if its not registered active 
						//var miniValues1;
						miniValues1[0] = sprite_index; //set sprite for minimap
						miniValues1[1] = _map[? "image_angle"]; //set angle of rotation
						miniValues1[2] = _map[? "xmm"]; //x position
						miniValues1[3] = _map[? "ymm"]; //y position
						miniValues1[4] = mmdepth; //general depth, some objects can set this to 0 or other small number if bottom layer

						ds_map_add(global.minimapVar, _inst.id, miniValues1);
						ds_list_add(global.activemm, _inst.id); //add it to list of active minimap symbols
	
					}
				
				//with the instance
				add_to_list(_root_list);
				}
			}
			else if(type == 0){
				show_debug_message("find type 0");
			
				//global.xoffset = _map[? "xoffset"];
				//global.yoffset = _map[? "yoffset"];
			
				//take the biome array out of the file
				var biomeArrayHeight = _map[? "biomeArrayHeight"];
				var biomeArrayLen = _map[? "biomeArrayLen"];
			
				for(var biomeArrI = 0; biomeArrI < biomeArrayHeight; biomeArrI++){
					for(var biomeArrJ = 0; biomeArrJ < biomeArrayLen; biomeArrJ++){
						global.biomeArray[biomeArrI, biomeArrJ] = 
						_map[? ("biomeArray["+string(biomeArrI)+","+string(biomeArrJ)+"]")];
					}
				}
	
				//put the chunk loaded info into the file
				var chunkLoadedSize = _map[? "chunkLoadedSize"]; 
	
				for(var chunkLI = 0; chunkLI < chunkLoadedSize; chunkLI++){
					global.chunkLoaded[chunkLI] = _map[? ("chunkLoaded["+string(chunkLI)+"]")];
				}
	
				//global.blockArr = _map[? "blockArr"];
				//global.biomeArr = _map[? "biomeArr"];
			}
			else if(type == 2){//markers
				var _objm = _map[? "obj"];
				var _xm = _map[? "x"];
				var _ym = _map[? "y"];
			
				with(instance_create_layer(_xm,_ym,ground, asset_get_index(_objm)))
				{
					color = _map[? "color"];
					index = _map[? "index"];
					//o_hud.markerX[index] = _xm;
					//o_hud.markerY[index] = _ym;
					image_blend = _map[? "image_blend"];
					image_index = _map[? "image_index"];
					image_angle = _map[? "image_angle"];
				}
			}
			
			else if(type == 3){
				with(o_hud){
			#region marker values
				//initialize lists
				var markerNameList = ds_list_create();
				var markerXList = ds_list_create();
				var markerYList = ds_list_create();
				var markerColList = ds_list_create();
			
				//read from string back to list
				ds_list_read(markerNameList, _map[? "markerNameString"]);
				ds_list_read(markerXList, _map[? "markerXString"]);
				ds_list_read(markerYList, _map[? "markerYString"]);
				ds_list_read(markerColList, _map[? "markerColString"]);
			
				//convert from list back to array
				for (var h=0; h<10; h++)
				{
					markerName[h] =	ds_list_find_value(markerNameList, h);
					markerX[h] = ds_list_find_value(markerXList, h);
					markerY[h] = ds_list_find_value(markerYList, h);
					if(markerX[h] != -1){
						show_debug_message("markerX: "+string(markerX[h])); 
						show_debug_message("markerY: "+string(markerY[h]));
					}
					markerCol[h] = ds_list_find_value(markerColList, h);
					show_debug_message("h val: "+string(h));
				}
			
				//destroy lists
				ds_list_destroy(markerNameList);
				ds_list_destroy(markerXList);
				ds_list_destroy(markerYList);
				ds_list_destroy(markerColList);
			
			#endregion
			#region items, inventory etc
			
				//read all the string grids to grids
				ds_grid_read(equipItems, _map[? "equipItemsString"]);
				ds_grid_read(equipDurability, _map[? "equipDurabilityString"]);
				ds_grid_read(items, _map[? "itemsString"]);
				ds_grid_read(durability, _map[? "durabilityString"]);
				ds_grid_read(count, _map[? "countString"]);
				ds_grid_read(hotbarItems, _map[? "hotbarItemsString"]);
				ds_grid_read(hotbarCount, _map[? "hotbarCountString"]);
				ds_grid_read(hotbarDurability, _map[? "hotbarDurabilityString"]);
			
			#endregion
				}
			#region overhead array and sprite
				ds_list_copy(global.overheadXList, _map[? "overheadXList"]);
				ds_list_copy(global.overheadYList, _map[? "overheadYList"]);
				global.mmOverheadSprite = sprite_add(global.currentFile+"-os.png", 1, false, false, 0, 0);
			#endregion
			
			#region minimap sprite
		
			//array of all blocks of minimaps
		#region filling the array, old fashioned way
			with(o_hud){
				//var tim1 = get_timer();
						//************************
						//      normal loop
						//************************
				var iv = 0;
				//find the bx and by values from the i value
				show_debug_message("active list size: "+string(ds_list_size(global.activemm)));
				show_debug_message("map size: "+string(ds_map_size(global.minimapVar)));
				for(var bx2 = 0; bx2 < global.blockXNum; bx2++){
					for(var by2 = 0; by2 < global.blockYNum; by2++){
						//if(iv == mapBlockCurrent){
							var	blockSpr = scr_create_map_block(bx2,by2, mapWidth, mapHeight);
							//var blockSpr = scr_create_blank_block(bx2, by2, mapWidth, mapHeight);
							global.blockArr[iv] = blockSpr;
							show_debug_message("block"+string(iv));
						//}
						//draw_sprite(global.blockArr[iv], 0 , bx*(blockWidthmm), by*(blockHeightmm));
						iv++;
					}
				}
			}
			
			//var tim2 = get_timer();
			
			//show_debug_message("map create time: "+string(tim2-tim1));
		#endregion	
		
			#endregion
			
			}
		}
	
		ds_map_destroy(_wrapper);
	
		show_debug_message("numAdded: "+string(numAdded));
		global.generatingEnvironment = false;
		show_debug_message("Game Loaded");
	}
	else{ //if file_exists fails
		show_error("file: "+_filename+" does not exist or cannot be found", false);
	}


}


/*
function add_to_list(_root_list){
	#region 
	
		var _map = ds_map_create();
		ds_list_add(_root_list, _map); //this only adds a pointer
		ds_list_mark_as_map(_root_list, ds_list_size(_root_list)-1);
		//take last entry (the _map) marks as a ds_map, so it saves the data not pointer
	
		var _obj = object_get_name(object_index); //find name
		ds_map_add (_map, "houseVar", false);
		ds_map_add (_map, "type", 1); //add type int
		ds_map_add (_map, "obj", _obj); //adds name under obj
	
			ds_map_add(_map, "mmTrue", false);
			ds_map_add(_map, "image_angle", image_angle);	
	
	
		var yn3d = y+global.yoffset;
		var xn3d = x+global.xoffset;
		if (yn3d < 0) { yn3d += room_height; }
		if (yn3d >= room_height) { yn3d -= room_height; }
		if (xn3d < 0) { xn3d += room_width; }
		if (xn3d >= room_width) { xn3d -= room_width; }
		ds_map_add (_map, "y", yn3d); //adds y coordinate
		ds_map_add (_map, "x", xn3d); //adds x coordinate
	
		ds_map_add (_map, "image_index", image_index); //adds image index
		ds_map_add (_map, "image_blend", image_blend); //adds image blend
	
		
		if(object_index == o_small_crate){
			//show_debug_message("saving small crate");
		
			var smallCrate_itemsString = ds_grid_write(items);
			var smallCrate_countString = ds_grid_write(count);
			var smallCrate_durabilityString = ds_grid_write(durability);
		
			ds_map_add(_map, "itemsString", smallCrate_itemsString);
			ds_map_add(_map, "countString", smallCrate_countString);
			ds_map_add(_map, "durabilityString", smallCrate_durabilityString);
		
			ds_map_add(_map, "health", health_);
		}
		if(object_index == o_large_crate){
			//show_debug_message("saving large crate");
		
			var largeCrate_itemsString = ds_grid_write(items);
			var largeCrate_countString = ds_grid_write(count);
			var largeCrate_durabilityString = ds_grid_write(durability);
		
			ds_map_add(_map, "itemsString", largeCrate_itemsString);
			ds_map_add(_map, "countString", largeCrate_countString);
			ds_map_add(_map, "durabilityString", largeCrate_durabilityString);
		
			ds_map_add(_map, "health", health_);
		}
		if(object_index == o_goblin){
			
			ds_map_add(_map, "modeString", mode);
			ds_map_add(_map, "animString", anim);
			ds_map_add(_map, "canHitString", canHit);
			ds_map_add(_map, "enemy_health_string", enemy_health);
			ds_map_add(_map, "healthMaxString", healthMax);
			ds_map_add(_map, "deathAngleString", deathAngle);
		}

#endregion
}*/