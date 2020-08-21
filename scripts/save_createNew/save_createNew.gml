/// @desc save_createNew(filename)
/// @arg filename
function save_createNew(argument0) {

	var _filename = argument0;

	//create a root list
	var _root_list = ds_list_create();



	//**********************************************
	//-----------------
	//    type key
	//----------------
	// 0 = global/nonglobal initilizer variables 
	// 1 = basic objects ("par_3d_obj", trees, boxes, animals etc.)
	// 2 = markers 
	// 3 = o_hud stuff, minimap blocks, marker library, inventory etc.
	// 4 = player
	//**********************************************

	//for every instance, create a map

	//with all basic objects (par_3d plus some no_depth that are still basic)
	/*
	these objects: but doesnt work when done like this (or when || )

	with (par_3d_object&&o_bedroll&&o_tower&&o_house_floor
		&&o_house_roof&&o_shed_floor&&o_shed_roof&&o_snow_texture){
	*/

	//instance_activate_all();
	var numAdded = 0;

#region o_initializer
	// but not really since it seems to not be here anymore (its inactive or destroyed)

	//with(o_initializer){ 
		show_debug_message("adding initializer to save");
	
		var _map0 = ds_map_create();
		ds_list_add(_root_list, _map0); //this only adds a pointer
		ds_list_mark_as_map(_root_list, ds_list_size(_root_list)-1);
		//take last entry (the _map) marks as a ds_map, so it saves the data not pointer
	
		var _obj = object_get_name(object_index); //find name
		ds_map_add (_map0, "type", 0); //add type int
		ds_map_add (_map0, "xoffset", global.xoffset);//add x offset
		ds_map_add (_map0, "yoffset", global.yoffset);//add y offset 
	
		/*
		//put the block array into the file
		ds_map_add (_map0, "blockArrLen", array_length(global.blockArr));
		for(var blockArrI = 0; blockArrI < array_length(global.blockArr); blockArrI++){
			ds_map_add(_map0, "blockArr["+string(blockArrI)+"]", global.blockArr[blockArrI]);
		}*/
	
		//put the biome array into the file
		var biomeArrayHeight = array_height_2d(global.biomeArray);
		var biomeArrayLen = array_length_2d(global.biomeArray, 0);
		ds_map_add (_map0, "biomeArrayHeight", biomeArrayHeight);
		ds_map_add (_map0, "biomeArrayLen", biomeArrayLen);
	
		for(var biomeArrI = 0; biomeArrI < biomeArrayHeight; biomeArrI++){
			for(var biomeArrJ = 0; biomeArrJ < biomeArrayLen; biomeArrJ++){
				ds_map_add(_map0, "biomeArray["+string(biomeArrI)+","+string(biomeArrJ)+"]",
				global.biomeArray[biomeArrI, biomeArrJ]);
			}
		}
	
		//put the chunk loaded info into the file
		var chunkLoadedSize = array_length(global.chunkLoaded);
		ds_map_add (_map0, "chunkLoadedSize", chunkLoadedSize);
	
		for(var chunkLI = 0; chunkLI < chunkLoadedSize; chunkLI++){
			ds_map_add(_map0, "chunkLoaded["+string(chunkLI)+"]", global.chunkLoaded[chunkLI]);	
		}
	
		//ds_map_destroy(_map0);
		/*
		for(var biomeArrI = 0; biomeArrI < array_length(global.biomeArray); biomeArrI++){
			ds_map_add(_map0, "biomeArray["+string(biomeArrI)+"]", global.biomeArray[biomeArrI]);
		}*/
	
	//}
#endregion

#region par_3d_object
	with (par_3d_object && par_flammable){
	
		//dont add parts of towers/sheds/houses etc.
		if(object_index !=o_tower_log && object_index != o_tower_ladder && object_index != o_tower_roof &&
			object_index != o_house_back && object_index != o_house_door && object_index != o_house_floor &&
			object_index != o_house_side && object_index != o_house_roof && object_index != o_shed_back &&
			object_index != o_shed_door && object_index != o_shed_door && object_index != o_shed_floor &&
			object_index != o_shed_side && object_index != o_shed_roof && object_index != o_shed_pillar){
	
	
		numAdded++;
	
		var _map = ds_map_create();
		ds_list_add(_root_list, _map); //this only adds a pointer
		ds_list_mark_as_map(_root_list, ds_list_size(_root_list)-1);
		//take last entry (the _map) marks as a ds_map, so it saves the data not pointer
	
		var _obj = object_get_name(object_index); //find name
		ds_map_add (_map, "houseVar", false);
		ds_map_add (_map, "type", 1); //add type int
		ds_map_add (_map, "obj", _obj); //adds name under obj
	
		if(ds_list_find_index(global.activemm,id)||object_index == o_lake){//if it is registered active
			ds_map_add(_map, "mmTrue", true);
			var miniValuesPrev = ds_map_find_value(global.minimapVar, id);
			ds_map_add (_map, "image_angle", miniValuesPrev[1]); //adds angle
			ds_map_add (_map, "xmm", miniValuesPrev[2]);
			ds_map_add (_map, "ymm", miniValuesPrev[3]);
			ds_map_add (_map, "mmdepth", miniValuesPrev[4]); //add minimap depth
		}
		else{
			ds_map_add(_map, "mmTrue", false);
			ds_map_add(_map, "image_angle", image_angle);	
		}
	
		var yn3d = y+global.yoffset;
		var xn3d = x+global.xoffset;
		if (yn3d < 0) { yn3d += room_height; }
		if (yn3d >= room_height) { yn3d -= room_height; }
		if (xn3d < 0) { xn3d += room_width; }
		if (xn3d >= room_width) { xn3d -= room_width; }
		ds_map_add (_map, "y", yn3d); //adds y coordinate
		ds_map_add (_map, "x", xn3d); //adds x coordinate
	
	
	
		//currently not working says "-1" which means no layer, odd. but not important
		//ds_map_add (_map, "layer", layer); //add its layer
		//show_debug_message(layer);
	
	
		ds_map_add (_map, "image_index", image_index); //adds image index
		ds_map_add (_map, "image_blend", image_blend); //adds image blend
	
		if(object_index == o_wall_wood){
			//add the log array into the wall
			ds_map_add(_map, "logs", logs);
			for(var logI = 0; logI < 5; logI++)
				ds_map_add(_map, "logType["+string(logI)+"]", logType[logI]);
			ds_map_add(_map, "upgraded", upgraded);//add upgraded boolean
			ds_map_add(_map, "isCamp", isCamp);//add isCamp boolean
			ds_map_add(_map, "campId", campId);
			//ds_map_add (_map, "");	
		}
		if(object_index == o_door_wood){
			ds_map_add(_map, "isCamp", isCamp);//add isCamp boolean	
		}
		if(object_index == o_firepit){
		
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
			ds_map_add(_map, "canAdd", canAdd);
		
		}
		if(object_index == o_car){
			var car_itemsString = ds_grid_write(items);
			var car_countString = ds_grid_write(count);
			var car_durabilityString = ds_grid_write(durability);
		
			ds_map_add(_map, "itemsString", car_itemsString);
			ds_map_add(_map, "countString", car_countString);
			ds_map_add(_map, "durabilityString", car_durabilityString);
		}
		if(object_index == o_enemy_dead){
			var enemyDead_itemsString = ds_grid_write(items);
			var enemyDead_countString = ds_grid_write(count);
			var enemyDead_durabilityString = ds_grid_write(durability);
		
			ds_map_add(_map, "itemsString", enemyDead_itemsString);
			ds_map_add(_map, "countString", enemyDead_countString);
			ds_map_add(_map, "durabilityString", enemyDead_durabilityString);
		}
		if(object_index == o_small_crate){
			show_debug_message("saving small crate");
		
			var smallCrate_itemsString = ds_grid_write(items);
			var smallCrate_countString = ds_grid_write(count);
			var smallCrate_durabilityString = ds_grid_write(durability);
		
			ds_map_add(_map, "itemsString", smallCrate_itemsString);
			ds_map_add(_map, "countString", smallCrate_countString);
			ds_map_add(_map, "durabilityString", smallCrate_durabilityString);
		
			ds_map_add(_map, "health", health_);
		}
		if(object_index == o_large_crate){
			show_debug_message("saving large crate");
		
			var largeCrate_itemsString = ds_grid_write(items);
			var largeCrate_countString = ds_grid_write(count);
			var largeCrate_durabilityString = ds_grid_write(durability);
		
			ds_map_add(_map, "itemsString", largeCrate_itemsString);
			ds_map_add(_map, "countString", largeCrate_countString);
			ds_map_add(_map, "durabilityString", largeCrate_durabilityString);
		
			ds_map_add(_map, "health", health_);
		}
		if(object_index == o_friend_dead){
			show_debug_message("saving dead friend");
		
			var deadfriend_itemsString = ds_grid_write(items);
			var deadfriend_countString = ds_grid_write(count);
			var deadfriend_durablityString = ds_grid_write(durability);
		
			ds_map_add(_map, "itemsString", deadfriend_itemsString);
			ds_map_add(_map, "countString", deadfriend_countString);
			ds_map_add(_map, "durabilityString", deadfriend_durablityString);
		}
		if(object_index == o_bush){
			ds_map_add(_map, "isEmpty", isEmpty);	
		}
		if(object_index == o_spruce_stump){
			ds_map_add(_map, "isFungi:", isFungi);
		}
	
	
		//ds_map_destroy(_map);
		}// end of the if check for exclusions
	}

	//COPY PASTE OF WHATS ABOVE /////\\\\\
	/*
	with(par_flammable){
		numAdded++;
	
	
		var _map = ds_map_create();
		ds_list_add(_root_list, _map); //this only adds a pointer
		ds_list_mark_as_map(_root_list, ds_list_size(_root_list)-1);
		//take last entry (the _map) marks as a ds_map, so it saves the data not pointer
	
		var _obj = object_get_name(object_index); //find name
		ds_map_add (_map, "type", 1); //add type int
		ds_map_add (_map, "obj", _obj); //adds name under obj
	
		if(ds_list_find_index(global.activemm,id)){//if it is registered active
			var miniValuesPrev = ds_map_find_value(global.minimapVar, id);
			ds_map_add (_map, "image_angle", miniValuesPrev[1]); //adds angle
			ds_map_add (_map, "xmm", miniValuesPrev[2]);
			ds_map_add (_map, "ymm", miniValuesPrev[3]);
			ds_map_add (_map, "mmdepth", miniValuesPrev[4]); //add minimap depth
		}
		else{
			ds_map_add(_map, "image_angle", image_angle);	
		}
	
		var yn3d = y+global.yoffset;
		var xn3d = x+global.xoffset;
		if (yn3d < 0) { yn3d += room_height; }
		if (yn3d >= room_height) { yn3d -= room_height; }
		if (xn3d < 0) { xn3d += room_width; }
		if (xn3d >= room_width) { xn3d -= room_width; }
		ds_map_add (_map, "y", yn3d); //adds y coordinate
		ds_map_add (_map, "x", xn3d); //adds x coordinate
	
	
	
		//currently not working says "-1" which means no layer, odd. but not important
		//ds_map_add (_map, "layer", layer); //add its layer
		//show_debug_message(layer);
	
	
		ds_map_add (_map, "image_index", image_index); //adds image index
		ds_map_add (_map, "image_blend", image_blend); //adds image blend
	}*/
#endregion

#region o_player
	with(o_player){
	var _mapOP = ds_map_create();
	ds_list_add(_root_list, _mapOP); //this only adds a pointer
	ds_list_mark_as_map(_root_list, ds_list_size(_root_list)-1);
	//take last entry (the _map) marks as a ds_map, so it saves the data not pointer
	
	var _obj = object_get_name(object_index); //find name
	ds_map_add (_mapOP, "type", 4); //add type int
	ds_map_add (_mapOP, "obj", _obj); //adds name under obj

	var ynPlayer = y+global.yoffset;
	var xnPlayer = x+global.xoffset;
	if (ynPlayer < 0) { ynPlayer += room_height; }
	if (ynPlayer >= room_height) { ynPlayer -= room_height; }
	if (xnPlayer < 0) { xnPlayer += room_width; }
	if (xnPlayer >= room_width) { xnPlayer -= room_width; }
	ds_map_add (_mapOP, "y", ynPlayer); //adds y coordinate
	ds_map_add (_mapOP, "x", xnPlayer); //adds x coordinate
	
	//ds_map_add (_mapOP, "y", y-global.yoffset); //adds y coordinate
	//ds_map_add (_mapOP, "x", x-global.xoffset); //adds x coordinate
	
	ds_map_add (_mapOP, "image_index", image_index); //adds image index
	ds_map_add (_mapOP, "image_blend", image_blend); //adds image blend
	ds_map_add (_mapOP, "image_angle", image_angle); //adds angle

	ds_map_add(_mapOP, "health_", health_);//adds health
	ds_map_add(_mapOP, "stamina", stamina);//adds stamina
	ds_map_add(_mapOP, "hunger_", hunger_);//adds hunger
	ds_map_add(_mapOP, "maxHealth", maxHealth);//max health


	//ds_map_destroy(_mapOP);
	}
#endregion

#region o_markers
	with(o_marker){
		var _mapm = ds_map_create();
		ds_list_add(_root_list, _mapm); //this only adds a pointer
		ds_list_mark_as_map(_root_list, ds_list_size(_root_list)-1);
		//take last entry (the _map) marks as a ds_map, so it saves the data not pointer
	
		var _objm = object_get_name(object_index); //find name
		ds_map_add (_mapm, "type", 2); //add type int
		ds_map_add (_mapm, "obj", _objm); //adds name under obj
		var ym = y+global.yoffset;
		var xm = x+global.xoffset;
		if (ym < 0) { ym += room_height; }
	    if (ym >= room_height) { ym -= room_height; }
	    if (xm < 0) { xm += room_width; }
	    if (xm >= room_width) { xm -= room_width; }
		ds_map_add (_mapm, "y", ym); //adds y coordinate
		ds_map_add (_mapm, "x", xm); //adds x coordinate
		ds_map_add (_mapm, "color", color); //add its color
		ds_map_add (_mapm, "index", index); //add its index
		ds_map_add (_mapm, "buildZ", buildZ);
	
		ds_map_add (_mapm, "image_index", image_index); //adds image index
		ds_map_add (_mapm, "image_blend", image_blend); //adds image blend
		ds_map_add (_mapm, "image_angle", image_angle); //adds angle
	
		//ds_map_destroy (_mapm);
	}
#endregion

#region o_snow_texture
	with(o_snow_texture){
		var _mapST = ds_map_create();
		ds_list_add(_root_list, _mapST); //this only adds a pointer
		ds_list_mark_as_map(_root_list, ds_list_size(_root_list)-1);
		//take last entry (the _map) marks as a ds_map, so it saves the data not pointer
	
		var _obj = object_get_name(object_index); //find name
		ds_map_add (_mapST, "houseVar", false);
		ds_map_add (_mapST, "type", 1); //add type int
		ds_map_add (_mapST, "obj", _obj); //adds name under obj
		ds_map_add (_mapST, "y", y-global.yoffset); //adds y coordinate
		ds_map_add (_mapST, "x", x-global.xoffset); //adds x coordinate
	
		ds_map_add (_mapST, "image_index", image_index); //adds image index
		ds_map_add (_mapST, "image_blend", image_blend); //adds image blend
		ds_map_add (_mapST, "image_angle", image_angle); //adds angle
	
		//ds_map_destroy (_mapST);
	}
#endregion

#region o_bedroll
	with(o_bedroll){
		var _mapBR = ds_map_create();
		ds_list_add(_root_list, _mapBR); //this only adds a pointer
		ds_list_mark_as_map(_root_list, ds_list_size(_root_list)-1);
		//take last entry (the _map) marks as a ds_map, so it saves the data not pointer
	
		var _obj = object_get_name(object_index); //find name
		ds_map_add (_mapBR, "houseVar", false);
		ds_map_add (_mapBR, "type", 1); //add type int
		ds_map_add (_mapBR, "obj", _obj); //adds name under obj
		ds_map_add (_mapBR, "y", y-global.yoffset); //adds y coordinate
		ds_map_add (_mapBR, "x", x-global.xoffset); //adds x coordinate
	
		ds_map_add (_mapBR, "image_index", image_index); //adds image index
		ds_map_add (_mapBR, "image_blend", image_blend); //adds image blend
		ds_map_add (_mapBR, "image_angle", image_angle); //adds angle
	
		//ds_map_destroy(_mapBR);
	}
#endregion

#region o_tower
	with(o_tower){
		var _mapT = ds_map_create();
		ds_list_add(_root_list, _mapT); //this only adds a pointer
		ds_list_mark_as_map(_root_list, ds_list_size(_root_list)-1);
		//take last entry (the _map) marks as a ds_map, so it saves the data not pointer
	
		var _obj = object_get_name(object_index); //find name
		ds_map_add (_mapT, "houseVar", true);
		ds_map_add (_mapT, "type", 1); //add type int
		ds_map_add (_mapT, "obj", _obj); //adds name under obj
		ds_map_add (_mapT, "y", y-global.yoffset); //adds y coordinate
		ds_map_add (_mapT, "x", x-global.xoffset); //adds x coordinate
	
		ds_map_add (_mapT, "image_index", image_index); //adds image index
		ds_map_add (_mapT, "image_blend", image_blend); //adds image blend
		ds_map_add (_mapT, "image_angle", image_angle); //adds angle
	
		//ds_map_destroy(_mapT);
	}
#endregion

#region o_house_floor
	with(o_house_floor){
		var _mapHF = ds_map_create();
		ds_list_add(_root_list, _mapHF); //this only adds a pointer
		ds_list_mark_as_map(_root_list, ds_list_size(_root_list)-1);
		//take last entry (the _map) marks as a ds_map, so it saves the data not pointer
	
		var _obj = object_get_name(object_index); //find name
		ds_map_add (_mapHF, "houseVar", true);
		ds_map_add (_mapHF, "type", 1); //add type int
		ds_map_add (_mapHF, "obj", _obj); //adds name under obj
		ds_map_add (_mapHF, "y", y-global.yoffset); //adds y coordinate
		ds_map_add (_mapHF, "x", x-global.xoffset); //adds x coordinate
	
		ds_map_add (_mapHF, "image_index", image_index); //adds image index
		ds_map_add (_mapHF, "image_blend", image_blend); //adds image blend
		ds_map_add (_mapHF, "image_angle", image_angle); //adds angle
	
		//ds_map_destroy(_mapHF);
	}
#endregion

#region o_house_roof
	with(o_house_roof){
		/*
		var _mapHR = ds_map_create();
		ds_list_add(_root_list, _mapHR); //this only adds a pointer
		ds_list_mark_as_map(_root_list, ds_list_size(_root_list)-1);
		//take last entry (the _map) marks as a ds_map, so it saves the data not pointer
	
		var _obj = object_get_name(object_index); //find name
		ds_map_add (_mapHR, "type", 1); //add type int
		ds_map_add (_mapHR, "obj", _obj); //adds name under obj
		ds_map_add (_mapHR, "y", y-global.yoffset); //adds y coordinate
		ds_map_add (_mapHR, "x", x-global.xoffset); //adds x coordinate
	
		ds_map_add (_mapHR, "image_index", image_index); //adds image index
		ds_map_add (_mapHR, "image_blend", image_blend); //adds image blend
		ds_map_add (_mapHR, "image_angle", image_angle); //adds angle*/
	}
#endregion

#region o_shed_floor
	with(o_shed_floor){
		var _mapSF = ds_map_create();
		ds_list_add(_root_list, _mapSF); //this only adds a pointer
		ds_list_mark_as_map(_root_list, ds_list_size(_root_list)-1);
		//take last entry (the _map) marks as a ds_map, so it saves the data not pointer
	
		var _obj = object_get_name(object_index); //find name
		ds_map_add (_mapSF, "houseVar", true);
		ds_map_add (_mapSF, "type", 1); //add type int
		ds_map_add (_mapSF, "obj", _obj); //adds name under obj
		ds_map_add (_mapSF, "y", y-global.yoffset); //adds y coordinate
		ds_map_add (_mapSF, "x", x-global.xoffset); //adds x coordinate
	
		ds_map_add (_mapSF, "image_index", image_index); //adds image index
		ds_map_add (_mapSF, "image_blend", image_blend); //adds image blend
		ds_map_add (_mapSF, "image_angle", image_angle); //adds angle
	
		//ds_map_destroy(_mapSF);
	}
#endregion

#region o_shed_roof
	with(o_shed_roof){
		/*
		var _mapSR = ds_map_create();
		ds_list_add(_root_list, _mapSR); //this only adds a pointer
		ds_list_mark_as_map(_root_list, ds_list_size(_root_list)-1);
		//take last entry (the _map) marks as a ds_map, so it saves the data not pointer
	
		var _obj = object_get_name(object_index); //find name
		ds_map_add (_mapSR, "type", 1); //add type int
		ds_map_add (_mapSR, "obj", _obj); //adds name under obj
		ds_map_add (_mapSR, "y", y-global.yoffset); //adds y coordinate
		ds_map_add (_mapSR, "x", x-global.xoffset); //adds x coordinate
	
		ds_map_add (_mapSR, "image_index", image_index); //adds image index
		ds_map_add (_mapSR, "image_blend", image_blend); //adds image blend
		ds_map_add (_mapSR, "image_angle", image_angle); //adds angle */
	}
#endregion

#region enemy
	with(o_enemySword){

		var _mapES = ds_map_create();
		ds_list_add(_root_list, _mapES); //this only adds a pointer
		ds_list_mark_as_map(_root_list, ds_list_size(_root_list)-1);
		//take last entry (the _map) marks as a ds_map, so it saves the data not pointer
	
		var _obj = object_get_name(object_index); //find name
		ds_map_add (_mapES, "houseVar", false);
		ds_map_add (_mapES, "type", 1); //add type int
		ds_map_add (_mapES, "obj", _obj); //adds name under obj
	
		var ysword = y+global.yoffset;
		var xsword = x+global.xoffset;
		if (ysword < 0) { ysword += room_height; }
		if (ysword >= room_height) { ysword -= room_height; }
		if (xsword < 0) { xsword += room_width; }
		if (xsword >= room_width) { xsword -= room_width; }
	
		ds_map_add (_mapES, "y", ysword); //adds y coordinate
		ds_map_add (_mapES, "x", xsword); //adds x coordinate
	
		ds_map_add (_mapES, "image_index", image_index); //adds image index
		ds_map_add (_mapES, "image_blend", image_blend); //adds image blend
		ds_map_add (_mapES, "image_angle", image_angle); //adds angle
	
		ds_map_add(_mapES,"acceleration", acceleration);// add acceleration
		ds_map_add(_mapES,"p_speed", p_speed);// add p_speed
		ds_map_add(_mapES,"xdir", xdir);// add xdir
		ds_map_add(_mapES,"ydir", ydir);// add ydir
		ds_map_add(_mapES,"move_dir", move_dir);// add move_dir
		ds_map_add(_mapES,"move_dis", move_dis);// add move_dis
		ds_map_add(_mapES,"acceleration", acceleration);// add spr_index
		ds_map_add(_mapES,"img_index", img_index);// add img_index
		ds_map_add(_mapES,"dir_ref", dir_ref);// add dir_ref
		ds_map_add(_mapES,"img_frame", img_frame);// add img_frame
		ds_map_add(_mapES,"enemy_health", enemy_health);// add enemy_health
		ds_map_add(_mapES,"healthMax", healthMax);//add healthMax
		ds_map_add(_mapES,"isDying", isDying);// add isDying
		ds_map_add(_mapES,"isDead", isDead);// add isDead
		ds_map_add(_mapES,"isIdle", isIdle);// add isIdle
		ds_map_add(_mapES,"isWalking", isWalking);// add isWalking
		ds_map_add(_mapES,"isRunning", isRunning);// add isRunning
	
		//ds_map_destroy(_mapES);
	}
	with (o_enemyBow){
		var _mapEB = ds_map_create();
		ds_list_add(_root_list, _mapEB); //this only adds a pointer
		ds_list_mark_as_map(_root_list, ds_list_size(_root_list)-1);
		//take last entry (the _map) marks as a ds_map, so it saves the data not pointer
	
		var _obj = object_get_name(object_index); //find name
		ds_map_add (_mapEB, "type", 1); //add type int
		ds_map_add (_mapEB, "obj", _obj); //adds name under obj
	
		var ybow = y+global.yoffset;
		var xbow = x+global.xoffset;
		if (ybow < 0) { ybow += room_height; }
		if (ybow >= room_height) { ybow -= room_height; }
		if (xbow < 0) { xbow += room_width; }
		if (xbow >= room_width) { xbow -= room_width; }
		ds_map_add (_mapEB, "y", ybow); //adds y coordinate
		ds_map_add (_mapEB, "x", xbow); //adds x coordinate
	
		ds_map_add (_mapEB, "image_index", image_index); //adds image index
		ds_map_add (_mapEB, "image_blend", image_blend); //adds image blend
		ds_map_add (_mapEB, "image_angle", image_angle); //adds angle
	
		ds_map_add(_mapEB,"acceleration", acceleration);// add acceleration
		ds_map_add(_mapEB,"p_speed", p_speed);// add p_speed
		ds_map_add(_mapEB,"xdir", xdir);// add xdir
		ds_map_add(_mapEB,"ydir", ydir);// add ydir
		ds_map_add(_mapEB,"move_dir", move_dir);// add move_dir
		ds_map_add(_mapEB,"move_dis", move_dis);// add move_dis
		ds_map_add(_mapEB,"acceleration", acceleration);// add spr_index
		ds_map_add(_mapEB,"img_index", img_index);// add img_index
		ds_map_add(_mapEB,"dir_ref", dir_ref);// add dir_ref
		ds_map_add(_mapEB,"img_frame", img_frame);// add img_frame
		ds_map_add(_mapEB,"enemy_health", enemy_health);// add enemy_health
		ds_map_add(_mapEB,"healthMax", healthMax);//add healthMax
		ds_map_add(_mapEB,"isDying", isDying);// add isDying
		ds_map_add(_mapEB,"isDead", isDead);// add isDead
		ds_map_add(_mapEB,"isIdle", isIdle);// add isIdle
		ds_map_add(_mapEB,"isWalking", isWalking);// add isWalking
		ds_map_add(_mapEB,"isRunning", isRunning);// add isRunning
	
		ds_map_add(_mapEB, "playerFlee", playerFlee);// add playerFlee

		//ds_map_destroy(_mapEB);
	}

#endregion

#region o_hud (overhead array, minimap sprite, inventory)
	with(o_hud){
		var _map3 = ds_map_create();
		ds_list_add(_root_list, _map3);
		ds_list_mark_as_map(_root_list, ds_list_size(_root_list)-1);

		ds_map_add(_map3, "type", 3); //add type array blocks
	
	#region minimap marker and camp icon variables
		//convert from array to list
		var markerNameList = ds_list_create();
		var markerXList = ds_list_create();
		var markerYList = ds_list_create();
		var markerColList = ds_list_create();
		for (var i=0; i<10; i++)
		{
			ds_list_add(markerNameList, markerName[i]);
			if(markerX[i] != -1){
				var xscale = o_hud.mapWidth/room_width;
				var yscale = o_hud.mapHeight/room_height;
			
				markerX[i] = ((markerX[i]/xscale)+global.xoffset)*xscale;
				markerY[i] = ((markerY[i]/yscale)+global.yoffset)*yscale;
			
				ds_list_add(markerXList, markerX[i]);
				ds_list_add(markerYList, markerY[i]);
				show_debug_message("marker X: "+string(markerX[i]));
				show_debug_message("marker y: "+string(markerY[i]));
			}
			else{
				ds_list_add(markerXList, markerX[i]);
				ds_list_add(markerYList, markerY[i]);	
			}
			ds_list_add(markerColList, markerCol[i]);
		}
	
		var campIdList = ds_list_create();
		var campColList = ds_list_create();
		var campXList = ds_list_create();
		var campYList = ds_list_create();
		var xscale = o_hud.mapWidth/room_width;
		var yscale = o_hud.mapHeight/room_height;
			
		for(var h = 0; h < ds_list_size(global.campIdList); h++){
			ds_list_add(campIdList, h);
			ds_list_add(campColList, ds_list_find_value(global.campCol, h));
		
			var finalX = ((ds_list_find_value(global.campXList, h)/xscale)+global.xoffset)*xscale;
			var finalY = ((ds_list_find_value(global.campYList, h)/yscale)+global.yoffset)*yscale;
		
			ds_list_add(campXList, finalX);
			ds_list_add(campYList, finalY);
		}
	
	
		//convert to string
		var markerNameString = ds_list_write(markerNameList);
		var markerXString = ds_list_write(markerXList);
		var markerYString = ds_list_write(markerYList);
		var markerColString = ds_list_write(markerColList);
	
		var campIdString = ds_list_write(campIdList);
		var campColString = ds_list_write(campColList);
		var campXString = ds_list_write(campXList);
		var campYString = ds_list_write(campYList);
	
		//add to map
		ds_map_add(_map3, "markerNameString", markerNameString);
		ds_map_add(_map3, "markerXString", markerXString);
		ds_map_add(_map3, "markerYString", markerYString);
		ds_map_add(_map3, "markerColString", markerColString);
	
		ds_map_add(_map3, "campIdString", campIdString);
		ds_map_add(_map3, "campColString", campColString);
		ds_map_add(_map3, "campXString", campXString);
		ds_map_add(_map3, "campYString", campYString);
	
		//destroy lists
		ds_list_destroy(markerNameList);
		ds_list_destroy(markerXList);
		ds_list_destroy(markerYList);
		ds_list_destroy(markerColList);
	
		ds_list_destroy(campIdList);
		ds_list_destroy(campColList);
		ds_list_destroy(campXList);
		ds_list_destroy(campYList);
	
	#endregion
	#region overhead minimap stuff
		//all things related to overhead list and sprite
		var ref_overheadXList = ds_list_create();
		var ref_overheadYList = ds_list_create();
		ds_list_copy(ref_overheadXList, global.overheadXList);
		ds_list_copy(ref_overheadYList, global.overheadYList);
		ds_map_add_list(_map3, "overheadXList", ref_overheadXList);
		ds_map_add_list(_map3, "overheadYList", ref_overheadYList);
		//update the overhead incase player hasnt hit tab
		//overhead_update_mm1(mapWidth/5, mapHeight/5);
		sprite_save(global.mmOverheadSprite, 0, global.currentFile+"-os.png");
	#endregion 
	
	#region items, inventory etc
		//convert the ds_grids to strings so they can be stored
		// Equip slots
	
		//write all the grids to strings so they can be stored
		var equipItemsString = ds_grid_write(equipItems);
		var equipDurabilityString = ds_grid_write(equipDurability);
		//var slotsString = ds_grid_write(slots); not necessary cus its just for highlighting
		var itemsString = ds_grid_write(items);
		var durabilityString = ds_grid_write(durability);
		var countString = ds_grid_write(count);
		//var hotbarSlotsString = ds_grid_write(hotbarSlots); same as slots
		var hotbarItemsString = ds_grid_write(hotbarItems);
		var hotbarCountString = ds_grid_write(hotbarCount);
		var hotbarDurabilityString = ds_grid_write(hotbarDurability);

		//add all the strings to the stored map
		ds_map_add(_map3, "equipItemsString", equipItemsString);
		ds_map_add(_map3, "equipDurabilityString", equipDurabilityString);
		ds_map_add(_map3, "itemsString", itemsString);
		ds_map_add(_map3, "durabilityString", durabilityString);
		ds_map_add(_map3, "countString", countString);
		ds_map_add(_map3, "hotbarItemsString", hotbarItemsString);
		ds_map_add(_map3, "hotbarCountString", hotbarCountString);
		ds_map_add(_map3, "hotbarDurabilityString", hotbarDurabilityString);
	#endregion
	#region minimap sprites
	
		/*
		//var tim1 = get_timer();
		//************************
		//      normal loop
		//************************
		var iv = 0;
		//find the bx and by values from the i value
		for(var bxS = 0; bxS < global.blockXNum; bxS++){
			for(var byS = 0; byS < global.blockYNum; byS++){
				sprite_save(global.blockArr[iv], 0, global.currentFile+"_block_"+string(iv)+".png");
				iv++;
			}
		}*/
	#endregion
	
		/*
		var blockUpdateArrLen = global.blockXNum * global.blockYNum;
		var blockUpdateList = ds_list_create();
		for(var bUI = 0; bUI < blockUpdateArrLen; bUI++){
			ds_list_add(blockUpdateList, global.blockUpdateArr[bUI]);	
		}
		//save the list version
		ds_map_add_list(_map3, "blockUpdateList", blockUpdateList);
		*/
		var blockUpdateHistoryRef = ds_list_create();
		ds_list_copy(blockUpdateHistoryRef, global.blockUpdateHistory);
		ds_map_add_list(_map3, "blockUpdateHistory", blockUpdateHistoryRef);
	
	
		//add timer stuff
		ds_map_add(_map3, "hour_of_day", o_shaders.hour_of_day);//add hour of day
		ds_map_add(_map3, "minute_of_day", o_shaders.minute_of_day );//add minute of day
		ds_map_add(_map3, "days", global.days);
	
		//ds_map_destroy(_map3);
	}
#endregion

	show_debug_message("numAdded: "+string(numAdded));

	//wrap root List in a map
	var _wrapper = ds_map_create();
	ds_map_add_list(_wrapper, "ROOT", _root_list);

	//save all of this to a string
	var _string = json_encode(_wrapper);
	save_StringToFile(_filename, _string); //saved file name with the string of data

	//nuke data
	ds_list_destroy(_root_list);
	ds_map_destroy(_wrapper);

	show_debug_message("game saved");


}
