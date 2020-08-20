//it is currently generating the envornment
global.generatingEnvironment=true;
global.extraInst = ds_list_create();

var bS=16; //block size

#region create biome layout

#region initialize biome array

//starting at the top left
x = 0;
y = 0;

//set biome array variables
biomeArray[0,0] = 0;
while(y <= room_height){
	arrayY = y/bS;
	arrayX = x/bS;
	biomeArray[arrayX, arrayY] = 0;
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
		var biomeType = scr_checkRBiome(biomeArray, arrayX, arrayY, 3, currentBiome);
		if(biomeType = 0){//if 1 or 2 is not nearby then choose one
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
			biomeArray[arrayX,arrayY] = 1;
		}
		else{ 
			//show_debug_message("found 2");
			biomeArray[arrayX,arrayY] = 2;
		}
		//show_debug_message("-----------------------");
		//show_debug_message(" { ...");
		scr_generateBiome2(biomeArray, arrayX, arrayY, biomeType, 150);
		//show_debug_message(" ... }");
		//biomeArray = scr_generateBiome(biomeArray, arrayX, arrayY, biomeType);
		checkNum = random_range(0,120);
		biomeCreationOdds = 0;
		previousBiome = currentBiome;
		
		currentBiome = biomeType;
		//show_debug_message("CURRENT BIOME : " + string(currentBiome));
	}
	else{
		biomeArray[arrayX,arrayY] = 0;
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
x = 0;
y = 0;


//while the instance is within the room
//loops moving to the right then when it reaches the end goes down

//biomes (cant be variables because other objects reference it)
birch = false;
spruce = false;

//used for finding the angle of the wall generated
generatorWallAngle = 0;

//show_debug_message("generating elements");
while(y<=room_height){
	//show_debug_message("x: "+string(x)+" y: "+string(y));
	var biomeArrayC = biomeArray[x/16, y/16];
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
		
		//********************************
		//foundation elements(only grass and lakes atm)
		//********************************
		var groundOdds = irandom(99);
		
		var grassPatch = false;
		//creating grass (20% with additional odds (30%) added with extra grass around)
		if(groundOdds>95){
			
			//check if theirs no grass or cattail in 1  block radius
			if(!scr_checkR( bS, 1, o_grass)||!scr_checkR(bS, 1, o_cattail)){
				grassPatch = true;//if no grass in a one block radius	
			}
			
			//*****************************************************************************
			// this code has been commented out since it is reduntent with the final code
			//*****************************************************************************
			/*
			if(scr_checkR(bS, 1, o_cattail))
				cattailNear = true;
			//if their is a lake nearby make cattails
			if(scr_checkR(bS, 3, o_lake)||scr_checkR(bS,3,o_pond)){
				var grassO = o_cattail;
			}
			//if theirs no type of grass nearby just pick at random (possible bushes)
			else
			*/
			
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
			
		}
		
		//creating lakes (1% chance to MAYBE make one) 
		if(groundOdds < 1){
			//it must become even rarer so it has another chance even if the 1% works
			var lakeOdds = irandom(99);
			if(lakeOdds < 5){ //0.05% (5% of 1%) of actually making one
				if(!scr_checkR(bS, 5, o_lake)){//if lake nearby dont make lake
					var lakeType;
					if(spruce)
						lakeType = o_lake;
					else if(birch)
						lakeType = o_pond;
					if((spruce&&birch)||(!spruce&&!birch))
						lakeType = choose(o_lake, o_pond);
					var lakeO = instance_create_depth(x,y,8000, lakeType);
				
				}
				else if(birch)//make a pond instead
					var lakeO = instance_create_depth(x,y,8000, choose(o_pond));
				scr_clipping_primary(lakeO, false);
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
			if(scr_checkR(bS,1, o_birch)||scr_checkR(bS, 1, o_birch_stump)
			||scr_checkR(bS, 1, o_spruce)||scr_checkR(bS, 1, o_spruce_stump)
			){
				miscOdds+=20;	
			}
			else if(scr_checkR(bS,2, o_birch)||scr_checkR(bS,2, o_birch_stump)
			||scr_checkR(bS,2, o_spruce)||scr_checkR(bS,2, o_spruce_stump)
			){
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
						var obj=instance_create_depth(x+ranX,y+ranY,1, o_birch); //spawn that tree
						scr_clipping_primary(obj, false);
					}
					if(treeStatusOdds<80&&treeStatusOdds>=70){//10% odds to make stump
						var obj=instance_create_depth(x+ranX,y+ranY,1,o_birch_stump);
						scr_clipping_primary(obj, false);
					}
					if(treeStatusOdds<99&&treeStatusOdds>=80){//20% odds to make fallen tree (SYCH)
						//MORE ODDS TO MAKE NORMIE TREES
						var obj = instance_create_depth(x+ranX,y+ranY,1,o_birch);
						//var obj= instance_create_depth(x+ranX,y+ranY,1,o_birch_fallen);
						scr_clipping_primary(obj, false);
					}
				}
				
				//spruce
				if(treeOdds=2){
					if(treeStatusOdds<70){ //same odds as birch for all types, see above ^^^^^
						var obj=instance_create_depth(x+ranX,y+ranY,1,o_spruce); //spawn that tree
						scr_clipping_primary(obj, false);
					}
					if(treeStatusOdds<80&&treeStatusOdds>=70){
						var obj=instance_create_depth(x+ranX,y+ranY,1,o_spruce_stump);
						scr_clipping_primary(obj, false);	
					}
					if(treeStatusOdds<99&&treeStatusOdds>=80){
						//MORE ODDS TO MAKE NORMIE TREES
						var obj=instance_create_depth(x+ranX,y+ranY,1,o_spruce); //spawn that tree
						//var obj=instance_create_depth(x+ranX,y+ranY,1,o_spruce_fallen);
						scr_clipping_primary(obj, false);
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
			
			
			//odds of making a rock
			var rockOdds=10;
			//if their are rocks nearby increase likelyhood of making a rock
			if(scr_checkR(bS, 4, o_rocks)||scr_checkR(bS, 4, o_rock))
				rockOdds+=20;
			else if(miscOdds<rockOdds){
				var rockSizeOdds=irandom(99);
				//if their are rocks nearby increase chances of making large/medium rock
				if(scr_checkR(bS, 4, o_rocks)||scr_checkR(bS, 4, o_rock))
					rockSizeOdds+=20;
				if(rockSizeOdds<60){//60% odds to create small rock
					var moreRocks = choose(2,2,1,1,1,0,0,0); //choose wether to make 3,2 or 1 rocks per square
					while(moreRocks >= 0){
						ranX = irandom(bS-5); //size of small rock is 5
						ranY = irandom(bS-5);
						var obj=instance_create_depth(x+ranX,y+ranY,1,o_rocks);
						scr_clipping_secondary(obj, false);
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
					
					var obj = instance_create_depth(ranX+x, ranY+y, 1, rockO);
					scr_clipping_primary(obj, false);
						
				}
			}
			
			//flowers
			//10% chance put between the max chance the rock can have so it doesnt messs with it
			if((miscOdds>=30)&&(miscOdds<35)&&birch){
				var moreFlowers = choose(2,2,1,1,1,0,0,0); //choose wether to make 3,2 or 1 flowers per square
				while(moreFlowers >= 0){
						ranX = irandom(bS-8); //size of lily of the vally 8x9
						ranY = irandom(bS-9);
						var obj=instance_create_depth(x+ranX,y+ranY,1,o_lillyofthevalley);
						scr_clipping_primary(obj, false);
						moreFlowers--;
					}
			}
			
			#endregion
			
		#region enemy camps
		
		//the sum of the exterior angles of a polygon, equal 360.
		// if all camps are considered polygons made up of walls
		// the added sum of their angles will be 360, so these angles can be
		// precalculated and then manufactured
		var campChange = irandom(9999);//0-9aws999
		if(campChange <2){
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
				/*
				if(angleTotal<30)
					randomWallAngle = angleTotal;
				else
					randomWallAngle = irandom_range(5,30);
				*/
				generatorWallAngle = randomWallAngle;
				angleTotal-=generatorWallAngle;
				generatorWallAngle += generatorWallAngleOffset;
				if(!doorB){
					xwall+=lengthdir_x(15, generatorWallAngle);
					ywall+=lengthdir_y(15, generatorWallAngle);
					var obj=instance_create_depth(xwall,ywall,1, o_wall_wood); //spawn the wall
					obj.image_angle = generatorWallAngle;
					obj.logs = 5;
					obj.logType[0] = irandom_range(0,1);
					obj.logType[1] = irandom_range(0,1);
					obj.logType[2] = irandom_range(0,1);
					obj.logType[3] = irandom_range(0,1);
					obj.logType[4] = irandom_range(0,1);
					obj.upgraded = choose(false, true);
					obj.health_ = 5 + (obj.logs * 3);
					scr_clipping_primary(obj, false);
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
					var objEnemy = instance_create_depth(enemyX, enemyY, 1, o_enemy); //spawn enemy
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
		
		#endregion
		
		#region npc's
		
		//spawning animals
		var animalOdds = irandom(99);
		if(scr_checkR(bS,1, o_rabbit) || scr_checkR(bS, 1, o_squirrel)){
				miscOdds+=15;//if rabbits are in a 1 block distance increase odds to spawn by 15%	
			}
		if((animalOdds > 90)&&(spruce)){//spawn a single or couple squirrels
			ranX = irandom(bS-5);
			ranY = irandom(bS-5);
			
			var moreSquirrel = choose(2,2,1,1,1,1,1,1)
			while(moreSquirrel > 0){
				var obj = instance_create_depth(x+ranX, y+ranY, 1, o_squirrel); //spawn squirrel
				scr_clipping_secondary(obj, true);
				moreSquirrel--;
			}
			
		}
		
		if((animalOdds > 99) && (birch)){//spawn a rabbit HORDE
			
			//random x and y positions for the rabbit to spawn at in the square
			ranX=irandom(bS-5); //depends on size of rabbit in this case well say 6
			ranY=irandom(bS-5); 
			
			var moreRabbits = choose(3,3,3,2,2,2,2,2,2,1,1,1,1);
			while(moreRabbits > 0){
				var obj=instance_create_depth(x+ranX,y+ranY,1, o_rabbit); //spawn that rabbit
				scr_clipping_secondary(obj, true);
				moreRabbits--;
			}
		}
		
		#endregion
	
	x+=bS; // move on to next square
	//if x reaches its max
	if(x>=room_width){
		y+=bS;
		x=0;
	}
	
	
}

//change all remaining grass that should be cattail into cattail
with(o_grass){
	if(scr_checkR(bS,3,o_lake) || scr_checkR(bS,3,o_pond)){
		instance_create_depth(x,y,depth,o_cattail);
		instance_destroy(self);
	}
}

//show_debug_message("finished loading");
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

instance_destroy(self);

