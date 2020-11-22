// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_generateCave(){
	
	
	//the debug version is 2000, 1250
	instance_create_depth(2000, 1250, 1, o_cavefloor);
	instance_create_depth(2000, 1500, 1, o_cavefloor);
	instance_create_depth(2250, 1250, 1, o_cavefloor);
	instance_create_depth(2250, 1500, 1, o_cavefloor);
	
	var xCen = 2250;
	var yCen = 1500;
	
	//room_instance_add(room, 2000, 1250, o_cavefloor);
	//room_instance_add(room, 2000, 1500, o_cavefloor);
	//room_instance_add(room, 2250, 1250, o_cavefloor);
	//room_instance_add(room, 2250, 1500, o_cavefloor);
	
	
	instance_create_depth(2249, 1207, 1, o_cave_exit);
	//room_instance_add(room, 2249, 1207, o_cave_exit);//add exit
	
	
	//add walls
	var w1 = instance_create_depth(2176.47, 1217.01, 1, o_cave_wall)
	//var w1 = room_instance_add(room, 2176.47, 1217.01, o_cave_wall);
	w1.image_angle = 13.7366;
	
	var w2 = instance_create_depth(2106, 1255.99, 1, o_cave_wall)
	//var w2 = room_instance_add(room, 2106, 1255.99, o_cave_wall);
	w2.image_angle = 42;
	
	var w3 = instance_create_depth(2059, 1302.85, 1, o_cave_wall);
	//var w3 = room_instance_add(room, 2059, 1302.85, o_cave_wall);
	w3.image_angle = 49;
	
	var w4 = instance_create_depth(2022.31, 1376, 1, o_cave_wall);
	//var w4 = room_instance_add(room, 2022.31, 1376, o_cave_wall);
	w4.image_angle = 78.6384;
	
	var w5 = instance_create_depth(2020, 1451.12, 1, o_cave_wall);
	//var w5 = room_instance_add(room, 2020, 1451.12, o_cave_wall);
	w5.image_angle = 95.1543;
	
	var w6 = instance_create_depth(2027.34, 1513.12, 1, o_cave_wall);
	//var w6 = room_instance_add(room, 2027.34, 1513.12, o_cave_wall);
	w6.image_angle = 94.17815;
	
	var w7 = instance_create_depth(2049.565, 1588.9, 1, o_cave_wall);
	//var w7 = room_instance_add(room, 2049.565, 1588.9, o_cave_wall);
	w7.image_angle = 118.0635;
	
	var w8 = instance_create_depth(2118, 1647.904, 1, o_cave_wall);
	//var w8 = room_instance_add(room, 2118, 1647.904, o_cave_wall);
	w8.image_angle = 161.6448;
	
	var w9 = instance_create_depth(2181.744, 1666, 1, o_cave_wall);
	//var w9 = room_instance_add(room, 2181.744, 1666, o_cave_wall);
	w9.image_angle = 164.3404;
	
	var w10 = instance_create_depth(2250, 1678.881, 1, o_cave_wall);
	//var w10 = room_instance_add(room, 2250, 1678.881, o_cave_wall);
	w10.image_angle = 175.4829;
	
	var w11 = instance_create_depth(2319.25, 1678.88, 1, o_cave_wall);
	//var w11 = room_instance_add(room, 2319.25, 1678.88, o_cave_wall);
	w11.image_angle = -175.9008;
	
	var w12 = instance_create_depth(2390.874, 1602.9, 1, o_cave_wall);
	//var w12 = room_instance_add(room, 2390.874, 1602.9, o_cave_wall);
	w12.image_angle = -92.72603;
	
	var w13 = instance_create_depth(2399, 1565, 1, o_cave_wall);
	//var w13 = room_instance_add(room, 2399, 1565, o_cave_wall);
	w13.image_angle = -122.4071;
	
	var w14 = instance_create_depth(2423.745, 1542, 1, o_cave_wall);
	//var w14 = room_instance_add(room, 2423.745, 1542, o_cave_wall);
	w14.image_angle = -153.9955;
	
	var w15 = instance_create_depth(2457.194, 1442, 1, o_cave_wall);
	//var w15 = room_instance_add(room, 2457.194, 1442, o_cave_wall);
	w15.image_angle = -64.82484;
	
	var w16 = instance_create_depth(2456.127, 1439, 1, o_cave_wall);
	//var w16 = room_instance_add(room, 2456.127, 1439, o_cave_wall);
	w16.image_angle = -133.4686;
	
	var w17 = instance_create_depth(2491, 1362, 1, o_cave_wall);
	//var w17 = room_instance_add(room, 2491, 1362, o_cave_wall);
	w17.image_angle = -98.23183;
	
	var w18 = instance_create_depth(2455, 1273, 1, o_cave_wall);
	//var w18 = room_instance_add(room, 2455, 1273, o_cave_wall);
	w18.image_angle = -38.53096;
	
	var w19 = instance_create_depth(2387, 1236, 1, o_cave_wall);
	//var w19 = room_instance_add(room, 2387, 1236, o_cave_wall);
	w19.image_angle = -19.15454;
	
	var w20 = instance_create_depth(2319.258, 1219, 1, o_cave_wall);
	//var w20 = room_instance_add(room, 2319.258, 1219, o_cave_wall);
	w20.image_angle = -10.5279;
	
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
			}
			curMedRocks+=1;
			
		}
		
		//set up the cur total of big rocks
			curRocks+=1;
	}
	
	
}