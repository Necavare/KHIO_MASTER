var bS = 16; // <- needs to be var? cus reasons dont ask

#region instanceActivateOffset 0
if(instanceActivateOffset == 0){
	o_player.isWalking = true;
	//make y dir and x dir always go "forward" so that you can rotate camera
	o_player.ydir = -1;
	if(o_player.y <= 150){
		var newYPos = 400+(150-o_player.y);
		var newYOffset = newYPos-o_player.y;
		o_player.y = newYPos;
		o_camera.y+=newYOffset;
	}
	//show_debug_message("y : "+string(y));
	//show_debug_message("x : "+string(x));
	//show_debug_message("--------------");


#region repeat section
repeat(480){
	//instance_activate_all();
	//instance_deactivate_region(x-250, y-250, 500, 500, false, true)
	
	//instance_activate_region(x-250, y-250, 500, 500, true);

		
	
	if(y<=room_height){
		/*
		if(alarmActivation<=0){
			instance_activate_region(x, y-250, 250, 500, true);
			alarmActivation = 10;
		}
		alarmActivation--;
		*/
		//active the next section
		//instance_activate_object(o_lake);
		//instance_activate_object(o_pond);
	
		//show_debug_message("x: "+string(x)+" y: "+string(y));
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
		//check for making sure not to draw left of the mountains
		//currently mountains dont exist so just start generating
		//if(position_meeting(x,y,o_cliff))
	
		
			#region foundational elements
		
			//***********************************************
			// foundation elements(only grass and lakes atm)
			//***********************************************
			var groundOdds = irandom(99);
		
			//var grassPatch = false;
			//creating grass (20% with additional odds (30%) added with extra grass around)
			//if(groundOdds>95){
			
				//check if theirs no grass or cattail in 1  block radius
				/*
				if(!scr_checkR( bS, 1, o_grass)||!scr_checkR(bS, 1, o_cattail)){
					grassPatch = true;//if no grass in a one block radius	
				}*/
				
				/*
				if(!collision_circle(x,y, bS, o_grass, true, true)||!collision_circle(x,y, bS, o_cattail,true, true)){
					grassPatch = true;//if no grass in a one block radius
				}
			
			
				
				var grassO = o_grass;
			
			
				//create the grass
				if(grassPatch){
					var g1 = instance_create_depth(x, y, 2, grassO);	
					var g2 = instance_create_depth(x+bS, y, 2, grassO);
					var g3 = instance_create_depth(x-bS, y, 2, grassO);
					var g4 = instance_create_depth(x, y-bS, 2, grassO);
					var g5 = instance_create_depth(x, y+bS, 2, grassO);
					scr_clipping_special(g1, false);
					scr_clipping_special(g2, false);
					scr_clipping_special(g3, false);
					scr_clipping_special(g4, false);
					scr_clipping_special(g5, false);
				}
			
			
				//if creating lone grass choose wether its a bush and then create it
				else{
					if(spruce||(!spruce&&!birch))
						grassO = choose(o_grass, o_grass, o_grass, o_bush);
					else
						grassO = o_grass;
					var g6 = instance_create_depth(x,y,2, grassO);
					scr_clipping_special(g6, false);
				}
				
				*/
			
			//}
		
			//creating lakes (1% chance to MAYBE make one) 
			if(groundOdds < 1){
				//it must become even rarer so it has another chance even if the 1% works
				var lakeOdds = irandom(99);
				if(lakeOdds < 5){ //0.05% (5% of 1%) of actually making one
					//if(!scr_checkR(bS, 5, o_lake)){//if lake nearby dont make lake
					if(!collision_circle(x,y,5*16, o_lake, true, true)){
						var lakeType;
						if(spruce)
							lakeType = o_lake;
						else if(birch)
							lakeType = o_pond;
						if((spruce&&birch)||(!spruce&&!birch))
							lakeType = choose(o_lake, o_pond);
						var lakeO1 = instance_create_depth(x,y,8000, lakeType);
						scr_clipping_primary(lakeO1, false);
					}
					else if(birch){//make a pond instead
						var lakeO2 = instance_create_depth(x,y,8000, o_pond);
						scr_clipping_primary(lakeO2, false);
					}
				}
			}
		
			#endregion
			
			#region misc elements
		
			//********************************
			//misc elements (trees, logs, stumps, etc.)
			//********************************
			//check if a large misc element has already taken up this slot
			//ensure you dont create something on the player (foundation are under player so doesnt matter)
				var miscOdds = irandom(99); // odds to create different objects
				var treeOdds = irandom_range(1,2); // odds to get either spruce birch or pine
				if(birch)
					treeOdds = 1;
				else if(spruce)
					treeOdds = 2;
				else if(!spruce&&!birch)
					treeOdds = 3;
			
			
				//the trees have un-fallen
				/*
				if(scr_checkR(bS,1, o_birch)||scr_checkR(bS, 1, o_birch_stump)
				||scr_checkR(bS, 1, o_spruce)||scr_checkR(bS, 1, o_spruce_stump)
				){
				
				else if(scr_checkR(bS,2, o_birch)||scr_checkR(bS,2, o_birch_stump)
				||scr_checkR(bS,2, o_spruce)||scr_checkR(bS,2, o_spruce_stump)
				*/
				if(collision_circle(x,y,bS, o_birch, true, true)||collision_circle(x,y,bS, o_birch_stump,true,true)
				||collision_circle(x,y,bS, o_spruce, true, true)||collision_circle(x,y,bS, o_spruce_stump,true,true)){
					miscOdds+=20;	
				}
				else if(collision_circle(x,y,bS*2, o_birch,true,true)||collision_circle(x,y,bS*2, o_birch_stump,true,true)||
						collision_circle(x,y,bS*2, o_spruce, true, true)||collision_circle(x,y,bS*2, o_spruce_stump, true,true)){
					miscOdds+=10; //increased odds of 10% when trees are within 2 squares
				}
			
				//odds of making a tree (10%)
				if(miscOdds>95){
				
					var moreTrees=choose(2,1,1,1,0,0,0,0,0,0,0,0,0,0,0); 
					var oldX=100;//these numbers are impossible as a reference to "false"
					var oldY=100;
				
					//how many more trees will be created in the same square
					while(moreTrees>=0){
				
					//random x and y positions for the tree to spawn at in the square
					ranX=irandom(bS-5); //depends on size of tree in this case: 5
					ranY=irandom(bS-5);
					if(oldX != 100 && oldY != 100){
					while( (abs(ranX-oldX) < 3)|| (abs(ranY-oldY) < 3)){
						if(abs(ranX-oldX) < 3)
							ranX=irandom(bS-5);
						if(abs(ranY-oldY) < 3)
							ranY=irandom(bS-5);
					}
					}
					oldX = ranX;
					oldY = ranY;
					var treeStatusOdds=irandom(99);
				
					//birch
					if(treeOdds=1){
						if(treeStatusOdds<70){//70% odds to make normal tree
							var objb1=instance_create_depth(x+ranX,y+ranY,1, o_birch); //spawn that tree
							scr_clipping_secondary(objb1, false);
						}
						if(treeStatusOdds<80&&treeStatusOdds>=70){//10% odds to make stump
							var objbs=instance_create_depth(x+ranX,y+ranY,1,o_birch_stump);
							scr_clipping_secondary(objbs, false);
						}
						if(treeStatusOdds<99&&treeStatusOdds>=80){//20% odds to make fallen tree (SYCH)
							//MORE ODDS TO MAKE NORMIE TREES
							var objbf = instance_create_depth(x+ranX,y+ranY,1,o_birch);
							//var obj= instance_create_depth(x+ranX,y+ranY,1,o_birch_fallen);
							scr_clipping_secondary(objbf, false);
						}
					}
				
					//spruce
					if(treeOdds=2){
						if(treeStatusOdds<70){ //same odds as birch for all types, see above ^^^^^
							var objs1=instance_create_depth(x+ranX,y+ranY,1,o_spruce); //spawn that tree
							scr_clipping_primary(objs1, false);
						}
						if(treeStatusOdds<80&&treeStatusOdds>=70){
							var objss=instance_create_depth(x+ranX,y+ranY,1,o_spruce_stump);
							scr_clipping_primary(objss, false);	
						}
						if(treeStatusOdds<99&&treeStatusOdds>=80){
							//MORE ODDS TO MAKE NORMIE TREES
							var objsf=instance_create_depth(x+ranX,y+ranY,1,o_spruce); //spawn that tree
							//var obj=instance_create_depth(x+ranX,y+ranY,1,o_spruce_fallen);
							scr_clipping_primary(objsf, false);
						}
					}
				
					//pine
					if(treeOdds >= 3){
						//no tree status (yet)
						//var obj = instance_create_depth(x+ranX, y+ranY, 1, o_pine);
						//scr_clipping_primary(obj);
						//due to removal of pine as replacement for spruce temporarily just doing this
					}
						moreTrees--;
					}

				}
			
				
				//spawn big rocks
				var rockOdds = irandom(999);
				if(rockOdds<15 && birch == spruce){
					var ranXR = irandom(bS);
					var ranYR= irandom(bS);
					var bigRock = instance_create_depth(x+ranXR, y+ranYR, 1, o_bigrock);
					scr_clipping_primary(bigRock, false);
				}
				/*
				//odds of making a rock
				var rockOdds=10;
				//if their are rocks nearby increase likelyhood of making a rock
				//if(scr_checkR(bS, 4, o_rocks)||scr_checkR(bS, 4, o_rock))
				if(collision_circle(x,y,bS*4, o_rocks, true, true)||collision_circle(x,y,bS*4, o_rock, true, true))
					rockOdds+=20;
				else if(miscOdds<rockOdds){
					var rockSizeOdds=irandom(99);
					//if their are rocks nearby increase chances of making large/medium rock
					//if(scr_checkR(bS, 4, o_rocks)||scr_checkR(bS, 4, o_rock))
					if(collision_circle(x,y,bS*4,o_rocks, true,true)||collision_circle(x,y,bS*4, o_rock, true, true))
						rockSizeOdds+=20;
					if(rockSizeOdds<60){//60% odds to create small rock
						var moreRocks = choose(2,2,1,1,1,0,0,0); //choose wether to make 3,2 or 1 rocks per square
						while(moreRocks >= 0){
							ranX = irandom(bS-5); //size of small rock is 5
							ranY = irandom(bS-5);
							var objr1=instance_create_depth(x+ranX,y+ranY,1,o_rocks);
							scr_clipping_secondary(objr1, false);
							moreRocks--;
						}
					
					}
					if(rockSizeOdds>85){//10% or higher depending on proximity to other rocks 
						//decide what rock to spawn
						//var rockO = choose(o_rock_small, o_rock_small, o_rock_medium, o_rock_large);
						var rockO = o_rock;
					
						//move forward (relative to direction) 1 cell
				
						//randomize spawn location but limited due to arbitrary decision
						var ranX = irandom(bS-10);
						var ranY = irandom(bS-10);
						var objr2 = instance_create_depth(ranX+x, ranY+y, 1, rockO);
						scr_clipping_primary(objr2, false);
						
					}
				}
			
				//flowers
				//10% chance put between the max chance the rock can have so it doesnt messs with it
				if((miscOdds>=30)&&(miscOdds<35)&&birch){
					var moreFlowers = choose(2,2,1,1,1,0,0,0); //choose wether to make 3,2 or 1 flowers per square
					while(moreFlowers >= 0){
							ranX = irandom(bS-8); //size of lily of the vally 8x9
							ranY = irandom(bS-9);
							var objflower=instance_create_depth(x+ranX,y+ranY,1,o_lillyofthevalley);
							scr_clipping_primary(objflower, false);
							moreFlowers--;
						}
				}
				*/
				#endregion

			#region enemy camps and houses/sheds
		
			//the sum of the exterior angles of a polygon, equal 360.
			// if all camps are considered polygons made up of walls
			// the added sum of their angles will be 360, so these angles can be
			// precalculated and then manufactured
			var campChange = irandom(9999);//0-9aws999
			var disFromMapCen = point_distance(x,y, room_width/2, room_height/2);
			if((campChange <2) && (disFromMapCen >= 1500)){
				var angleTotal = 360;
				var xwall = x;
				var ywall = y;
				var generatorWallAngleOffset = 0;
				var wallNum = 0;
				generatorWallAngle = 0;
				var randomWallAngle = irandom_range(5,30);
				var wallMax = ceil(360/randomWallAngle); //how many walls their will be
				var disToCen = abs(29/(2*tan(180/wallMax)));
				var cenX = 0;
				var cenY = 0;
			
				//possible that the size of the camp can be deduced with math using the angle and size
				// of walls to calculate the area 
			
				//create towers in the camp
				var towerMax = 15;
				var towerNum = 0;
			
				//create fire pit
				var fireMax = 3;
				var fireNum = 0;
			
				//create tent
				var tentMax = 4;
				var tentNum = 0;
			
				//create anvil
				var anvilMax = 1;
				var anvilNum = 0;
			
				// create large crate
				// created alongside other things, not sure what yet 
			
				//create enemy npc's inside and outside the base
				var enemyMax = 25;
				var enemyNum = 0;
			
			
				while(angleTotal>0){
					//other creation inside the camp
					var towerOdds = irandom(99);
					var fireOdds = irandom(99);
					var tentOdds = irandom(99);
					var anvilOdds = irandom(99);
					var enemyOdds = irandom(99);
					if(towerNum = 0)
						towerOdds = 0;
				
				
					var doorB = false; //door boolean value to keep track of wether were making a door
					if(wallNum = 5){
						doorB = true;//set door boolean value to true
						wallNum = -5;//set offset so it needs even more before next door
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
						xwall+=lengthdir_x(15, generatorWallAngle);
						ywall+=lengthdir_y(15, generatorWallAngle);
						var objWall=instance_create_depth(xwall,ywall,1, o_wall_wood); //spawn the wall
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
						scr_clipping_primary(objWall, false);
					}
					else{	
						xwall+=lengthdir_x(4, generatorWallAngle);
						ywall+=lengthdir_y(4, generatorWallAngle);
						var objDoor=instance_create_depth(xwall,ywall,1, o_door_wood); //spawn the wall
						objDoor.image_angle = generatorWallAngle;
						objDoor.startingAngle = generatorWallAngle;
						scr_clipping_primary(objDoor, false);
					}
				
					//find center position
					cenX = xwall+lengthdir_x(disToCen, 90+generatorWallAngleOffset);
					cenY = ywall+lengthdir_y(disToCen, 90+generatorWallAngleOffset);
				
					//spawn towers maybe
					if((towerOdds < 5) && (towerNum < towerMax) && (disToCen > 20)){
						var towerLen = irandom_range(0,disToCen-20);
						var towerAngle = irandom(360);
						var towerX = cenX+lengthdir_x(towerLen, towerAngle);
						var towerY = cenY+lengthdir_y(towerLen, towerAngle);
						var objT = instance_create_depth(towerX, towerY, 1, o_tower); //spawn tower
						objT.image_angle = irandom(360);
						scr_clipping_primary(objT, false);
						towerNum++;
					}
				
					//spawn fire pits maybe
					if((fireOdds < 5) && (fireNum < fireMax) && (disToCen > 20)){
						var fireLen = irandom_range(0, disToCen-20);
						var fireAng = irandom(360);
						var fireX = cenX+lengthdir_x(fireLen, fireAng);
						var fireY = cenY+lengthdir_y(fireLen, fireAng);
						var objF = instance_create_depth(fireX, fireY, 1, o_firepit);//spawn firepit
						objF.image_angle = irandom(360);	
						scr_clipping_primary(objF, false);
						fireNum++;
					}
				
					//tent maybe
					if((tentOdds < 5) && (tentNum < tentMax) && (disToCen > 20)){
						var tentLen = irandom_range(0,disToCen-20);
						var tentAng = irandom(360);
						var tentX = cenX+lengthdir_x(tentLen, tentAng);
						var tentY = cenY+lengthdir_y(tentLen, tentAng);
						var objTent = instance_create_depth(tentX, tentY, 1, o_tent); //spawn tent
						objTent.image_angle = irandom(360);
						scr_clipping_primary(objTent, false);
						tentNum++;
					}
				
					//anvil odds
					if((anvilOdds < 5)&&(anvilNum < anvilMax)){
						var anvilLen = irandom_range(0,disToCen-5);
						var anvilAng = irandom(360);
						var anvilX = cenX+lengthdir_x(anvilLen, anvilAng);
						var anvilY = cenY+lengthdir_y(anvilLen, anvilAng);
						var objAnvil = instance_create_depth(anvilX, anvilY, 1, o_anvil); //spawn anvil
						objAnvil.image_angle = irandom(360);
						scr_clipping_primary(objAnvil, false);
						anvilNum++;
					}
				
					//npc odds
					if((enemyOdds < 20)&&(enemyNum < enemyMax)){
						var enemyLen = irandom_range(0, disToCen-5);
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
						scr_clipping_secondary(objEnemy, false);
						enemyNum++;
					}
				
					//create offset for next wall
					if(!doorB){
						xwall+=lengthdir_x(14, generatorWallAngle);
						ywall+=lengthdir_y(14, generatorWallAngle);
					}
					else{
						xwall+=lengthdir_x(25, generatorWallAngle);
						ywall+=lengthdir_y(25, generatorWallAngle);
					}
					generatorWallAngleOffset += randomWallAngle;
					wallNum++;//increase number of walls count
				}
			
			}
			else if((campChange > 2 && campChange < 8) && (disFromMapCen >= 1500)){
				
				//spawn house and shed
				var ranXC = irandom(bS);
				var ranYC = irandom(bS);
			
				var objHouse = instance_create_depth(x+ranXC, y+ranYC, 1, o_house);
				scr_clipping_primary(objHouse.floorPointer, true);
				//scr_checkWrap(objHouse, 4);
			
				var shedLen = irandom_range(40,90);
				var shedAngle = irandom(360);
				var shedX = x+ranXC+lengthdir_x(shedLen,shedAngle);
				var shedY = y+ranYC+lengthdir_y(shedLen,shedAngle);
				var objShed = instance_create_depth(shedX, shedY, 1, o_shed);
				scr_clipping_primary(objShed.instFloor, true);
				//scr_checkWrap(objShed, 4);
				
				
			}
			else if((campChange >8 && campChange < 10) && (disFromMapCen >= 150)){
			//spawn water tower
			var ranXW = irandom(bS);
			var ranYW = irandom(bS);
			var waterTower = instance_create_depth(x+ranXW, y+ranYW, 1, o_watertower);
			scr_clipping_primary(waterTower, false);
			
			}

			#endregion

		x+=bS; // move on to next square
		//if x reaches its max (offset of 500)
		if(x>=(room_width+500)){
			//initialization
			show_debug_message("x: "+string(x));
			show_debug_message("y: "+string(y));
			instance_deactivate_all(true);
			instance_activate_object(o_camera);
			instance_activate_object(o_generatorNStep);
			instance_activate_object(o_player);
			instance_activate_object(o_shaders);	
			instance_activate_object(o_initializer);
			instance_activate_object(o_weather);
			instance_activate_object(o_lake);
			instance_activate_object(o_pond);
			instance_activate_object(o_hud);
			//instance_activate_object(o_debugger);
			instance_activate_object(o_input);
			
			//activate the first section
			instance_activate_region(-1,-1, 525,525, true);//activate loading section
				//instance_activate_region(x, y-250, room_width, y+250, true);
			
			y+=bS;
			x=500;
			
		}
	
	}//<- y limit check
}//<- repeat 
#endregion


}// <- instanceActivateOffset check
#endregion

#region instanceActivateOffset 1
//if its done building
if (y>room_height && instanceActivateOffset == 1){
	
	//change all remaining grass that should be cattail into cattail
	/*
	with(o_grass){
		//if(scr_checkR(bS,3,o_lake) || scr_checkR(bS,3,o_pond)){
		if(collision_circle(x,y,bS*3, o_lake, true, true)||collision_circle(x,y,bS*3, o_pond, true, true)){
			instance_create_depth(x,y,depth,o_cattail);
			instance_destroy(self);
		}
	}
	*/
	
	with(all){
		//remove all the loading extra stuff
		if(layer = layer_get_id("LoadingLayer"))
			instance_destroy(self);
		x=x-500;//reset x offset	
	}
	instanceActivateOffset = 2;
}
#endregion

#region instanceActivateOffset 2
miniValues[0]=0;
if(y >room_height && instanceActivateOffset == 2){

#region par 3d_object
	with(par_3d_object){
		//copy paste from par_3d_object  create to do minimap stuff
		//take into account room shift
		//var nx = x+global.xoffset;
		//var ny = y+global.yoffset;
		
        nx = x;
		ny = y;
		
		if (ny < 0) { ny += room_height; }
		if (ny >= room_height) { ny -= room_height; }
		if (nx < 0) { nx += room_width; }
		if (nx >= room_width) { nx -= room_width; }

		dy = ny;
		if((object_index == o_lake) || (object_index == o_pond)){
			dy = 1;		
		}
		
		miniValues[0] = sprite_index; //set sprite for minimap
		miniValues[1] = image_angle; //set angle of rotation
		miniValues[2] = nx; //x position
		miniValues[3] = ny; //y position
		miniValues[4] = dy; //general depth, some objects can set this to 0 or other small number if bottom layer
		
		ds_map_add(global.minimapVar, id, miniValues);
		ds_list_add(global.activemm, id); //add it to list of active minimap symbols
	}
#endregion

#region walls
	miniValues1S[0] = 0;
	miniValues2S[0] = 0;
	miniValues3S[0] = 0;
	miniValues4S[0] = 0;
	miniValues5S[0] = 0;
	miniValues6S[0] = 0;
	with(o_wall_wood){
		numberLogs = 0;
		logId = 1000000;//making a made up id for the logs
		
		for(i = 0; i < 20; i+=4) {
			xx = x+lengthdir_x(i,-camera_get_view_angle(view_camera[0])+90);
			yy = y+lengthdir_y(i,-camera_get_view_angle(view_camera[0])+90);
			if (yy < 0) { yy += room_height; }
			if (yy >= room_height) { yy -= room_height; }
			if (xx < 0) { xx += room_width; }
			if (xx >= room_width) { xx -= room_width; }
	
			// add logs to minimap
			if((i == 0) && (logs > 0)) {
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
			if((i == 4) && (logs > 1)) {
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
			if((i == 8) && (logs > 2)) {
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
			if((i == 12) && (logs > 3)) {
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
			if((i == 16) && (logs > 4)) {
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
			if((i == 0) && (upgraded)){
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
		
		i = 0;
	
	
	}

#endregion
	
#region roofs
miniValuesShed[0] = 0;
with(o_shed_roof){
	//create a minimap version (dont do it while dynamically generating tho)=	
	//take into account room shift
	nxShed = x+lengthdir_x(27,-camera_get_view_angle(view_camera[0])+90);
	nyShed = y+lengthdir_y(27,-camera_get_view_angle(view_camera[0])+90);

	if (nyShed < 0) { nyShed += room_height; }
	if (nyShed >= room_height) { nyShed -= room_height; }
	if (nxShed < 0) { nxShed += room_width; }
	if (nxShed >= room_width) { nxShed -= room_width; }

	miniValuesShed[0] = sprite_index; //set sprite for minimap
	miniValuesShed[1] = image_angle; //set angle of rotation
	miniValuesShed[2] = nxShed; //x position
	miniValuesShed[3] = nyShed; //y position
	miniValuesShed[4] = nyShed; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, id, miniValuesShed);
	ds_list_add(global.activemm, id); //add it to list of active minimap symbols
}

miniValuesHouse[0] = 0;
with(o_house_roof){
	//create a minimap version (dont do it while dynamically generating tho)=	
	//take into account room shift
	nxHouse = x+lengthdir_x(38,-camera_get_view_angle(view_camera[0])+90);
	nyHouse = y+lengthdir_y(38,-camera_get_view_angle(view_camera[0])+90);
        
	if (nyHouse < 0) { nyHouse += room_height; }
	if (nyHouse >= room_height) { nyHouse -= room_height; }
	if (nxHouse < 0) { nxHouse += room_width; }
	if (nxHouse >= room_width) { nxHouse -= room_width; }

	miniValuesHouse[0] = sprite_index; //set sprite for minimap
	miniValuesHouse[1] = image_angle; //set angle of rotation
	miniValuesHouse[2] = nxHouse; //x position
	miniValuesHouse[3] = nyHouse; //y position
	miniValuesHouse[4] = nyHouse; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, id, miniValuesHouse);
	ds_list_add(global.activemm, id); //add it to list of active minimap symbols
}

#endregion

	show_debug_message("finished loading");
	
	//if creating initial map create the initial map
	
	//it is no longer generating environment
	global.generatingEnvironment=false;

	//destroy all the clone instances
	//this could possibly increase the effecency of the map by having only physical objects here then transforming them
	//into non physical "illusiary" minimap symbols but for now its unnecessary
	/*
	for(var i = 0; i<ds_list_size(global.extraInst); i++){
		instance_destroy(ds_list_find_value(global.extraInst, i));
	}
	ds_list_destroy(global.extraInst);
	*/

	//once it has served its purpose the generator commits ritual suicide


	//just save here so that it has a base save state
	//save_createNew(global.currentFile);
	global.canMove = true;
	global.loading = false;
	o_player.x = room_width/2;
	o_player.y = room_height/2;
	scr_clipping_primary(o_player, false);
	o_camera.x = room_width/2;
	o_camera.y = room_height/2;
	global.xoffset = 0;
	global.yoffset = 0;
	instance_destroy(self);
}
#endregion

#region instanceActivateOffset 0, sets activate 1 and activates all
if((y > room_height) && instanceActivateOffset == 0){//load up all active instances for the last fixes
	instanceActivateOffset = 1;
	instance_activate_all();
}
#endregion

