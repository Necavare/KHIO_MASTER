//load

//enter a new empty room of correct size
// ...

//create any objects that need to be created that were not saved
// ...

	//for(var i = 0; i < ds_list_size(_list); i++){
if( i < listSize){
	repeat(180){
		if( i < listSize){
			var _map = _list[| i];// ds_list_find_value
			var type = _map[? "type"];
			if(type==1){	
				numAdded++;
			
				/*
				if(_map[? "houseVar"])
					o_initializer.generatorWallAngle = _map[? "image_angle"];
				*/
				var _obj = _map[? "obj"];
				var _x = _map[? "x"];
				var _y = _map[? "y"];
				//if(_map[? "houseVar"])
					generatorWallAngle = _map[? "image_angle"];
			
				//since saving layer is not working, no loading it either
				//var _layer = _map[? "layer"];
				var _inst =instance_create_layer(_x, _y, ground, asset_get_index(_obj));
				with(_inst)
				{
					
					#region tower, shed, hosuse}
					
					/*
					if(object_index == o_tower){
						instance_deactivate_object(instBotLeftLog);
						instance_deactivate_object(instBotRightLog);
						instance_deactivate_object(instTopLeftLog);
						instance_deactivate_object(instTopRightLog);
						instance_deactivate_object(instRoof);
					}
					if(object_index == o_shed){
						instance_deactivate_object(instBackWall);
						instance_deactivate_object(instBR);
						instance_deactivate_object(instBL);
						instance_deactivate_object(instFR);
						instance_deactivate_object(instFL);
						instance_deactivate_object(instDoor);
						instance_deactivate_object(instFloor);
						instance_deactivate_object(instLeftSide);
						instance_deactivate_object(instRightSide);
					}
					if(object_index == o_house){
						instance_deactivate_object(instDoor);
						instance_deactivate_object(instBack);
						instance_deactivate_object(instFloor);
						instance_deactivate_object(instRoof);
						instance_deactivate_object(instSideL);
						instance_deactivate_object(instSideR);
					}*/
					//if(object_index == o_shed || object_index == o_tower || object_index == o_house){
						
					//}
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
						campId = _map[? "campId"];
						
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
						ds_grid_read(durability, _map[? "durabilityString"]);
					
						logCount = _map[? "logCount"];
						isLit = _map[? "isLit"];
						isBloomery = _map[? "isBloomery"];
						isSulfur = _map[? "isSulfur"];
						isMetal = _map[? "isMetal"];
						canAdd = _map[? "canAdd"];
					
					}
					#endregion
				
					#region car, smallchest, largechest, o_enemyDead
					if(object_index == o_car){
						spawnItems = false;
						ds_grid_read(items, _map[? "itemsString"]);
						ds_grid_read(count, _map[? "countString"]);
						ds_grid_read(durability, _map[? "durabilityString"]);
					}
					if(object_index == o_enemy_dead){
						spawnItems = false;
						ds_grid_read(items, _map[? "itemsString"]);
						ds_grid_read(count, _map[? "countString"]);
						ds_grid_read(durability, _map[? "durabilityString"]);
					}
					if(object_index == o_small_crate){
						//show_debug_message("reading for small crate");
						ds_grid_read(items, _map[? "itemsString"]);
						ds_grid_read(count, _map[? "countString"]);
						ds_grid_read(durability, _map[? "durabilityString"]);
					
						health_ = _map[? "health"];
					}
					if(object_index == o_large_crate){
						//show_debug_message("reading for large crate");
						ds_grid_read(items, _map[? "itemsString"]);
						ds_grid_read(count, _map[? "countString"]);
						ds_grid_read(durability, _map[? "durabilityString"]);
					
						health_ = _map[? "health"];
					
					}
					if(object_index == o_friend_dead){
						ds_grid_read(items, _map[? "itemsString"]);
						ds_grid_read(count, _map[? "countString"]);
						ds_grid_read(durability, _map[? "durabilityString"]);
					}
				
					#endregion
				
					#region spruce stump and bush
					if(object_index == o_bush){
						isEmpty = _map[? "isEmpty"];
					}	
					if(object_index == o_spruce_stump){
						isFungi = _map[? "isFungi"];
					}
					
					#endregion
				
					#region o_cave_entrance
					
					if(object_index == o_cave_entrance){
						listIndex = _map[? "listIndex"];
						
						//load 
						scr_createCave_load(listIndex);
						
						
					}
					#endregion
					
					#region o_enemySword and bow
				
					with(o_enemySword){
						show_debug_message("loading enemy sword :::::")
						acceleration = _map[? "acceleration"];
						show_debug_message("acceleration : "+string(acceleration));
						p_speed = _map[? "p_speed"];
						show_debug_message("p_speed : "+string(p_speed));
						xdir = _map[? "xdir"];
						show_debug_message("xdir : "+string(xdir));
						ydir = _map[? "ydir"];
						show_debug_message("ydir : "+string(ydir));
						move_dir = _map[? "move_dir"];
						show_debug_message("move_dir : " +string(move_dir));
						move_dis = _map[? "move_dis"];
						show_debug_message("move_dis : "+string(move_dis));
						img_index = _map[? "img_index"];
						show_debug_message("img_index : "+string(img_index));
						dir_ref = _map[? "dir_ref"];
						show_debug_message("dir_ref : "+string(dir_ref));
						img_frame = _map[? "img_frame"];
						show_debug_message("img_frame : "+string(img_frame));
						enemy_health = _map[? "enemy_health"];
						healthMax = _map[? "healthMax"];
						isDying = _map[? "isDying"];
						isDead = _map[? "isDead"];
						isIdle = _map[? "isIdle"];
						isWalking = _map[? "isWalking"];
						isRunning = _map[? "isRunning"];
						show_debug_message("---------------------------------------------------");
					}
	
					with(o_enemyBow){
						show_debug_message("loading enemy bow :::::")
						acceleration = _map[? "acceleration"];
						show_debug_message("acceleration : "+string(acceleration));
						p_speed = _map[? "p_speed"];
						show_debug_message("p_speed : "+string(p_speed));
						xdir = _map[? "xdir"];
						show_debug_message("xdir : "+string(xdir));
						ydir = _map[? "ydir"];
						show_debug_message("ydir : "+string(ydir));
						move_dir = _map[? "move_dir"];
						show_debug_message("move_dir : " +string(move_dir));
						move_dis = _map[? "move_dis"];
						show_debug_message("move_dis : "+string(move_dis));
						img_index = _map[? "img_index"];
						show_debug_message("img_index : "+string(img_index));
						dir_ref = _map[? "dir_ref"];
						show_debug_message("dir_ref : "+string(dir_ref));
						img_frame = _map[? "img_frame"];
						show_debug_message("img_frame : "+string(img_frame));
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
				
					//change its minimap values now that its correctly made
					/*
					if(ds_list_find_index(global.activemm,_inst.id)){//if it is registered active
						var miniValues = ds_map_find_value(global.minimapVar, _inst.id);
						miniValues[0] = sprite_index; //set sprite for minimap
						miniValues[1] = _map[? "image_angle"]; //set angle of rotation
						miniValues[2] = _map[? "xmm"]; //x position
						miniValues[3] = _map[? "ymm"]; //y position
						miniValues[4] = mmdepth; //general depth, some objects can set this to 0 or other small number if bottom layer
						ds_map_replace(global.minimapVar, _inst.id ,miniValues);
					}
					else{//if its not registered active */
						//var miniValues1;
					
					if( _map[? "mmTrue"]){
						#region lake
							if(object_index == o_lake){
								ds_queue_enqueue(global.bigLakeIDQ, _inst);
							}
							#endregion
					
						miniValues1[0] = sprite_index; //set sprite for minimap
						miniValues1[1] = _map[? "image_angle"]; //set angle of rotation
						miniValues1[2] = _map[? "xmm"]; //x position
						miniValues1[3] = _map[? "ymm"]; //y position
						miniValues1[4] = mmdepth; //general depth, some objects can set this to 0 or other small number if bottom layer

						ds_map_add(global.minimapVar, _inst.id, miniValues1);
						ds_list_add(global.activemm, _inst.id); //add it to list of active minimap symbols
					}
					//}
				}
				//instance_deactivate_object(_inst);
			}
			else if(type == 4){
				//var _x = _map[? "x"];
				//var _y = _map[? "y"];
				futurePlayerX = _map[? "x"];
				futurePlayerY = _map[? "y"];
				
				
				o_player.health_ = _map[? "health_"];
				o_player.stamina = _map[? "stamina"];
				o_player.maxHealth = _map[? "maxHealth"];
				o_player.hunger_ = _map[? "hunger_"];
				
			}
			else if(type == 0){
				//show_debug_message("find type 0");
			
				//global.xoffset = _map[? "xoffset"];
				//global.yoffset = _map[? "yoffset"];
				//show_debug_message("loaded xoffset:" +string(global.xoffset));
				//show_debug_message("loaded yoffset:" +string(global.yoffset));
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
	
				//load cave list
				ds_list_read(global.caveInstanceLoaded, _map[? "caveLoad_"]);
				
				for(var index_ =0; index_ < ds_list_size(global.caveInstanceLoaded); index_++ ){
					//initialize it here
					ds_list_add(global.caveList, false); //add it to the list
					ds_list_add(global.caveLoadList, false);
				}
				
				//global.blockArr = _map[? "blockArr"];
				//global.biomeArr = _map[? "biomeArr"];
			}
			else if(type == 2){//markers
				var _objm = _map[? "obj"];
				var _xm = _map[? "x"];
				var _ym = _map[? "y"];
				var _instM = instance_create_layer(_xm, _ym, ground, asset_get_index(_objm));
				with(_instM)
				{
					buildZ = _map[? "buildZ"];
					color = _map[? "color"];
					index = _map[? "index"];
					//o_hud.markerX[index] = _xm;
					//o_hud.markerY[index] = _ym;
					image_blend = _map[? "image_blend"];
					image_index = _map[? "image_index"];
					image_angle = _map[? "image_angle"];
				}
				//instance_deactivate_object(_instM);
			}
			else if(type == 3){
				//show_debug_message("type 3 load");
				with(o_hud){
					
				//show_debug_message("setting hud values");
				#region marker values
				//initialize lists
				var markerNameList = ds_list_create();
				var markerXList = ds_list_create();
				var markerYList = ds_list_create();
				var markerColList = ds_list_create();
				
				/*
				var campIdList = ds_list_create();
				var campColList = ds_list_create();
				var campXList = ds_list_create();
				var campYList = ds_list_create();
				*/
				
				//read from string back to list
				ds_list_read(markerNameList, _map[? "markerNameString"]);
				ds_list_read(markerXList, _map[? "markerXString"]);
				ds_list_read(markerYList, _map[? "markerYString"]);
				ds_list_read(markerColList, _map[? "markerColString"]);
			
				/*
				ds_list_read(campIdList, _map[? "campIdString"]);
				ds_list_read(campColList, _map[? "campColString"]);
				ds_list_read(campXList, _map[? "campXString"]);
				ds_list_read(campYList, _map[? "campYString"]);*/
				
				ds_list_read(global.campIdList, _map[? "campIdString"]);
				ds_list_read(global.campCol, _map[? "campColString"]);
				ds_list_read(global.campXList, _map[? "campXString"]);
				ds_list_read(global.campYList, _map[? "campYString"]);
				
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
					//show_debug_message("h val: "+string(h));
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
				#endregion
			
				/*
				//copy the list version of bluckUpdate back into an array
				var saved_blockUpdateList = ds_list_create()
				ds_list_copy(saved_blockUpdateList, _map[? "blockUpdateList"]);
				for(var bUI = 0; bUI < global.blockXNum*global.blockYNum; bUI++){
					global.blockUpdateArr[bUI] = ds_list_find_value(saved_blockUpdateList, bUI);	
				}
				ds_list_destroy(saved_blockUpdateList);
				*/
				
				ds_list_copy(global.blockUpdateHistory, _map[? "blockUpdateHistory"]);
				for(var uhi = 0; uhi < ds_list_size(global.blockUpdateHistory); uhi++){
					show_debug_message("uhi: "+string(uhi)+" val: "+string(ds_list_find_value(global.blockUpdateHistory, uhi)));	
				}
				
				//add timer stuff
				
				o_shaders.hour_of_day = _map[? "hour_of_day"];
				o_shaders.minute_of_day = _map[? "minute_of_day"];
				global.days = _map[? "days"];
				
			}
		
			i++;//keep going down i
		}
	}
}
else if(blockI < (global.blockXNum*global.blockYNum)){
	show_debug_message(global.blockUpdateHistory);
	
repeat(40){
		var currentBlock = blockI;
			//array of all blocks of minimaps
		#region filling the array, old fashioned way
		
		with(o_hud){
			//var tim1 = get_timer();
					//************************
					//      normal loop
					//************************
			var iv = 0;
			//find the bx and by values from the i value
			//show_debug_message("active list size: "+string(ds_list_size(global.activemm)));
			//show_debug_message("map size: "+string(ds_map_size(global.minimapVar)));
			
			for(var bx2 = 0; bx2 < global.blockXNum; bx2++){
				for(var by2 = 0; by2 < global.blockYNum; by2++){
					if(iv == currentBlock){
						
						if(ds_list_find_value(global.blockUpdateHistory, iv)){
							show_debug_message("block :"+string(iv));
							var	blockSpr = scr_create_map_block(bx2,by2, mapWidth, mapHeight);
							//var blockSpr = scr_create_blank_block(bx2, by2, mapWidth, mapHeight);
							global.blockArr[iv] = blockSpr;
							//show_debug_message("block"+string(iv));
						}
						else{
							var blockSpr2 = scr_create_blank_block(bx2, by2, mapWidth, mapHeight);
							global.blockArr[iv] = blockSpr2;
						}
					}
					//draw_sprite(global.blockArr[iv], 0 , bx*(blockWidthmm), by*(blockHeightmm));
					iv++;
				}
			}
		}
			
		blockI++;
		//var tim2 = get_timer();
			
		//show_debug_message("map create time: "+string(tim2-tim1));
		
		#endregion	

		#region loading from the sprites on file
		
		/*
		//************************
		//      normal loop
		//************************
		var iv = 0;
		//find the bx and by values from the i value
		for(var bxS = 0; bxS < global.blockXNum; bxS++){
			for(var byS = 0; byS < global.blockYNum; byS++){
				if(iv == currentBlock){
					global.blockArr = sprite_add(global.currentFile+"_block_"+string(iv)+".png", 1, false, false, 0, 0);
				}
				iv++;
			}
		}
		*/
		#endregion

}
		
}else{	
	ds_map_destroy(_wrapper);
	o_player.x = futurePlayerX;
	o_player.y = futurePlayerY;
	o_hud.x = futurePlayerX;
	o_hud.y = futurePlayerY;
	o_camera.x = futurePlayerX;
	o_camera.y = futurePlayerY;
	
	show_debug_message("numAdded: "+string(numAdded));
	global.generatingEnvironment = false;
	//show_debug_message("Game Loaded");
	instance_destroy(self);
}

if(ds_queue_size(activeQueue) == 0){
	ds_queue_enqueue(activeQueue, o_camera.id);
	ds_queue_enqueue(activeQueue, o_player.id);
	ds_queue_enqueue(activeQueue, o_shaders.id);
	ds_queue_enqueue(activeQueue, o_initializer.id);
	ds_queue_enqueue(activeQueue, o_weather.id);
	ds_queue_enqueue(activeQueue, o_hud.id);
	//ds_queue_enqueue(activeQueue, o_debugger.id);
	ds_queue_enqueue(activeQueue, o_input.id);
}

instance_deactivate_all(true);

var sizeAQ = ds_queue_size(activeQueue);
for(var queV = 0; queV < sizeAQ; queV++){
	var queueID = ds_queue_dequeue(activeQueue);
	//show_debug_message("activating: "+string(object_get_name(queueID.object_index)));
	instance_activate_object(queueID);
	ds_queue_enqueue(activeQueue, queueID);
}
/*
instance_activate_object(o_camera);
instance_activate_object(o_player);
instance_activate_object(o_shaders);	
instance_activate_object(o_initializer);
instance_activate_object(o_weather);
instance_activate_object(o_hud);
instance_activate_object(o_debugger);
instance_activate_object(o_input);
*/


instance_activate_layer(loadingLayerId);
instance_activate_object(o_footprint);