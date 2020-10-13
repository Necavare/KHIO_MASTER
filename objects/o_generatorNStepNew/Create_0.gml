//mound debugging
moundNum = 0;


currentCampId = 0;
global.compoundX = -1;
global.compoundY = -1;
global.keyx = -1;
global.keyy = -1;

enemyCampX_list = ds_list_create();
enemyCampY_list = ds_list_create();
enemyCampR_list = ds_list_create();

//it is currently generating the envornment
global.generatingEnvironment=true;
//global.extraInst = ds_list_create();
//global.canMove = false;

//set offset so that i can create intiial place correct (note from the future of this, ????????)
global.xoffset = 500;

//stack of object id's to iterate over for placing in minimap
loadingLayerId = layer_get_id("LoadingLayer");
objectStackPopped = pointer_null;
objectStack = ds_stack_create(); // <- contaiDns par_3d objects

//starting at the top left
x=500;
y=0;

//var groundV = layer_get_id("Ground");
while(y<room_height){
	
	//instance_create_layer(x,y, groundV, o_snow_texture);
	var snow = instance_create_depth(x,y, 1, o_snow_texture);
	ds_stack_push(objectStack, snow);
	x+=250; // move on to next square
	//if x reaches its max
	if(x>=(room_width+500)){
		y+=250;
		x=0;
	}
}

var bS = 16; //block size

lakeDoOnce = true;
bigLakePointer = -1;

//list to keep track of bottom floor objects
floorQueue = ds_queue_create();
floorHouseQueue = ds_queue_create();

floorActiveQueue = ds_queue_create();
floorActiveHouseQueue = ds_queue_create();

activationQueue = ds_queue_create();
setupActivation = true;

#region create biome layout

#region initialize biome array

//starting at the top left
x = 0;
y = 0;

//set biome array variables
global.biomeArray[0,0] = 0;
while(y <= room_height){
	arrayY = y/bS;
	arrayX = x/bS;
	global.biomeArray[arrayX, arrayY] = 0;
	x+=16;
	if(x > room_width){
		x = 0;
		y+=16;
	}
}
#endregion

//starting at top left AGAIN
x = 0;
y = 0;
//0 = none, 1 = spruce, 2 = birch, 3 = both

biomeCreationOdds = 0;
var checkNum = random_range(0,120);

var previousBiome = 0;
var currentBiome = 0;

while(y <= room_height){
	arrayY = y/bS;
	arrayX = x/bS;
	
	if(biomeCreationOdds>=checkNum){
		//show_debug_message("CURRENT BIOME : " + string(currentBiome));
		
		var biomeType = scr_checkRBiome(global.biomeArray, arrayX, arrayY, 3, currentBiome);
		
		if(biomeType = 0){//if 1 or 2 is not nearby then maybe choose one
		    //show_debug_message("found 0");
			if(previousBiome == 1){
				biomeType = choose(2,2,2,1);
			}
			if(previousBiome == 2){
				biomeType = choose(1,1,1,2);	
			}
			else
				biomeType = choose(1,2);
		}
		if(biomeType == 1){
			//show_debug_message("found 1");
			global.biomeArray[arrayX,arrayY] = 1;
		}
		else if(biomeType == 2){ 
			//show_debug_message("found 2");
			global.biomeArray[arrayX,arrayY] = 2;
		}
		/*
		else if(biomeType == 0){
			global.biomeArray[arrayX, arrayY] = 0;	
		}*/
		//show_debug_message("-----------------------");
		//show_debug_message(" { ...");
		scr_generateBiome2(global.biomeArray, arrayX, arrayY, biomeType, 150);
		//show_debug_message(" ... }");
		//biomeArray = scr_generateBiome(biomeArray, arrayX, arrayY, biomeType);
		checkNum = random_range(0,120);
		biomeCreationOdds = 0;
		previousBiome = currentBiome;
		
		currentBiome = biomeType;
		//show_debug_message("CURRENT BIOME : " + string(currentBiome));
	}
	else{
		global.biomeArray[arrayX,arrayY] = 0;
	}
	
	
	biomeCreationOdds += 0.8;
	
	x+=16;

	if(x >room_width){
		x = 0;
		y+=16;
	}

}
#endregion

//reset x and y AGAIN AGAIN
x = 500;
y = 0;



#region generate towns and other high priority areas (key)

				var globalCenX = (room_width/2) + 500;
				var globalCenY = room_height/2;
				
				
				var townGenAng = irandom(360);
				var townGenLen = irandom_range(1500, (room_width/2)-800);
				var townX = globalCenX+lengthdir_x(townGenLen, townGenAng);
				var townY = globalCenY+lengthdir_y(townGenLen, townGenAng);

				var compoundGenAng = irandom_range(60,300);
				var compoundGenLen = irandom_range(1500, (room_width/2)-800);
				var compoundX = globalCenX+lengthdir_x(compoundGenLen, townGenAng+compoundGenAng);
				var compoundY = globalCenY+lengthdir_y(compoundGenLen, townGenAng+compoundGenAng);
				global.compoundX = compoundX+lengthdir_x(320, townGenAng+compoundGenAng+90);
				global.compoundY = compoundY+lengthdir_y(320, townGenAng+compoundGenAng+90);
				scr_createCompound(compoundX, compoundY, townGenAng+compoundGenAng);
				
				//find where the key spawn will be
				var keyAng = townGenAng+compoundGenAng+180+(choose(-60,60));
				var keyLen = irandom_range(1000, 2300);
				global.keyx = globalCenX+lengthdir_x(keyLen, keyAng);
				global.keyy = globalCenY+lengthdir_y(keyLen, keyAng);
				var keyLoc = instance_create_depth(global.keyx, global.keyy, 1, o_birch_stump);
				
				//spawn nearby landmark
				var ranDis = irandom_range(60,140);
				var ranAng = irandom(360);
				var turret = instance_create_depth(global.keyx+lengthdir_x(ranDis, ranAng), global.keyy+lengthdir_y(ranDis, ranAng), 1, o_aaturret);
				keyLoc.isKey = true;
				
				ds_stack_push(objectStack, turret);
				ds_stack_push(objectStack, keyLoc);
				
				
				
	#region spawn town
				//spawn road
				var roadAngle = irandom(360);
				var poleOffset = irandom_range(-30,0);
				//spawn poles
				var poleX = townX+lengthdir_x(60, roadAngle)+lengthdir_x(100+poleOffset,roadAngle+90);
				var poleY = townY+lengthdir_y(60, roadAngle)+lengthdir_y(100+poleOffset,roadAngle+90);
				var roadX = townX;
				var roadY = townY;
				
				//car control
				var carNum = 0;
				var maxCar = 5;
				var carLast = true;
					
				//block number
				var curTownBlock = 0;
				
				//number of the block with anvil
				var anvilBlock = choose(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
				
				//number of the block with bloomery
				var bloomeryBlock = choose(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
					
				repeat(4){
					
	
				
					var roadBlock = instance_create_depth(roadX,roadY,1,o_road_block);
					roadBlock.image_angle = roadAngle;
					scr_clipping_primary(roadBlock, false);
					ds_queue_enqueue(floorQueue, roadBlock);
					ds_stack_push(objectStack, roadBlock);
				
					repeat(choose(2,3,4)){
						var roadPole = instance_create_depth(poleX,poleY,1,choose(o_pole_broken,o_pole_wired));
						roadPole.image_angle = roadAngle;
						scr_clipping_primary(roadPole, false);
						ds_queue_enqueue(floorHouseQueue, roadPole);
						ds_stack_push(objectStack, roadPole);
					
						poleX += lengthdir_x(62, roadAngle-90);
						poleY += lengthdir_y(62, roadAngle-90);
					}
					
					//spawn the road and cars and poles
					var carSpawn = choose(true,true,false);
					if ((carSpawn || !carLast) && (carNum < maxCar)){
						var carAngle = irandom(360);
						var carLen = irandom_range(5,70);
						var carInst = instance_create_depth(roadX+lengthdir_x(carLen, carAngle),roadY+lengthdir_y(carLen, carAngle),1,o_car);
						carInst.image_angle = irandom(360);
						scr_clipping_primary(carInst, false);
						ds_queue_enqueue(floorHouseQueue, carInst);
						ds_stack_push(objectStack, carInst);
						carLast = true;
						carNum++;
					}
					else
						carLast = false;
	
				
					//spawn the peices of broken stuff
						var townAngle = roadAngle-90;
						
						var spawnAnvil = false
						var spawnBloomery = false;
						
						spawnAnvil = false;
						spawnBloomery = false;
						if(curTownBlock == anvilBlock)
							spawnAnvil = true;
						if(curTownBlock == bloomeryBlock)
							spawnBloomery = true;
						scr_createTownBlock(roadX, roadY, roadAngle, townAngle, 90, spawnAnvil, spawnBloomery);
						curTownBlock++;
						
						spawnAnvil = false;
						spawnBloomery = false;
						if(curTownBlock == anvilBlock)
							spawnAnvil = true;
						if(curTownBlock == bloomeryBlock)
							spawnBloomery = true;
						scr_createTownBlock(roadX+lengthdir_x(160, townAngle+90), roadY+lengthdir_y(160, townAngle+90), roadAngle, townAngle, 90, spawnAnvil, spawnBloomery);
						curTownBlock++;
						
						var pitfallAng = townAngle +90 + irandom_range(-45, 45);
						var pitfallLen = irandom_range(100,220);
						var pitfall = instance_create_depth(roadX+lengthdir_x(160, townAngle+90)+lengthdir_x(pitfallLen, pitfallAng), roadY+lengthdir_y(160, townAngle+90)+lengthdir_y(pitfallLen, pitfallAng), 1, o_pitfall);
						//ds_queue_enqueue(floorQueue, pitfall);
						ds_stack_push(objectStack, pitfall);
						
						spawnAnvil = false;
						spawnBloomery = false;
						if(curTownBlock == anvilBlock)
							spawnAnvil = true;
						if(curTownBlock == bloomeryBlock)
							spawnBloomery = true;
						scr_createTownBlock(roadX, roadY, roadAngle, townAngle, -90, spawnAnvil, spawnBloomery);
						curTownBlock++;
						
						spawnAnvil = false;
						spawnBloomery = false;
						if(curTownBlock == anvilBlock)
							spawnAnvil = true;
						if(curTownBlock == bloomeryBlock)
							spawnBloomery = true;
						scr_createTownBlock(roadX+lengthdir_x(160, townAngle-90), roadY+lengthdir_y(160, townAngle-90), roadAngle, townAngle, -90, spawnAnvil, spawnBloomery);
						curTownBlock++;
						
						var pitfallAng2 = townAngle -90 + irandom_range(-45, 45);
						var pitfallLen2 = irandom_range(100,220);
						var pitfall2 = instance_create_depth(roadX+lengthdir_x(160, townAngle-90)+lengthdir_x(pitfallLen2, pitfallAng2), roadY+lengthdir_y(160, townAngle-90)+lengthdir_y(pitfallLen2, pitfallAng2), 1, o_pitfall);
						//ds_queue_enqueue(floorQueue, pitfall2);
						ds_stack_push(objectStack, pitfall2);
				
					roadX+=lengthdir_x(200, roadAngle-90);
					roadY+=lengthdir_y(200, roadAngle-90);
				}
				
				
				//also generate a water tower close to the player i guess
				var waterDis = irandom_range(800,900);
				var waterAng = irandom(360);

				var waterTowerX = (townX)+lengthdir_x(waterDis, waterAng);
				var waterTowerY = (townY)+lengthdir_y(waterDis, waterAng);
				var waterTowerC = instance_create_depth(waterTowerX, waterTowerY, 1, o_watertower);
				waterTowerC.image_angle = irandom(360);

				scr_clipping_priority(waterTowerC, false);
				ds_stack_push(objectStack, waterTowerC);
				ds_queue_enqueue(activationQueue, waterTowerC);

				//generate clues
				//find direction from water tower
				var waterDir = "__";
				var rockAng = 0;
				var keyDir = point_direction(waterTowerX, waterTowerY, global.keyx, global.keyy);
				if(keyDir< 180 && keyDir > 0){
					waterDir = "North";
					rockAng = 90;
				}else{
					waterDir = "South";
					rockAng = -90;
				}
				global.clue1 = "I was traveling "+string(waterDir)+" of the water tower...";
				
				//generate a large rock
				var ydis = abs(waterTowerY-global.keyy);
				var largeRockX = x+lengthdir_x(ydis, rockAng);
				var largeRockY = y+lengthdir_y(ydis, rockAng);
				var largeRock = instance_create_depth(largeRockX, largeRockY, 1, o_bigrock);
				scr_clipping_primary(largeRock, false);
				ds_queue_enqueue(activationQueue, largeRock);
				ds_stack_push(objectStack, largeRock);
				
				//find direction from rock
				var rockDir = "__";
				var keyDir2 = point_direction(largeRockX, largeRockY, global.keyx, global.keyy);
				if(keyDir2 >90 && keyDir2 < 270){
					rockDir = "West";
				}else{
					rockDir = "East";	
				}
				global.clue2 = "I came across a large rock and moved "+string(rockDir)+" ...";
				
				global.clue3 = "I came across a relic of the old war and searched the area ...";
				global.clue4 = "hidden inside a hollowed out tree stump i've hidden it.";

				//spawn waterpump
				var waterPumpLen2 = irandom_range(45,60);
				var waterPumpAng2 = 180+(choose(5,10,15,-5,-10,-15));
				var waterPumpX2 = waterTowerX+ lengthdir_x(waterPumpLen2, waterPumpAng2);
				var waterPumpY2 = waterTowerY+ lengthdir_y(waterPumpLen2, waterPumpAng2);
				var objWaterPump2 = instance_create_depth(waterPumpX2, waterPumpY2, 1, o_waterpump);
				objWaterPump2.image_angle = irandom(360);
				ds_stack_push(objectStack, objWaterPump2);
				scr_clipping_primary(objWaterPump2, false);
				ds_queue_enqueue(activationQueue, objWaterPump2);

				
				
		#endregion		
			

#endregion

#region generate lakes
while(y <= room_height){

	var biomeArrayC = global.biomeArray[(x-500)/16, y/16];
		if(biomeArrayC==0){
			birch = false;
			spruce = false;
		}
		if(biomeArrayC==1){
			birch = false;
			spruce = true;
		}
		if(biomeArrayC==2){
			birch = true;
			spruce = false;
		}
		if(biomeArrayC==3){
			birch = true;
			spruce = true;
		}
		
		//***********************************************
		// foundation elements(only grass and lakes atm)
		//***********************************************
		var groundOdds = irandom(99);
		
		//creating lakes (1% chance to MAYBE make one) 
		if(groundOdds < 1){
		//it must become even rarer so it has another chance even if the 1% works
		var lakeOdds = irandom(99);
		if(lakeOdds < 2){ //0.02% (2% of 1%) of actually making one
		//if(!scr_checkR(bS, 5, o_lake)){//if lake nearby dont make lake
			var lakefinalOdds = irandom(99);
			if(lakeDoOnce && lakefinalOdds < 5){
				var lakeInst = instance_create_depth(x,y,8000, o_lake);
				bigLakePointer = lakeInst;
				scr_clipping_primary(lakeInst, false);
				ds_queue_enqueue(global.bigLakeIDQ, lakeInst);
				//global.bigLakePointer = lakeInst;
				ds_queue_enqueue(activationQueue, lakeInst);
				ds_stack_push(objectStack, lakeInst);
				show_debug_message("create big ass lake");
				lakeDoOnce = false;
			}
			else if(lakefinalOdds > 60){
				if(!collision_circle(x,y,5*16, o_lake, true, true)){
					/*var lakeType;
					if(spruce){
						lakeType = o_pond;
						//lakeType.sprite_index = s_pond2;
					}else if(birch)
						lakeType = o_pond;*/
					if((spruce&&birch)||(!spruce&&!birch)){
							var lakeType = choose(o_pond, o_pond2);
							var lakeO1 = instance_create_depth(x,y,8000, lakeType);
							//lakeO1.sprite_index = choose(s_pond2, s_pond);
							ds_stack_push(objectStack, lakeO1);
							ds_queue_enqueue(floorQueue, lakeO1);
							scr_clipping_primary(lakeO1, false);
					}
					else if(birch || spruce){//make a pond instead
						var lakeType2;
						if(birch)
							lakeType2 = o_pond;
						else if(spruce)
							lakeType2 = o_pond2;
							
						var lakeO2 = instance_create_depth(x,y,8000, lakeType2);
						/*
						if(birch)
							lakeO2.sprite_index = s_pond;
						else if(spruce)
							lakeO2.sprite_index = s_pond2;
						*/
						ds_stack_push(objectStack, lakeO2);
						ds_queue_enqueue(floorQueue, lakeO2);
						scr_clipping_primary(lakeO2, false);
					}
				}
			}
		}
		}
		
	x+=16;
	if(x >(room_width+500)){
		x = 500;
		y+=16;
	}

}



#endregion

//reset x and y AGAIN AGAIN
x = 500;
y = 0;


#region generate rocks, camps misc
while(y <= room_height){

	var biomeArrayC = global.biomeArray[(x-500)/16, y/16];
	if(biomeArrayC==0){
		birch = false;
		spruce = false;
	}
	else if(biomeArrayC==1){
		birch = false;
		spruce = true;
	}
	else if(biomeArrayC==2){
		birch = true;
		spruce = false;
	}
	else if(biomeArrayC==3){
		birch = true;
		spruce = true;
	}
		
	//spawn big rocks
	var rockOdds = irandom(999);
	if(rockOdds<15 && (birch == spruce)){
		
		//make sure its not inside of a camp
		var dontGenerate = false;
		for(var i = 0; i < ds_list_size(enemyCampX_list); i++){
			if(point_distance(x,y,ds_list_find_value(enemyCampX_list, i), ds_list_find_value(enemyCampY_list, i)) < ds_list_find_value(enemyCampR_list, i))
				dontGenerate = true;
		}
		
		if(!dontGenerate){
			var ranXR = irandom(bS);
			var ranYR= irandom(bS);
			var bigRock = instance_create_depth(x+ranXR, y+ranYR, 1, o_bigrock);
			ds_stack_push(objectStack, bigRock);
			scr_clipping_primary(bigRock, false);
			ds_queue_enqueue(activationQueue, bigRock);
		}
	}
	
	else if(rockOdds < 17){
		//bushes
		
		//further odds
		var bushOdds = irandom(99);
		if(bushOdds < 5){
			//make sure its not inside of a camp
			var dontGenerate = false;
			for(var i = 0; i < ds_list_size(enemyCampX_list); i++){
				if(point_distance(x,y,ds_list_find_value(enemyCampX_list, i), ds_list_find_value(enemyCampY_list, i)) < ds_list_find_value(enemyCampR_list, i))
					dontGenerate = true;
			}
		
			if(!dontGenerate){
				var ranXR = irandom(bS);
				var ranYR= irandom(bS);
				var bigBush = instance_create_depth(x+ranXR, y+ranYR, 1, o_big_bush);
				ds_stack_push(objectStack, bigBush);
				scr_clipping_special(bigBush, false);
				ds_queue_enqueue(activationQueue, bigBush);
			}
		}
	}
	
	else if(rockOdds < 19){
		//mounds (treasure)
		
		//further odds
		//var moundOdds = irandom(99);
		//if(moundOdds < 50){
			//make sure its not inside of a camp
			var dontGenerate = false;
			for(var i = 0; i < ds_list_size(enemyCampX_list); i++){
				if(point_distance(x,y,ds_list_find_value(enemyCampX_list, i), ds_list_find_value(enemyCampY_list, i)) < ds_list_find_value(enemyCampR_list, i))
					dontGenerate = true;
			}
			
			//if its not
			if(!dontGenerate){
				if(point_distance(x,y,compoundX, compoundY) > 900){	
				var ranXR = irandom(bS);
				var ranYR = irandom(bS);
				var moundObj = instance_create_depth(x+ranXR, y+ranYR, 1, o_digmound);
				ds_stack_push(objectStack, moundObj);
				scr_clipping_special(moundObj, false);
				ds_queue_enqueue(activationQueue, moundObj);
				//VALUES ARE BEING ADDED AT THE ACTIVATION PHASE (in case stuff gets removed)
				}
			}	
		//}
	}
		
		
	
	
#region enemy camps and houses/sheds


			//the sum of the exterior angles of a polygon, equal 360.
			// if all camps are considered polygons made up of walls
			// the added sum of their angles will be 360, so these angles can be
			// precalculated and then manufactured
			var campChange = irandom(9999);//0-9aws999
			var disFromMapCen = point_distance(x,y, room_width/2+500, room_height/2);
			var disFromTownCen = point_distance(x,y, townX, townY);
			var disFromCompoundCen = point_distance(x,y, compoundX, compoundY);
			
			/*
			var mapWidth = 6000;
				var mapHeight = 6000;
				var xscale = mapWidth/room_width;
				var yscale = mapHeight/room_height;
				var xposp = (cenX-500)*xscale;
				var yposp = (cenY)*yscale;
			
				ds_list_add(global.campXList, xposp);
				ds_list_add(global.campYList, yposp);
				ds_list_add(global.campIdList, currentCampId);
				ds_list_add(global.campCol, 0);
			*/
			
			
			//find the distance to closest camp
			var closestCampDis = 3000;
			var mapWidth = 6000;
			var mapHeight = 6000;
			var xscale = mapWidth/room_width;
			var yscale = mapHeight/room_height;
			for(var i = 0; i < ds_list_size(global.campIdList); i++){
				var otherX = (ds_list_find_value(global.campXList, i)/xscale)+500;
				var otherY = (ds_list_find_value(global.campYList, i)/yscale);
				var disToCurCamp = point_distance(x,y, otherX, otherY);
				if(disToCurCamp < closestCampDis){
					closestCampDis = disToCurCamp;	
				}
			}
			//check if house is close
			var houseNear = false;
			if(collision_circle(x,y, 600, o_house, false, true)){
				houseNear = true;
			}
			if((campChange <2) && (disFromMapCen >= 1000) && disFromTownCen >= 800 && disFromCompoundCen >= (800+(128*3)) && closestCampDis > 850 && !houseNear){ 
				
				//camp type
				//camp type relates to number of enemies
				// 2 is small, 3 is medium, 4 is larger
				var campType = choose(2,3,4);
				
				var angleTotal = 360;
				var xwall = x;
				var ywall = y;
				var generatorWallAngleOffset = 0;
				var wallNum = 0;
				var willBuildTower = true;
				
				generatorWallAngle = 0;
				
				//make all possible angles valid for polygons
				//var randomWallAngle = choose(5,6,8,9,10,12,15,18,20,24,30);
				//var randomWallAngle = choose(15,18,20,24,30);
				
			
				var randomWallAngle = choose(5,6,8,9,10);
				
				if(campType == 2)
					randomWallAngle = choose(10,12);
				if(campType == 3)
					randomWallAngle = choose(8,9,10,12);
				
				//using linear algebra
				
				var wallMax = ceil(360/randomWallAngle); //how many walls their will be
				//show_debug_message("wall number: "+string(wallMax));
				//show_debug_message("angle: "+string(randomWallAngle));
				
				var cpxTop = 0;
				var cpxBot = 0;
				var cpyTop = 0;
				var cpyBot = 0;
				
				for(var cpV = 0; cpV < wallMax; cpV++){
					generatorWallAngle = randomWallAngle;
					angleTotal-=generatorWallAngle;
					generatorWallAngle += generatorWallAngleOffset;
					
					xwall = xwall+lengthdir_x(29, generatorWallAngle);
					ywall = ywall+lengthdir_y(29, generatorWallAngle);
					var xi_0 = xwall;
					var yi_0 = ywall;
					//show_debug_message("x"+string(cpV)+"_0: "+string(xi_0));
					//show_debug_message("y"+string(cpV)+"_0: "+string(yi_0));
					
					//offset for next wall
					generatorWallAngleOffset += randomWallAngle;
					
					
					var tempGenWallangle = randomWallAngle+generatorWallAngleOffset;
					
					var xi_1 = xwall+lengthdir_x(29, tempGenWallangle); 
					var yi_1 = ywall+lengthdir_y(29, tempGenWallangle);
					//show_debug_message("x"+string(cpV)+"_1: "+string(xi_1));
					//show_debug_message("y"+string(cpV)+"_1: "+string(yi_1));
					
					var weight = ((xi_0*yi_1)-(xi_1*yi_0));
					//show_debug_message("weight["+string(cpV)+"] : "+string(weight));
					
					cpxTop+=(xi_0+xi_1)*weight;
					cpxBot+=weight;
					cpyTop+=(yi_0+yi_1)*weight;
					cpyBot+=weight;
				}
				
				xwall= x;
				ywall = y;
				angleTotal = 360;
				generatorWallAngleOffset = 0;
				generatorWallAngle = 0;
				
				
				var cenX = (cpxTop/cpxBot)/3; 
				var cenY = (cpyTop/cpyBot)/3; 
				
				//create the marker
				//campNameList 
				//campXList 
				//campYList 
				//campIdList 
				//campCol 
				
				/*
				ds_list_add(o_hud.campNameList, "Enemy Camp");
				ds_list_add(o_hud.campXList, x-500);
				ds_list_add(o_hud.campYList, y);
				ds_list_add(o_hud.campIdList, currentCampId);
				ds_list_add(o_hud.campCol, 1); //0 is invisible, 1 is visible, 2 is conquered
				*/
				
				ds_list_add(global.campNameList, "Enemy Camp");
				
				//these variables are normally set in the hud but are set here as well since hud doesnt exist yet
				var mapWidth = 6000;
				var mapHeight = 6000;
				var xscale = mapWidth/room_width;
				var yscale = mapHeight/room_height;
				var xposp = (cenX-500)*xscale;
				var yposp = (cenY)*yscale;
			
				//add it to temp lists
				ds_list_add(enemyCampX_list, cenX);
				ds_list_add(enemyCampY_list, cenY);
				ds_list_add(enemyCampR_list, point_distance(x,y,cenX,cenY));
				
				ds_list_add(global.campXList, xposp);
				ds_list_add(global.campYList, yposp);
				ds_list_add(global.campIdList, currentCampId);
				ds_list_add(global.campCol, 0);
				
				currentCampId++;
				
				//show_debug_message("cenX: "+string(cenX));
				//show_debug_message("cenY: "+string(cenY));
					
				//possible that the size of the camp can be deduced with math using the angle and size
				// of walls to calculate the area 
			
				//create towers in the camp
				var towerNum = 0;
			
				//create tent
				var tentMax = campType;
				var tentNum = 0;
			
				//create anvil
				var anvilMax = 0;
				if(campType > 2)
					anvilMax = 1;
				else
					anvilMax = 0;
				var anvilNum = 0;
			
				// create large crate
				// created alongside other things, not sure what yet 
			
				//create enemy npc's inside and outside the base
				var enemyMax = campType;
				var enemyNum = 0;
			
				//loot stuff
				var lootMax = 1;
				/*
				if(randomWallAngle == 5 || 6)
					lootMax = 4;
				if(randomWallAngle == 8 || 9)
					lootMax = 3;
				*/	
				if(campType > 2)
					lootMax = 2;
				var lootNum = 0;
				
				//create enemy scouts
				
				var scoutOdds = choose(0,1,1,2,3);
				
				if(campType == 2 || campType == 3)
					scoutOdds = 1;
					
				repeat(scoutOdds){
					//show_debug_message("scout spawning")
					var scoutAngle = irandom(360);
					var scoutDis = irandom_range(700,900);
					
					//make sure its not too close to player starting zone:
					if(point_distance(cenX+lengthdir_x(scoutDis, scoutAngle),cenY+lengthdir_y(scoutDis, scoutAngle), room_width/2+500, room_height/2) > 300){
					
						var continueVar = true;
						//also make sure its not too close to OTHER camps
						for(var  i = 0; i < ds_list_size(enemyCampX_list); i++){
							if(point_distance(x,y,ds_list_find_value(enemyCampX_list, i), ds_list_find_value(enemyCampY_list, i)) < ds_list_find_value(enemyCampR_list, i))
								continueVar = false;
						}
					
						if(continueVar){
							//create sword enemies
							//first sword enemy
							var enemySword1X = cenX+lengthdir_x(scoutDis, scoutAngle)+lengthdir_x(10, scoutAngle+30);
							var enemySword1Y = cenY+lengthdir_y(scoutDis, scoutAngle)+lengthdir_y(10, scoutAngle+30);
							var objSword1 = instance_create_depth(enemySword1X, enemySword1Y, 1, o_enemySword);
							objSword1.image_angle = irandom(360);
							ds_stack_push(objectStack, objSword1);
							scr_clipping_primary(objSword1, false);
					
							//create second sword enemy
							var enemySword2X = cenX+lengthdir_x(scoutDis, scoutAngle)+lengthdir_x(10, scoutAngle-30);
							var enemySword2Y = cenY+lengthdir_y(scoutDis, scoutAngle)+lengthdir_y(10, scoutAngle-30);
							var objSword2 = instance_create_depth(enemySword2X, enemySword2Y, 1, o_enemySword);
							ds_stack_push(objectStack, objSword2);
							scr_clipping_primary(objSword2, false);
					
							//create bow enemy
							var enemyBowX = cenX+lengthdir_x(scoutDis, scoutAngle);
							var enemyBowY = cenY+lengthdir_y(scoutDis, scoutAngle);
							var objBow = instance_create_depth(enemyBowX, enemyBowY, 1, o_enemyBow);
							ds_stack_push(objectStack, objBow);
							scr_clipping_primary(objBow, false);
					
						}
					}
				}
				
				//spawn the firepit
				//spawn fire pits maybe
							
					var objF = instance_create_depth(cenX, cenY, 1, o_firepit);//spawn firepit
					objF.image_angle = irandom(360);	
					objF.isCamp = true;
						
					ds_stack_push(objectStack, objF);
					scr_clipping_primary(objF, false);
					
				//spawn tents
				var disToCen2 = point_distance(xwall, ywall, cenX, cenY); 
				//var tentLen = choose(15,20,25);
				
				var miscAngle = 0;
				repeat(campType){
					if(disToCen2 > 30){
						//var tentLen = irandom_range(20,disToCen2-20);
						var tentLen = 120;
						
						var tentAng = miscAngle;
						var tentX = cenX+lengthdir_x(tentLen, tentAng);
						var tentY = cenY+lengthdir_y(tentLen, tentAng);
						var objTent = instance_create_depth(tentX, tentY, 1, o_tent); //spawn tent
						objTent.image_angle = tentAng-90;
						//objTent.image_angle = irandom(360);
						
						
						ds_stack_push(objectStack, objTent);
						scr_clipping_primary(objTent, false);
						tentNum++;
						miscAngle += 35;
					}
				}
				
				//anvil odds
				repeat(anvilMax){
					//var anvilLen = irandom_range(15,disToCen2-5);
					//var anvilLen = irandom_range(20, 40);
					var anvilLen = 70;
					
					var anvilAng = miscAngle;
					var anvilX = cenX+lengthdir_x(anvilLen, anvilAng);
					var anvilY = cenY+lengthdir_y(anvilLen, anvilAng);
					var objAnvil = instance_create_depth(anvilX, anvilY, 1, o_anvil); //spawn anvil
					objAnvil.image_angle = anvilAng-90;
						
					ds_stack_push(objectStack, objAnvil);
					scr_clipping_primary(objAnvil, false);
					anvilNum++;	
					miscAngle += 25;
				}
				
				//loot
				repeat(lootMax){
					//var lootLen = irandom_range(15, disToCen2-9);
					//var lootLen = irandom_range(20, 40);
					var lootLen = 70;
					
					var lootAng = miscAngle;
					var lootX = cenX+lengthdir_x(lootLen, lootAng);
					var lootY = cenY+lengthdir_y(lootLen, lootAng);
					var objLoot = instance_create_depth(lootX, lootY, 1, o_small_crate);//spawn small crate
					objLoot.image_angle = miscAngle-90;
					objLoot.isCamp = true;
						
					ds_stack_push(objectStack, objLoot);
					scr_clipping_primary(objLoot, false);
					lootNum++;
					miscAngle += 25;
				}
				
				repeat (enemyMax){
					var enemyLen = irandom_range(8,disToCen2-10);
					
					//var enemyLen = irandom_range(0, disToCen-5);
					var enemyAng = miscAngle;
					var enemyX = cenX+lengthdir_x(enemyLen, enemyAng);
					var enemyY = cenY+lengthdir_y(enemyLen, enemyAng);
					var enemyTypeChance = irandom(99);
					if(enemyTypeChance < 30){
						//bow enemy 30%
						var objEnemy = instance_create_depth(enemyX, enemyY, 1, o_enemyBow); 
					}else if(enemyTypeChance < 100){
						//sword enemy 70%
						var objEnemy = instance_create_depth(enemyX, enemyY, 1, o_enemySword);
					}
					objEnemy.image_angle = irandom(360);
						
					ds_stack_push(objectStack, objEnemy);
					scr_clipping_primary(objEnemy, false);
					//scr_clipping_secondary(objEnemy, false);
					enemyNum++;
				}
				
				
				while(angleTotal>0){
					//other creation inside the camp
					var towerOdds = irandom(99);
					//var fireOdds = irandom(99);
					//var tentOdds = irandom(99);
					var anvilOdds = irandom(99);
					var enemyOdds = irandom(99);
					var lootOdds = irandom(99);//odds to spawn some dank loot
					
					if(towerNum = 0)
						towerOdds = 0;
				
				
					var doorB = false; //door boolean value to keep track of wether were making a door
					if(wallNum = 5){
						willBuildTower = choose(true, false);
						doorB = true;//set door boolean value to true
						wallNum = -5;//set offset so it needs even more before next door
						towerB = false;
					}
					
					
					var towerB = false;
					
					if(disToCen2 > 80){
					if(wallNum > 0 && wallNum < 4){
						if(willBuildTower){
							if(wallNum == 3)
								towerB = true;
							else
								towerB = choose(false, true);	
						}	
					}
					}
					
					
					var spikesB = false;
					//dont spawn in front of doors
					if(choose(true, false) && !doorB){
						spikesB = true;
					}
					//var randomWallAngle = 0;
					//find the angle of the wall based on the above maths
					
					//if(angleTotal<30)
					//	randomWallAngle = angleTotal;
					//else
					//	randomWallAngle = irandom_range(5,30);
					
					
					generatorWallAngle = randomWallAngle;
					angleTotal-=generatorWallAngle;
					generatorWallAngle += generatorWallAngleOffset;
					
					
					if(!doorB){
						xwall+=lengthdir_x(16, generatorWallAngle);
						ywall+=lengthdir_y(16, generatorWallAngle);
						var objWall=instance_create_depth(xwall,ywall,1, o_wall_wood); //spawn the wall
						objWall.isCamp = true;
						objWall.campId = currentCampId-1;
						objWall.image_angle = generatorWallAngle;
						objWall.logs = 5;
						objWall.logType[0] = irandom_range(0,1);
						objWall.logType[1] = irandom_range(0,1);
						objWall.logType[2] = irandom_range(0,1);
						objWall.logType[3] = irandom_range(0,1);
						objWall.logType[4] = irandom_range(0,1);
						objWall.upgraded = choose(false, true);
						if(objWall.upgraded)
							objWall.health_ = 15 + (objWall.logs * 3);
						else
							objWall.health_ = 5 + (objWall.logs * 3);
						
						ds_queue_enqueue(activationQueue, objWall);
						ds_stack_push(objectStack, objWall);
						scr_clipping_primary(objWall, false);
					}
					else{	
						//xwall+=lengthdir_x(4, generatorWallAngle);
						//ywall+=lengthdir_y(4, generatorWallAngle);
						//var objDoor=instance_create_depth(xwall,ywall,1, o_door_wood); //spawn the wall
						xwall+=lengthdir_x(16, generatorWallAngle);
						ywall+=lengthdir_y(16, generatorWallAngle);
						var objDoor = instance_create_depth(xwall, ywall, 1, o_door_sides);
						
						objDoor.isCamp = true;
						objDoor.isBuilt = true;
						objDoor.image_angle = generatorWallAngle;
						objDoor.startingAngle = generatorWallAngle;
						
						ds_stack_push(objectStack, objDoor);
						scr_clipping_primary(objDoor, false);
					}
					
					//if its building towers build them
					if(towerB){
						var towerDis = random_range(35,55);
						var towerX = xwall+lengthdir_x(towerDis, generatorWallAngleOffset+90);
						var towerY = ywall+lengthdir_y(towerDis, generatorWallAngleOffset+90);
						var objTower=instance_create_depth(towerX,towerY,1, o_tower); //spawn the wall

						ds_stack_push(objectStack, objTower.instBotLeftLog);
						ds_stack_push(objectStack, objTower.instBotRightLog);
						ds_stack_push(objectStack, objTower.instTopLeftLog);
						ds_stack_push(objectStack, objTower.instTopRightLog);
						ds_stack_push(objectStack, objTower.instLadder);
						ds_stack_push(objectStack, objTower.instRoof);
						ds_stack_push(objectStack, objTower);
						scr_clipping_primary(objTower, false);
						
						//chance to build a sniper on top
						if(irandom(99) > 50){
							var sniperInst = instance_create_depth(towerX, towerY, 1, o_enemyBow);
							ds_stack_push(objectStack, sniperInst);
							sniperInst.towerPointer = objTower;
							enemyNum++;
						}
						
						willBuildTower = false;
					}
					if(spikesB){
						var spikesDis = 12; // 5 is half of spikes 4.5 is half of wall so just round up
						
						var spikesX = xwall+lengthdir_x(spikesDis, generatorWallAngleOffset-90);
						var spikesY = ywall+lengthdir_y(spikesDis, generatorWallAngleOffset-90);
						var objSpikes = instance_create_depth(spikesX, spikesY, 1, choose(o_spikes_metal, o_spikes_wood));
						objSpikes.image_angle = generatorWallAngle;
						
						ds_stack_push(objectStack, objSpikes);
						scr_clipping_primary(objSpikes, false);
						
					}

					var disToCen = point_distance(xwall, ywall, cenX, cenY);
				
					/*
					//anvil odds
					if((anvilOdds < 5)&&(anvilNum < anvilMax) && (disToCen > 5)){
						var anvilLen = irandom_range(0,disToCen-5);
						
						var anvilAng = irandom(360);
						var anvilX = cenX+lengthdir_x(anvilLen, anvilAng);
						var anvilY = cenY+lengthdir_y(anvilLen, anvilAng);
						var objAnvil = instance_create_depth(anvilX, anvilY, 1, o_anvil); //spawn anvil
						objAnvil.image_angle = irandom(360);
						
						ds_stack_push(objectStack, objAnvil);
						scr_clipping_primary(objAnvil, false);
						anvilNum++;
					}
					if((lootOdds < 40) && (lootNum < lootMax) && (disToCen > 9)){
						var lootLen = irandom_range(10, disToCen-9);
						
						var lootAng = irandom(360);
						var lootX = cenX+lengthdir_x(lootLen, lootAng);
						var lootY = cenY+lengthdir_y(lootLen, lootAng);
						var objLoot = instance_create_depth(lootX, lootY, 1, o_small_crate);//spawn small crate
						objLoot.image_angle = irandom(360);
						objLoot.isCamp = true;
						
						ds_stack_push(objectStack, objLoot);
						scr_clipping_primary(objLoot, false);
						lootNum++;
						
					}
				`	*/
					
					/*
					//npc odds
					if((enemyOdds < 80)&&(enemyNum < enemyMax) && (disToCen > 6)){
						var enemyLen = irandom_range(0,disToCen-6);
						//var enemyLen = irandom_range(0, disToCen-5);
						var enemyAng = irandom(360);
						var enemyX = cenX+lengthdir_x(enemyLen, enemyAng);
						var enemyY = cenY+lengthdir_y(enemyLen, enemyAng);
						var enemyTypeChance = irandom(99);
						if(enemyTypeChance < 30){
							//bow enemy 30%
							var objEnemy = instance_create_depth(enemyX, enemyY, 1, o_enemyBow); 
						}else if(enemyTypeChance < 100){
							//sword enemy 70%
							var objEnemy = instance_create_depth(enemyX, enemyY, 1, o_enemySword);
						}
						objEnemy.image_angle = irandom(360);
						
						ds_stack_push(objectStack, objEnemy);
						scr_clipping_primary(objEnemy, false);
						//scr_clipping_secondary(objEnemy, false);
						enemyNum++;
					}*/
				
					//create offset for next wall
					//if(!doorB){
						xwall+=lengthdir_x(16, generatorWallAngle);
						ywall+=lengthdir_y(16, generatorWallAngle);
					//}
					/*
					else{
						xwall+=lengthdir_x(25, generatorWallAngle);
						ywall+=lengthdir_y(25, generatorWallAngle);
					}*/
					generatorWallAngleOffset += randomWallAngle;
					wallNum++;//increase number of walls count
				}
			
				if((enemyMax-enemyNum) > 0){
					repeat (enemyMax-enemyNum){
						var enemyLen = irandom_range(8,disToCen2-10);
					
						//var enemyLen = irandom_range(0, disToCen-5);
						var enemyAng = miscAngle;
						var enemyX = cenX+lengthdir_x(enemyLen, enemyAng);
						var enemyY = cenY+lengthdir_y(enemyLen, enemyAng);
						var enemyTypeChance = irandom(99);
						if(enemyTypeChance < 30 && (campType > 3)){
							//bow enemy 30%
							var objEnemy = instance_create_depth(enemyX, enemyY, 1, o_enemyBow); 
						}else if(enemyTypeChance < 100){
							//sword enemy 70%
							var objEnemy = instance_create_depth(enemyX, enemyY, 1, o_enemySword);
						}
						objEnemy.image_angle = irandom(360);
						
						ds_stack_push(objectStack, objEnemy);
						scr_clipping_primary(objEnemy, false);
						//scr_clipping_secondary(objEnemy, false);
						enemyNum++;
					}
				}
			
			}
			else if((campChange > 2 && campChange < 4) && (disFromMapCen >= 1000) && disFromTownCen >= 1000 && disFromCompoundCen >= (800+(128*3)) && closestCampDis > 600){
				
				//spawn house and shed
				var ranXC = irandom(bS);
				var ranYC = irandom(bS);
			
				var objHouse = instance_create_depth(x+ranXC, y+ranYC, 1, o_house);
				
				//push all its parts
				ds_stack_push(objectStack, objHouse);
				//ds_stack_push(objectStack, objHouse.instDoor);
				ds_stack_push(objectStack, objHouse.instBack);
				ds_stack_push(objectStack, objHouse.instSideL);
				ds_stack_push(objectStack, objHouse.instSideR);
				ds_stack_push(objectStack, objHouse.instFloor);
				ds_stack_push(objectStack, objHouse.instFloor.instRoof);
				
				ds_queue_enqueue(floorHouseQueue, objHouse.instFloor);
				scr_clipping_primary(objHouse.floorPointer, true);
				
				//scr_checkWrap(objHouse, 4);
			
				/*
				var shedLen = irandom_range(40,90);
				var shedAngle = irandom(360);
				var shedX = x+ranXC+lengthdir_x(shedLen,shedAngle);
				var shedY = y+ranYC+lengthdir_y(shedLen,shedAngle);
				var objShed = instance_create_depth(shedX, shedY, 1, o_shed);
				
				//push all its parts
				ds_stack_push(objectStack, objShed);
				ds_stack_push(objectStack, objShed.instBackWall);
				ds_stack_push(objectStack, objShed.instBR);
				ds_stack_push(objectStack, objShed.instBL);
				ds_stack_push(objectStack, objShed.instFL);
				ds_stack_push(objectStack, objShed.instFR);
				ds_stack_push(objectStack, objShed.instDoor);
				ds_stack_push(objectStack, objShed.instLeftSide);
				ds_stack_push(objectStack, objShed.instRightSide);
				ds_stack_push(objectStack, objShed.instFloor);
				ds_stack_push(objectStack, objShed.instFloor.instRoof);
				
		
				scr_clipping_primary(objShed.instFloor, true);
				//scr_checkWrap(objShed, 4);
				*/
				
			}
			else if(campChange > 10 && campChange < 12){
				var chanceRoad = irandom(100);
			if(chanceRoad<30 && disFromTownCen >= 1000 && disFromCompoundCen >= (800+(128*3))){//actually make a road
				//spawn road
				var roadAngle = irandom(360);
				var poleOffset = irandom_range(-30,0);
				//spawn poles
				var poleX = x+lengthdir_x(60, roadAngle)+lengthdir_x(100+poleOffset,roadAngle+90);
				var poleY = y+lengthdir_y(60, roadAngle)+lengthdir_y(100+poleOffset,roadAngle+90);
				var roadX = x;
				var roadY = y;
				
				//car control
				var carNum = 0;
				var maxCar = 5;
				var carLast = true;
				
				var repeatTime = choose(2,3,4,5);
				
					
				repeat(repeatTime){
					
					//spawn a pit fall somewhere near
					/*
					var pitfallAng = irandom(360);
					var pitfallLen = irandom_range(25,50);
					var pitfall = instance_create_depth(roadX+lengthdir_x(pitfallLen, pitfallAng), roadY+lengthdir_y(pitfallLen, pitfallAng), 1, o_pitfall);
					ds_queue_enqueue(floorQueue, pitfall);
					ds_stack_push(objectStack, pitfall);
					*/
				
					var roadBlock = instance_create_depth(roadX,roadY,1,o_road_block);
					roadBlock.image_angle = roadAngle;
					scr_clipping_primary(roadBlock, false);
					ds_queue_enqueue(floorQueue, roadBlock);
					ds_stack_push(objectStack, roadBlock);
					var firstPole = true;
					var lastPole = false;
					var curPole = 0;
					var numPole = choose(2,3,4);
				
					repeat(numPole){
						if(firstPole || lastPole)
							var roadPole = instance_create_depth(poleX, poleY, 1, o_pole_broken);
						else
							var roadPole = instance_create_depth(poleX,poleY,1,choose(o_pole_broken,o_pole_wired));
						roadPole.image_angle = roadAngle;
						scr_clipping_primary(roadPole, false);
						ds_queue_enqueue(floorHouseQueue, roadPole);
						ds_stack_push(objectStack, roadPole);
					
						poleX += lengthdir_x(62, roadAngle-90);
						poleY += lengthdir_y(62, roadAngle-90);
						
						firstPole = false;
						if(curPole+1 == numPole-1)
							lastPole = true;
						curPole++;
					}
					
					//spawn the road and cars and poles
					var carSpawn = choose(true,true,false);
					if ((carSpawn || !carLast) && (carNum < maxCar)){
						var carAngle = irandom(360);
						var carLen = irandom_range(5,70);
						var carInst = instance_create_depth(roadX+lengthdir_x(carLen, carAngle),roadY+lengthdir_y(carLen, carAngle),1,o_car);
						carInst.image_angle = irandom(360);
						scr_clipping_primary(carInst, false);
						ds_queue_enqueue(floorHouseQueue, carInst);
						ds_stack_push(objectStack, carInst);
						carLast = true;
						carNum++;
					}
					else
						carLast = false;
				
					roadX+=lengthdir_x(200, roadAngle-90);
					roadY+=lengthdir_y(200, roadAngle-90);
				}

			}
			}

#endregion
			
	x+=16;
	if(x >(room_width+500)){
		x = 500;
		y+=16;
	}

}
#endregion

//reset x and y AGAIN AGAIN
x = 500;
y = 0;

#region generate the camp and fire

var firePit = instance_create_depth((room_width/2)+500, room_height/2+30, 1, o_firepit);
firePit.spawnStartingEnemy = true;
scr_clipping_priority(firePit, false);
ds_stack_push(objectStack, firePit);
ds_queue_enqueue(activationQueue, firePit);
firePit.logCount = 2;
firePit.isLit = true;
var friendO = instance_create_depth(room_width/2-30, (room_height/2)+30, 1, o_friend_dead);
scr_clipping_priority(friendO, false);
ds_queue_enqueue(activationQueue, friendO);

var caveEntrance = instance_create_depth(room_width/2-50, room_height/2, 1, o_cave_entrance);
caveEntrance.listIndex = scr_createCave_new();


var objective = instance_create_depth(room_width/2, room_height/2, 1, o_findkey);

//cowardly enemy nearby
//var cowardDir = irandom(360);
//var coward = instance_create_depth((room_width/2)+lengthdir_x(60, cowardDir), (room_height/2)+lengthdir_y(60, cowardDir), 1, o_enemySword)
//coward.cowardlyFellow = true;
//coward.enemy_health-=2;
//coward.damageTickStatus = 3;

//ds_stack_push(objectStack, coward);
//scr_clipping_primary(coward, false);

#endregion

#region queue trash handling
//*************************************

//		TRASH HANDLING QUEUES

//		if instance no longer exists
// (was deleted), remove it from queue 
//*************************************

//enque the active list
var sizeFQ = ds_queue_size(floorQueue);
for(var fqv = 0; fqv < sizeFQ; fqv++ ){
	var floorInst = ds_queue_dequeue(floorQueue);
	
	if(instance_exists(floorInst))
		ds_queue_enqueue(floorQueue, floorInst);
}
			
var sizeFHQ = ds_queue_size(floorHouseQueue);
for(var fhqv = 0; fhqv < sizeFHQ; fhqv++){
	var floorHouseInst = ds_queue_dequeue(floorHouseQueue);
	
	if(instance_exists(floorHouseInst))
		ds_queue_enqueue(floorHouseQueue, floorHouseInst);
}

var sizeBLIDQ = ds_queue_size(global.bigLakeIDQ);
for(var blidqv = 0; blidqv < sizeBLIDQ; blidqv++){
	var bigLakeInst = ds_queue_dequeue(global.bigLakeIDQ);
	
	if(instance_exists(bigLakeInst))
		ds_queue_enqueue(global.bigLakeIDQ, bigLakeInst);
}

var sizeAQ = ds_queue_size(activationQueue);
for(var fav = 0; fav < sizeAQ; fav++){
	var activationInst = ds_queue_dequeue(activationQueue);
	
	if(instance_exists(activationInst))
		ds_queue_enqueue(activationQueue, activationInst);
}

queue_sortQueue(floorHouseQueue);
queue_sortQueue(floorQueue);
queue_sortQueue(activationQueue);
/*
while(!ds_queue_empty(floorHouseQueue)){
	show_debug_message("y :"+string(ds_queue_dequeue(floorHouseQueue).y));	
}*/

#endregion

//while the instance is within the room
//loops moving to the right then when it reaches the end goes down

//biomes (cant be variables because other objects reference it)
birch = false;
spruce = false;

//used for finding the angle of the wall generated
generatorWallAngle = 0;

show_debug_message("generating elements");

//step event for everything else

dynamicDeactivationTick = 0;

//step offset for instance_activate_all
instanceActivateOffset = 0;
//alarm[0] = 0;


offsetOneAlt = false;
mapBlock = 0;
//mapBlock = (global.blockXNum*global.blockYNum)-1;

deactivateRegionY = 800;

global.canMove = true;
/*
with(o_camera){//o_camera
	ds_stack_push(o_generatorNStepNew.activationStack, id);	
}
with(o_player){//o_player
	ds_stack_push(o_generatorNStepNew.activationStack, id);
}
with(o_shaders){//o_shaders
	ds_stack_push(o_generatorNStepNew.activationStack, id);
}
with(o_initializer){//o_initializer
	ds_stack_push(o_generatorNStepNew.activationStack, id);
}
with(o_weather){//o_weather
	ds_stack_push(o_generatorNStepNew.activationStack, id);
}
with(o_hud){//o_hud
	ds_stack_push(o_generatorNStepNew.activationStack, id);
}
with(o_debugger){//o_debugger
	ds_stack_push(o_generatorNStepNew.activationStack, id);
}
with(o_input){//o_input
	ds_stack_push(o_generatorNStepNew.activationStack, id);
}*/

//initialization

			show_debug_message("x: "+string(x));
			show_debug_message("y: "+string(y));

instance_deactivate_all(true);

//replaces the old activation code
/*
var sizeAS = ds_stack_size(activationStack);
for(var stackV = 0; stackV < sizeAS; stackV++){
	var stackID = ds_stack_pop(activationStack);
	instance_activate_object(stackID);
	ds_stack_push(activationStack, stackID);
}
*/



			instance_activate_object(o_camera);
			instance_activate_object(o_generatorNStepNew);
			instance_activate_object(o_player);
			instance_activate_object(o_shaders);	
			instance_activate_object(o_initializer);
			instance_activate_object(o_weather);
			instance_activate_object(o_hud);
			//instance_activate_object(o_debugger);
			instance_activate_object(o_input);
			
			
			instance_activate_layer(loadingLayerId);
			instance_activate_object(o_footprint);
			//activate the first section
			//instance_activate_region(-1,-1, 525,525, true);//activate loading section
				//instance_activate_region(x, y-250, room_width, y+250, true);
			