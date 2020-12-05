// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_generateCave(indexVal){
	show_debug_message("generating the cave");
	//if the loaded list is false then generate if loaded list is true then take from the loaded assets
	if(!ds_list_find_value(global.caveInstanceLoaded, indexVal)){
		
		//set up structures to save data to send to "saver"
		var _root_list = ds_list_create(); // saves all objects into one list
		ds_list_add(global.caveInstances, _root_list); // add the list to the global list
		ds_list_add(global.caveInstanceIndexVal, indexVal); // add a corresponding index value to another array
		ds_list_set(global.caveInstanceLoaded, indexVal, true);
		//list of all objects and their positions
	
	
		//the debug version is 2000, 1250
		var f1 = instance_create_depth(2000, 1250, 1, o_cavefloor);
		with(f1){add_to_list(_root_list);}
		var f2 = instance_create_depth(2000, 1500, 1, o_cavefloor);
		with(f2){add_to_list(_root_list);}
		var f3 = instance_create_depth(2250, 1250, 1, o_cavefloor);
		with(f3){add_to_list(_root_list);}
		var f4 = instance_create_depth(2250, 1500, 1, o_cavefloor);
		with(f4){add_to_list(_root_list);}
	
		var xCen = 2250;
		var yCen = 1500;
	
		//room_instance_add(room, 2000, 1250, o_cavefloor);
		//room_instance_add(room, 2000, 1500, o_cavefloor);
		//room_instance_add(room, 2250, 1250, o_cavefloor);
		//room_instance_add(room, 2250, 1500, o_cavefloor);
	
		var exit_ = instance_create_depth(2249, 1207, 1, o_cave_exit);
		with(exit_){add_to_list(_root_list);}
		//room_instance_add(room, 2249, 1207, o_cave_exit);//add exit
	
	
		//add walls
		var w1 = instance_create_depth(2176.47, 1217.01, 1, o_cave_wall)
		//var w1 = room_instance_add(room, 2176.47, 1217.01, o_cave_wall);
		w1.image_angle = 13.7366;
		with(w1){add_to_list(_root_list);}
	
		var w2 = instance_create_depth(2106, 1255.99, 1, o_cave_wall)
		//var w2 = room_instance_add(room, 2106, 1255.99, o_cave_wall);
		w2.image_angle = 42;
		with(w2){add_to_list(_root_list);}
	
		var w3 = instance_create_depth(2059, 1302.85, 1, o_cave_wall);
		//var w3 = room_instance_add(room, 2059, 1302.85, o_cave_wall);
		w3.image_angle = 49;
		with(w3){add_to_list(_root_list);}
	
		var w4 = instance_create_depth(2022.31, 1376, 1, o_cave_wall);
		//var w4 = room_instance_add(room, 2022.31, 1376, o_cave_wall);
		w4.image_angle = 78.6384;
		with(w4){add_to_list(_root_list);}
	
		var w5 = instance_create_depth(2020, 1451.12, 1, o_cave_wall);
		//var w5 = room_instance_add(room, 2020, 1451.12, o_cave_wall);
		w5.image_angle = 95.1543;
		with(w5){add_to_list(_root_list);}
	
		var w6 = instance_create_depth(2027.34, 1513.12, 1, o_cave_wall);
		//var w6 = room_instance_add(room, 2027.34, 1513.12, o_cave_wall);
		w6.image_angle = 94.17815;
		with(w6){add_to_list(_root_list);}
	
		var w7 = instance_create_depth(2049.565, 1588.9, 1, o_cave_wall);
		//var w7 = room_instance_add(room, 2049.565, 1588.9, o_cave_wall);
		w7.image_angle = 118.0635;
		with(w7){add_to_list(_root_list);}
	
		var w8 = instance_create_depth(2118, 1647.904, 1, o_cave_wall);
		//var w8 = room_instance_add(room, 2118, 1647.904, o_cave_wall);
		w8.image_angle = 161.6448;
		with(w8){add_to_list(_root_list);}
	
		var w9 = instance_create_depth(2181.744, 1666, 1, o_cave_wall);
		//var w9 = room_instance_add(room, 2181.744, 1666, o_cave_wall);
		w9.image_angle = 164.3404;
		with(w9){add_to_list(_root_list);}
	
		var w10 = instance_create_depth(2250, 1678.881, 1, o_cave_wall);
		//var w10 = room_instance_add(room, 2250, 1678.881, o_cave_wall);
		w10.image_angle = 175.4829;
		with(w10){add_to_list(_root_list);}
	
		var w11 = instance_create_depth(2319.25, 1678.88, 1, o_cave_wall);
		//var w11 = room_instance_add(room, 2319.25, 1678.88, o_cave_wall);
		w11.image_angle = -175.9008;
		with(w11){add_to_list(_root_list);}
	
		var w12 = instance_create_depth(2390.874, 1602.9, 1, o_cave_wall);
		//var w12 = room_instance_add(room, 2390.874, 1602.9, o_cave_wall);
		w12.image_angle = -92.72603;
		with(w12){add_to_list(_root_list);}
	
		var w13 = instance_create_depth(2399, 1565, 1, o_cave_wall);
		//var w13 = room_instance_add(room, 2399, 1565, o_cave_wall);
		w13.image_angle = -122.4071;
		with(w13){add_to_list(_root_list);}
	
		var w14 = instance_create_depth(2423.745, 1542, 1, o_cave_wall);
		//var w14 = room_instance_add(room, 2423.745, 1542, o_cave_wall);
		w14.image_angle = -153.9955;
		with(w14){add_to_list(_root_list);}
	
		var w15 = instance_create_depth(2457.194, 1442, 1, o_cave_wall);
		//var w15 = room_instance_add(room, 2457.194, 1442, o_cave_wall);
		w15.image_angle = -64.82484;
		with(w15){add_to_list(_root_list);}
	
		var w16 = instance_create_depth(2456.127, 1439, 1, o_cave_wall);
		//var w16 = room_instance_add(room, 2456.127, 1439, o_cave_wall);
		w16.image_angle = -133.4686;
		with(w16){add_to_list(_root_list);}
	
		var w17 = instance_create_depth(2491, 1362, 1, o_cave_wall);
		//var w17 = room_instance_add(room, 2491, 1362, o_cave_wall);
		w17.image_angle = -98.23183;
		with(w17){add_to_list(_root_list);}
	
		var w18 = instance_create_depth(2455, 1273, 1, o_cave_wall);
		//var w18 = room_instance_add(room, 2455, 1273, o_cave_wall);
		w18.image_angle = -38.53096;
		with(w18){add_to_list(_root_list);}
	
		var w19 = instance_create_depth(2387, 1236, 1, o_cave_wall);
		//var w19 = room_instance_add(room, 2387, 1236, o_cave_wall);
		w19.image_angle = -19.15454;
		with(w19){add_to_list(_root_list);}
	
		var w20 = instance_create_depth(2319.258, 1219, 1, o_cave_wall);
		//var w20 = room_instance_add(room, 2319.258, 1219, o_cave_wall);
		w20.image_angle = -10.5279;
		with(w20){add_to_list(_root_list);}
	
		//random number of rocks to generate
		var curRocks = 0;
		var chestSpawned = false;
		var maxRocks = 4;
		while(curRocks < maxRocks){
		if(!chestSpawned){
			var ranDirC = irandom(360);
			var ranLenC = irandom_range(10,30);
			var chestX = xCen+lengthdir_x(ranDirC, ranLenC);
			var chestY = yCen+lengthdir_y(ranDirC, ranLenC);
			var chest = instance_create_depth(chestX, chestY, 1, o_small_crate);
			chest.isCave = true;
			chestSpawned = true;
			with(chest){add_to_list(_root_list);}
		}
		
		//random direction
		var ranDir = irandom(360);
		var ranLen = irandom_range(70, 150);
		var bigRockX = xCen+lengthdir_x(ranLen, ranDir);
		var bigRockY = yCen+lengthdir_y(ranLen, ranDir);
		var rock = instance_create_depth(bigRockX, bigRockY, 1, o_bigrock);
		var rockDestroyed = false;
		with(rock){
			if(place_meeting(x,y ,o_cave_wall) || place_meeting(x,y, o_cave_exit) || place_meeting(x,y,o_bigrock)){
				rockDestroyed = true;
				instance_destroy(self);
			}
			else
				with(self){add_to_list(_root_list);}
		}
		
		//generate small rocks
		var maxSmallRocks = 10;
		var curSmallRocks = 0;
		while(!rockDestroyed && curSmallRocks < maxSmallRocks){
			var ranDir2 = irandom(360);
			var ranLen2 = irandom_range(25, 60);
			var small_rock = instance_create_depth(bigRockX+lengthdir_x(ranLen2, ranDir2), bigRockY+lengthdir_y(ranLen2, ranDir2), 1, o_rocks);
			with(small_rock){
				if(place_meeting(x,y ,o_cave_wall) || place_meeting(x,y, o_cave_exit) || place_meeting(x,y, o_rocks) || place_meeting(x,y, o_rock)|| place_meeting(x,y, o_bigrock)){
					instance_destroy(self);
				}
				else
					with(self){add_to_list(_root_list);}
			}
			var randomChance = irandom(99);
			if(randomChance < 50){
				curSmallRocks+=1;
			}
			else{
				curSmallRocks+=2;	
			}
		}
		
		//generate medium rocks
		var maxMedRocks = 5;
		var curMedRocks = 0;
		while(!rockDestroyed && curMedRocks < maxMedRocks){
			var ranDir3 = irandom(360);
			var ranLen3 = irandom_range(25, 75);
			var med_rock = instance_create_depth(bigRockX+lengthdir_x(ranLen3, ranDir3), bigRockY+lengthdir_y(ranLen3, ranDir3), 1, o_rock);
			with(med_rock){
				if(place_meeting(x,y ,o_cave_wall) || place_meeting(x,y, o_cave_exit) || 
				place_meeting(x,y, o_rocks) || place_meeting(x,y, o_bigrock) || place_meeting(x,y, o_rock)){
					instance_destroy(self);
				}
				else
					with(self){add_to_list(_root_list);}
			}
			curMedRocks+=1;
			
		}
		
		//set up the cur total of big rocks
			curRocks+=1;
	}
	
	}
	else{
		save_cave_loadFile(global.currentFile+"-"+string(indexVal));	
	}
}
	
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



#endregion
}