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
	
		var w11 = instance_create_depth(2308.258, 1678.881, 1, o_cave_wall);
		//var w11 = room_instance_add(room, 2319.25, 1678.88, o_cave_wall);
		w11.image_angle = -175.9008;
		with(w11){add_to_list(_root_list);}
	
		var w12 = instance_create_depth(2388.874, 1629.271, 1, o_cave_wall);
		//var w12 = room_instance_add(room, 2390.874, 1602.9, o_cave_wall);
		w12.image_angle = -117.3511;
		with(w12){add_to_list(_root_list);}
	
		var w13 = instance_create_depth(2413, 1583.461, 1, o_cave_wall);
		//var w13 = room_instance_add(room, 2399, 1565, o_cave_wall);
		w13.image_angle = -122.4071;
		with(w13){add_to_list(_root_list);}
	
		var w14 = instance_create_depth(2439.746, 1548, 1, o_cave_wall);
		//var w14 = room_instance_add(room, 2423.745, 1542, o_cave_wall);
		w14.image_angle = -136.2946;
		with(w14){add_to_list(_root_list);}
	
		var w15 = instance_create_depth(2477, 1468, 1, o_cave_wall);
		//var w15 = room_instance_add(room, 2457.194, 1442, o_cave_wall);
		w15.image_angle = -94.83904;
		with(w15){add_to_list(_root_list);}
	
		var w16 = instance_create_depth(2483, 1416.241, 1, o_cave_wall);
		//var w16 = room_instance_add(room, 2456.127, 1439, o_cave_wall);
		w16.image_angle = -98.11392;
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
	
		
		//generate blanks
		var b1 = instance_create_depth(2049.565, 1643, 1, o_cave_blank);
		//b1.image_angle = 0;
		with(b1){add_to_list(_root_list);}
		
		var b2 = instance_create_depth(1979.346, 1643, 1, o_cave_blank);
		//b2.image_angle = 0;
		with(b2){add_to_list(_root_list);}
		
		var b3 = instance_create_depth(2018, 1718, 1, o_cave_blank);
		//b3.image_angle = 0;
		with(b3){add_to_list(_root_list);}
		
		var b4 = instance_create_depth(2105, 1718, 1, o_cave_blank);
		//b4.image_angle = 0;
		with(b4){add_to_list(_root_list);}
		
		var b5 = instance_create_depth(2195, 1715, 1, o_cave_blank);
		//b5.image_angle = 0;
		with(b5){add_to_list(_root_list);}
		
		var b6 = instance_create_depth(2267, 1710, 1, o_cave_blank);
		//b6.image_angle = 0;
		with(b6){add_to_list(_root_list);}
		
		var b7 = instance_create_depth(2350, 1710, 1, o_cave_blank);
		//b7.image_angle = 0;
		with(b7){add_to_list(_root_list);}
		
		var b8 = instance_create_depth(2435, 1723, 1, o_cave_blank);
		//b8.image_angle = 0;
		with(b8){add_to_list(_root_list);}
		
		var b9 = instance_create_depth(2427, 1667, 1, o_cave_blank);
		//b9.image_angle = 0;
		with(b9){add_to_list(_root_list);}
		
		var b10 = instance_create_depth(2491, 1667, 1, o_cave_blank);
		//b10.image_angle = 0;
		with(b10){add_to_list(_root_list);}
		
		var b11 = instance_create_depth(2503, 1736, 1, o_cave_blank);
		//b11.image_angle = 0;
		with(b11){add_to_list(_root_list);}
		
		var b12 = instance_create_depth(2487, 1602, 1, o_cave_blank);
		//b12.image_angle = 0;
		with(b12){add_to_list(_root_list);}
		
		var b13 = instance_create_depth(2427, 1620.09, 1, o_cave_blank);
		//b13.image_angle = 0;
		with(b13){add_to_list(_root_list);}
		
		var b14 = instance_create_depth(2495, 1531, 1, o_cave_blank);
		//b14.image_angle = 0;
		with(b14){add_to_list(_root_list);}
		
		var b15 = instance_create_depth(2509, 1457.867, 1, o_cave_blank);
		//b15.image_angle = 0;
		with(b15){add_to_list(_root_list);}
		
		var b16 = instance_create_depth(2507, 1377, 1, o_cave_blank);
		//b16.image_angle = 0;
		with(b16){add_to_list(_root_list);}
		
		var b17 = instance_create_depth(2512.447, 1290, 1, o_cave_blank);
		//b17.image_angle = 0;
		with(b17){add_to_list(_root_list);}
		
		var b18 = instance_create_depth(2009, 1254, 1, o_cave_blank);
		//b18.image_angle = 0;
		with(b18){add_to_list(_root_list);}
		
		var b19 = instance_create_depth(2063, 1235.844, 1, o_cave_blank);
		//b19.image_angle = 0;
		with(b19){add_to_list(_root_list);}
		
		var b20 = instance_create_depth(2034, 1272.5, 1, o_cave_blank);
		//b20.image_angle = 0;
		with(b20){add_to_list(_root_list);}
		
		var b21 = instance_create_depth(2001.565, 1342, 1, o_cave_blank);
		//b21.image_angle = 0;
		with(b21){add_to_list(_root_list);}
		
		var b22 = instance_create_depth(1995, 1425, 1, o_cave_blank);
		//b22.image_angle = 0;
		with(b22){add_to_list(_root_list);}
		
		var b23 = instance_create_depth(2006, 1510, 1, o_cave_blank);
		//b23.image_angle = 0;
		with(b23){add_to_list(_root_list);}
		
		var b24 = instance_create_depth(2001, 1599, 1, o_cave_blank);
		//b24.image_angle = 0;
		with(b24){add_to_list(_root_list);}
		
		var b25 = instance_create_depth(2027.346, 1607.462, 1, o_cave_blank);
		//b25.image_angle = 0;
		with(b25){add_to_list(_root_list);}
		
		var b26 = instance_create_depth(2029, 1755, 1, o_cave_blank);
		//b26.image_angle = 0;
		with(b26){add_to_list(_root_list);}
		
		var b27 = instance_create_depth(2105, 1757, 1, o_cave_blank);
		//b27.image_angle = 0;
		with(b27){add_to_list(_root_list);}
		
		var b28 = instance_create_depth(2188, 1775, 1, o_cave_blank);
		//b28.image_angle = 0;
		with(b28){add_to_list(_root_list);}
		
		var b29 = instance_create_depth(2272, 1761, 1, o_cave_blank);
		//b29.image_angle = 0;
		with(b29){add_to_list(_root_list);}
		
		var b30 = instance_create_depth(2357, 1783, 1, o_cave_blank);
		//b30.image_angle = 0;
		with(b30){add_to_list(_root_list);}
		
		var b31 = instance_create_depth(2452, 1771, 1, o_cave_blank);
		//b31.image_angle = 0;
		with(b31){add_to_list(_root_list);}
		
		var b32 = instance_create_depth(2527, 1728, 1, o_cave_blank);
		//b32.image_angle = 0;
		with(b32){add_to_list(_root_list);}
		
		var b33 = instance_create_depth(2538, 1639, 1, o_cave_blank);
		//b33.image_angle = 0;
		with(b33){add_to_list(_root_list);}
		
		var b34 = instance_create_depth(2518, 1565, 1, o_cave_blank);
		//b34.image_angle = 0;
		with(b34){add_to_list(_root_list);}
		
		var b35 = instance_create_depth(2529, 1475, 1, o_cave_blank);
		//b35.image_angle = 0;
		with(b35){add_to_list(_root_list);}
		
		var b36 = instance_create_depth(2532, 1381, 1, o_cave_blank);
		//b36.image_angle = 0;
		with(b36){add_to_list(_root_list);}
		
		var b37 = instance_create_depth(2528, 1282, 1, o_cave_blank);
		//b37.image_angle = 0;
		with(b37){add_to_list(_root_list);}
		
		var b38 = instance_create_depth(2435, 1225, 1, o_cave_blank);
		//b38.image_angle = 0;
		with(b38){add_to_list(_root_list);}
		
		var b39 = instance_create_depth(2082, 1223, 1, o_cave_blank);
		//b39.image_angle = 0;
		with(b39){add_to_list(_root_list);}
		
		var b40 = instance_create_depth(1996, 1262, 1, o_cave_blank);
		//b40.image_angle = 0;
		with(b40){add_to_list(_root_list);}
		
		var b41 = instance_create_depth(1983, 1354, 1, o_cave_blank);
		//b41.image_angle = 0;
		with(b41){add_to_list(_root_list);}
		
		var b42 = instance_create_depth(1972, 1454, 1, o_cave_blank);
		//b42.image_angle = 0;
		with(b42){add_to_list(_root_list);}
		
		var b43 = instance_create_depth(1982, 1543, 1, o_cave_blank);
		//b43.image_angle = 0;
		with(b43){add_to_list(_root_list);}
		
		var b44 = instance_create_depth(1967, 1624, 1, o_cave_blank);
		//b44.image_angle = 0;
		with(b44){add_to_list(_root_list);}
		
		var b45 = instance_create_depth(1977, 1701, 1, o_cave_blank);
		//b45.image_angle = 0;
		with(b45){add_to_list(_root_list);}
		
		var b46 = instance_create_depth(2008, 1782, 1, o_cave_blank);
		//b46.image_angle = 0;
		with(b46){add_to_list(_root_list);}
		
		var b47 = instance_create_depth(2071, 1764, 1, o_cave_blank);
		//b47.image_angle = 0;
		with(b47){add_to_list(_root_list);}
		
		
		//random number of rocks to generate
		var curRocks = 0; 
		var chestSpawned = false;
		var maxRocks = 4;
		while(curRocks < maxRocks){
			if(!chestSpawned){
				var ranDirC = irandom(360);
				var ranLenC = irandom_range(0,30);
				var chestX = xCen+lengthdir_x(ranLenC, ranDirC);
				var chestY = yCen+lengthdir_y(ranLenC, ranDirC);
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
				if(place_meeting(x,y ,o_cave_wall) || place_meeting(x,y, o_cave_exit) || place_meeting(x,y,o_bigrock) || place_meeting(x,y,o_small_crate)){
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
					if(place_meeting(x,y ,o_cave_wall) || place_meeting(x,y, o_cave_exit) || place_meeting(x,y, o_rocks) || place_meeting(x,y, o_rock)|| place_meeting(x,y, o_bigrock)
					||place_meeting(x,y,o_small_crate)){
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
					place_meeting(x,y, o_rocks) || place_meeting(x,y, o_bigrock) || place_meeting(x,y, o_rock)||place_meeting(x,y,o_small_crate)){
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
	
		var exitCase = 0;
		var curGoblins = 0;
		var maxGoblins = irandom(4);
		while(curGoblins < maxGoblins){
			var ranAngleGoblin = irandom(360);
			var ranLenGoblin = irandom_range(0, 200);
			var goblinX = xCen+lengthdir_x(ranLenGoblin, ranAngleGoblin);
			var goblinY = yCen+lengthdir_y(ranLenGoblin, ranAngleGoblin);
			var goblin = instance_create_depth(goblinX, goblinY, 1, o_goblin);
			with(goblin){
				if(place_meeting(x,y ,o_cave_wall) || place_meeting(x,y, o_cave_exit) || 
					place_meeting(x,y, o_rocks) || place_meeting(x,y, o_bigrock) || place_meeting(x,y, o_rock) || place_meeting(x,y,o_small_crate)){
						instance_destroy(self);
						curGoblins--;
					}
					else
						with(self){add_to_list(_root_list);}
			}
			curGoblins++;
			exitCase++;
			//iff its looped too many times just exit
			if(exitCase > 50000)
				curGoblins = maxGoblins;
		}
	}
	else{
		save_cave_loadFile(global.currentFile+"-"+string(indexVal), indexVal);	
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
			/*
			var gobMode = mode;
			var gobAnim = anim;
			var gobCanHit = canHit;
			var gobEnemyHealth = enemy_health;
			var gobHealthMax = healthMax;
			var gobDeathAngle = deathAngle;
			*/
			
			ds_map_add(_map, "modeString", mode);
			ds_map_add(_map, "animString", anim);
			ds_map_add(_map, "canHitString", canHit);
			ds_map_add(_map, "enemy_health_string", enemy_health);
			ds_map_add(_map, "healthMaxString", healthMax);
			ds_map_add(_map, "deathAngleString", deathAngle);
		}

#endregion
}