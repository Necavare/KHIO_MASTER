if(setupActivation){
	
	//needs to set up in step since some things are not made yet when this is made
		
	ds_queue_enqueue(activationQueue, id);//o_generatorNStepNew
	ds_queue_enqueue(activationQueue, o_camera.id);
	ds_queue_enqueue(activationQueue, o_player.id);
	ds_queue_enqueue(activationQueue, o_shaders.id);
	ds_queue_enqueue(activationQueue, o_initializer.id);
	ds_queue_enqueue(activationQueue, o_weather.id);
	ds_queue_enqueue(activationQueue, o_hud.id);
	//ds_queue_enqueue(activationQueue, o_debugger.id);
	ds_queue_enqueue(activationQueue, o_input.id);


	setupActivation = false;
}

var bS = 16; // <- needs to be var? cus reasons dont ask
//var gridXSize = ds_grid_width(global.smallChunkGrid); <- no longer used but here for reference in case i 
//var gridYSize = ds_grid_height(global.smallChunkGrid);		come back to it for some reason

#region instanceActivateOffset 0

if(instanceActivateOffset == 0){
	/*
	o_player.isWalking = true;
	//make y dir and x dir always go "forward" so that you can rotate camera
	o_player.ydir = -1;
	if(o_player.y <= 150){
		var newYPos = 400+(150-o_player.y);
		var newYOffset = newYPos-o_player.y;
		o_player.y = newYPos;
		o_camera.y+=newYOffset;
	}*/
	//show_debug_message("y : "+string(y));
	//show_debug_message("x : "+string(x));
	//show_debug_message("--------------");


#region repeat section
repeat(800){
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
			
			#region misc elements
		
			//********************************
			//misc elements (trees, logs, stumps, etc.)
			//********************************
			//check if a large misc element has already taken up this slot
			//ensure you dont create something on the player (foundation are under player so doesnt matter)
				var miscOdds = irandom(99); // odds to create different objects
				//var treeOdds = irandom_range(1,2); // odds to get either spruce birch or pine
				//var treeOdds = 3;
				var treeOdds = 3;
				if(biomeArrayC == 2)
					treeOdds = 1;
				else if(biomeArrayC == 1)
					treeOdds = 2;
				else if(biomeArrayC == 0 || 3)
					treeOdds = 3;
			
			
			//if it can spawn at least one
			if(treeOdds < 3){
				if(collision_circle(x,y,bS, o_birch, true, true)||collision_circle(x,y,bS, o_birch_stump,true,true)
				||collision_circle(x,y,bS, o_spruce, true, true)||collision_circle(x,y,bS, o_spruce_stump,true,true)){
					miscOdds+=20;	
				}
				else if(collision_circle(x,y,bS*2, o_birch,true,true)||collision_circle(x,y,bS*2, o_birch_stump,true,true)||
						collision_circle(x,y,bS*2, o_spruce, true, true)||collision_circle(x,y,bS*2, o_spruce_stump, true,true)){
					miscOdds+=10; //increased odds of 10% when trees are within 2 squares
				}
			
				//odds of making a tree (10%)
				if(miscOdds>92 && !collision_circle(x,y, bS*2, o_house, true, true)){
				
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
					if(treeOdds==1){
						if(treeStatusOdds<70){//70% odds to make normal tree
							var objb1=instance_create_depth(x+ranX,y+ranY,1, o_birch); //spawn that tree
							ds_stack_push(objectStack, objb1);
							scr_clipping_secondary(objb1, false);
						}
						if(treeStatusOdds<80&&treeStatusOdds>=70){//10% odds to make stump
							var objbs=instance_create_depth(x+ranX,y+ranY,1,o_birch_stump);
							ds_stack_push(objectStack, objbs);
							scr_clipping_secondary(objbs, false);
						}
						if(treeStatusOdds<99&&treeStatusOdds>=80){//20% odds to make fallen tree (SYCH)
							//MORE ODDS TO MAKE NORMIE TREES
							var objbf = instance_create_depth(x+ranX,y+ranY,1,o_birch);
							ds_stack_push(objectStack, objbf);
							scr_clipping_secondary(objbf, false);
						}
						if(irandom(99)<50 && (spruce || birch)){
							var stickLen = irandom_range(6,10);
							var stickAng = irandom(360);
							var stickObj = instance_create_depth(x+lengthdir_x(stickLen, stickAng), y+lengthdir_y(stickLen, stickAng), 1, o_stick);
							if(birch && spruce)
								stickObj.type = choose(0,1,2,3);
							if(spruce)
								stickObj.type = choose(0,1);
							if(birch)
								stickObj.type = choose(2,3);
							
							ds_stack_push(objectStack, stickObj);
							scr_clipping_secondary(stickObj, false);
						}
					}
				
					//spruce
					if(treeOdds==2){
						if(treeStatusOdds<70){ //same odds as birch for all types, see above ^^^^^
							var nearestTree = instance_nearest(x+ranX, y+ranY, o_spruce);
							//make sure its not too close
							if((nearestTree == noone) || 20 < point_distance(x+ranX, y+ranY, nearestTree.x, nearestTree.y)){
								var objs1=instance_create_depth(x+ranX,y+ranY,1,o_spruce); //spawn that tree
								ds_stack_push(objectStack, objs1);
								scr_clipping_secondary(objs1, false);
							}
						}
						if(treeStatusOdds<80&&treeStatusOdds>=70){
							var objss=instance_create_depth(x+ranX,y+ranY,1,o_spruce_stump);
							ds_stack_push(objectStack, objss);
							scr_clipping_secondary(objss, false);	
						}
						if(treeStatusOdds<99&&treeStatusOdds>=80){
							var nearestTree2 = instance_nearest(x+ranX, y+ranY, o_spruce);
							//MORE ODDS TO MAKE NORMIE TREES
							//make sure its not too close
							if((nearestTree2 == noone) || 20 < point_distance(x+ranX, y+ranY, nearestTree2.x, nearestTree2.y)){
								var objsf=instance_create_depth(x+ranX,y+ranY,1,o_spruce); //spawn that tree
								ds_stack_push(objectStack, objsf);
								scr_clipping_secondary(objsf, false);
							}
						}
					}
				
						moreTrees--;
					}

				}

			}
				#endregion
			
		//*************************
		//*** generatorF stuff! ***
		//*************************
		
		
			#region foundational elements
		
			//***********************************************
			// foundation elements(only grass and lakes atm)
			//***********************************************
			var groundOdds = irandom(99);
		
			var grassPatch = false;
			//creating grass (20% with additional odds (30%) added with extra grass around)
			if(groundOdds>93){
			
				//check if theirs no grass or cattail in 1  block radius
				/*
				if(!scr_checkR( bS, 1, o_grass)||!scr_checkR(bS, 1, o_cattail)){
					grassPatch = true;//if no grass in a one block radius	
				}*/
				
				if(!collision_circle(x,y, bS, o_grass, true, true)||!collision_circle(x,y, bS, o_cattail,true, true)){
					grassPatch = true;//if no grass in a one block radius
				}
				if(irandom(99) > 70)
					grassPatch = false;
				var grassO = o_grass;
			
				//create the grass
				if(grassPatch){
					var g1 = instance_create_depth(x, y, 2, grassO);	
					var g2 = instance_create_depth(x+bS, y, 2, grassO);
					var g3 = instance_create_depth(x-bS, y, 2, grassO);
					var g4 = instance_create_depth(x, y-bS, 2, grassO);
					var g5 = instance_create_depth(x, y+bS, 2, grassO);
					//ds_stack_push(objStack, g1);
					//ds_stack_push(objStack, g2);
					//ds_stack_push(objStack, g3);
					//ds_stack_push(objStack, g4);
					//ds_stack_push(objStack, g5);
					
					scr_clipping_special(g1, false);
					scr_clipping_special(g2, false);
					scr_clipping_special(g3, false);
					scr_clipping_special(g4, false);
					scr_clipping_special(g5, false);
					//ds_queue_enqueue(activationQueue, g1,g2,g3,g4,g5);
					ds_stack_push(objectStack, g1);
					ds_stack_push(objectStack, g2);
					ds_stack_push(objectStack, g3);
					ds_stack_push(objectStack, g4);
					ds_stack_push(objectStack, g5);
				}
			
			
				//if creating lone grass choose wether its a bush and then create it
				else{
					var grassi = choose(1,2,3);
					if(grassi == 1){grassO = o_grass;}
					if(grassi == 2 || grassi == 3){grassO = o_bush;}
					if(grassi == 4){grassO = o_big_bush;}
					//grassO = choose(o_grass,o_bush, o_bush, o_big_bush);
					
					var g6 = instance_create_depth(x,y,2, grassO);
					if(grassi > 1)
						g6.image_angle = irandom(360);
					//ds_stack_push(objStack, g6);
					scr_clipping_special(g6, false);
					//ds_queue_enqueue(activationQueue, g6);
					ds_stack_push(objectStack, g6);
				}
			}
	
		
			#endregion
			
			#region misc elements
		
			//********************************
			//misc elements (rocks, flowers, etc.)
			//********************************
			//check if a large misc element has already taken up this slot
			//ensure you dont create something on the player (foundation are under player so doesnt matter)
				var miscOdds = irandom(99); // odds to create different objects
				
				//odds of making a rock
				var rockOdds=1;
				//if their are rocks nearby increase likelyhood of making a rock
				//if(scr_checkR(bS, 4, o_rocks)||scr_checkR(bS, 4, o_rock))
				if(collision_circle(x,y,bS*4, o_rocks, true, true)||collision_circle(x,y,bS*4, o_rock, true, true))
					rockOdds+=2;
				if(collision_circle(x,y,bS*3, o_bigrock, true, true))
					rockOdds+=30;
				if(collision_circle(x,y,bS, o_bigrock, true, true))
					rockOdds+=40;
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
							//ds_stack_push(objStack, objr1);
							
							//was secondary
							scr_clipping_special(objr1, false);
							ds_stack_push(objectStack, objr1);
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
						//ds_stack_push(objStack, objr2);
						
						//was primary
						scr_clipping_special(objr2, false);
						ds_stack_push(objectStack, objr2);
						
					}
				}
				//flowers
				//10% chance put between the max chance the rock can have so it doesnt messs with it
				else if((miscOdds>=95)&&(miscOdds<96)&&birch){
					var moreFlowers = choose(2,2,1,1,1,0,0,0); //choose wether to make 3,2 or 1 flowers per square
					while(moreFlowers >= 0){
							var ranFX = irandom(bS); //size of lily of the vally 8x9
							var ranFY = irandom(bS);
							var objflower=instance_create_depth(x+ranFX,y+ranFY,1,o_lillyofthevalley);
							//ds_stack_push(objStack, objflower);
							
							//was primary
							scr_clipping_special(objflower, false);
							ds_stack_push(objectStack, objflower);
							moreFlowers--;
						}
				}
				
				#endregion

			#region npc's
		
			//spawning animals
			var animalOdds = irandom(99);
			//if(scr_checkR(bS,1, o_rabbit) || scr_checkR(bS, 1, o_squirrel)){
			if(collision_circle(x,y,bS, o_rabbit, true,true) || collision_circle(x,y,bS, o_squirrel, true, true)){
				miscOdds+=15;//if rabbits are in a 1 block distance increase odds to spawn by 15%	
			}
			if((animalOdds > 98)&&(spruce)){//spawn a single or couple squirrels
				ranX = irandom(bS-5);
				ranY = irandom(bS-5);
			
				var moreSquirrel = choose(2,2,1,1,1,1,1,1)
				while(moreSquirrel > 0){
					var objSquirrel = instance_create_depth(x+ranX, y+ranY, 1, o_squirrel); //spawn squirrel
					scr_clipping_secondary(objSquirrel, true);
					ds_stack_push(objectStack, objSquirrel);
					moreSquirrel--;
				}
			
			}
		
			if((animalOdds > 99) && (birch)){//spawn a rabbit HORDE
			
				//random x and y positions for the rabbit to spawn at in the square
				ranX=irandom(bS-5); //depends on size of rabbit in this case well say 6
				ranY=irandom(bS-5); 
			
				var moreRabbits = choose(3,3,3,2,2,2,2,2,2,1,1,1,1);
				while(moreRabbits > 0){
					var objRabbit=instance_create_depth(x+ranX,y+ranY,1, o_rabbit); //spawn that rabbit
					scr_clipping_secondary(objRabbit, true);
					ds_stack_push(objectStack, objRabbit);
					moreRabbits--;
				}
			}
		
			#endregion
			
			
		//add everything to a ds grid
		
		
		//var listCol = ds_list_create();
		//instance_place_list(x,y,all,listCol, false);
		//ds_grid_add(global.smallChunkGrid, (x-500)/16, y/16, listCol);
		//var num = instance_place_list(x, y, all , listCol, false);
		//for (var chunki = 0; chunki < num; chunki++){
			//ds_grid_add(global.smallChunkGrid, (x-500)/16, y/16, listCol[| chunki]);
		//}
		
			
		x+=bS; // move on to next square
		//if x reaches its max (offset of 500)
		
		if(x>=(room_width+500)){
				//enque the active list
				
				while(!ds_queue_empty(floorQueue) && (ds_queue_head(floorQueue).y < (y+250))){
					//enque the active que with the value and remove it from normal queue
					ds_queue_enqueue(floorActiveQueue, ds_queue_dequeue(floorQueue));
				}
			
				//deque the active list
				while(!ds_queue_empty(floorActiveQueue) && (ds_queue_head(floorActiveQueue).y < (y-250))){
					ds_queue_dequeue(floorActiveQueue);
				}
				//enque the active list
				while(!ds_queue_empty(floorHouseQueue) && (ds_queue_head(floorHouseQueue).y < (y+250))){
					ds_queue_enqueue(floorActiveHouseQueue, ds_queue_dequeue(floorHouseQueue));
				}
			
				//deque the active list
				while(!ds_queue_empty(floorActiveHouseQueue) && (ds_queue_head(floorActiveHouseQueue).y < (y-250))){
					ds_queue_dequeue(floorActiveHouseQueue);
				}
			
				//initialization
				//show_debug_message("x: "+string(x));
				//show_debug_message("y: "+string(y));
				instance_deactivate_all(true);
				//instance_activate_object(o_lake);
				//instance_activate_object(o_pond);
				//instance_activate_object(o_house_floor);
				//instance_activate_object(o_shed_floor);
				instance_activate_object(bigLakePointer);
				
				var sizeFQ = ds_queue_size(floorActiveQueue);
				for(var fqv = 0; fqv < sizeFQ; fqv++ ){
					var floorActiveInst = ds_queue_dequeue(floorActiveQueue);
					instance_activate_object(floorActiveInst);
					ds_queue_enqueue(floorActiveQueue, floorActiveInst);
				}
			
				var sizeFHQ = ds_queue_size(floorActiveHouseQueue);
				for(var fhqv = 0; fhqv < sizeFHQ; fhqv++){
					var floorActiveHouseInst = ds_queue_dequeue(floorActiveHouseQueue);
					instance_activate_object(floorActiveHouseInst);
					ds_queue_enqueue(floorActiveHouseQueue, floorActiveHouseInst);
				}
			
				//replaces the commented out section below
				var sizeAQ = ds_queue_size(activationQueue);
				for(var queV = 0; queV < sizeAQ; queV++){
					var queueID = ds_queue_dequeue(activationQueue);
					//show_debug_message("activating: "+string(object_get_name(queueID.object_index)));
					instance_activate_object(queueID);
					ds_queue_enqueue(activationQueue, queueID);
				}
				/*
				instance_activate_object(o_camera);
				instance_activate_object(o_generatorNStepNew);
				instance_activate_object(o_player);
				instance_activate_object(o_shaders);	
				instance_activate_object(o_initializer);
				instance_activate_object(o_weather);
				instance_activate_object(o_hud);
				instance_activate_object(o_debugger);
				instance_activate_object(o_input);
				*/
				//activate the first section
				instance_activate_layer(loadingLayerId);
				instance_activate_object(o_footprint);
				
			
			//instance_activate_region(-1,-1, 525,525, true);//activate loading section
			//instance_activate_region(x, y-250, room_width, y+250, true);
				
			
			
			
			//deactivationStep = 0;
			//}
			//else
			//	deactivationStep++;
			
			
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


repeat(100){
if(!ds_stack_empty(objectStack)){
	var instId = ds_stack_pop(objectStack);
	instance_activate_object(instId);
	
	with(instId){
		x-=500;
		
		/*
		
		legacy code from a bad method, but maybe ill come back to it
		
		//add its id to the list within the proper small (16x16) chunk block
		var floorX = floor(x/16);
		var floorY = floor(y/16);
		if(floorX >= gridXSize){floorX = floorX-gridXSize;}
		else if(floorX < 0){floorX = gridXSize+floorX;}
		if(floorY >= gridYSize){floorY = floorY-gridYSize;}
		else if(floorY < 0){floorY = gridYSize+floorY;}
		ds_list_add(ds_grid_get(global.smallChunkGrid, floorX, floorY) , id);
		*/
		
		
		if(object_index == o_wall_wood){
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
		else if(object_index == o_shed_roof){
			//create a minimap version (dont do it while dynamically generating tho)=	
			//take into account room shift
			nxShed = x+lengthdir_x(27,-camera_get_view_angle(view_camera[0])+90);
			nyShed = y+lengthdir_y(27,-camera_get_view_angle(view_camera[0])+90);


			
			//dxShed = nxShed+lengthdir_x(16, -camera_get_view_angle(view_camera[0])+90);
			if (nyShed < 0) { nyShed += room_height; }
			if (nyShed >= room_height) { nyShed -= room_height; }
			if (nxShed < 0) { nxShed += room_width; }
			if (nxShed >= room_width) { nxShed -= room_width; }
			
			dyShed = nyShed;
			//if(image_angle >90 && image_angle < 270){
				dyShed = nyShed+lengthdir_y(-64, -camera_get_view_angle(view_camera[0])+90);
			//}
			/*
			dyShed = nyShed+lengthdir_y(16, image_angle+90);
			if (dyShed < 0) { dyShed += room_height; }
			if (dyShed >= room_height) { dyShed -= room_height; }
			*/

			miniValuesShed[0] = sprite_index; //set sprite for minimap
			miniValuesShed[1] = image_angle; //set angle of rotation
			miniValuesShed[2] = nxShed; //x position
			miniValuesShed[3] = nyShed; //y position
			miniValuesShed[4] = dyShed; //general depth, some objects can set this to 0 or other small number if bottom layer

			ds_map_add(global.minimapVar, id, miniValuesShed);
			ds_list_add(global.activemm, id); //add it to list of active minimap symbols
		}
		else if(object_index == o_house_roof){
			//create a minimap version (dont do it while dynamically generating tho)=	
			//take into account room shift
			nxHouse = x+lengthdir_x(38,-camera_get_view_angle(view_camera[0])+90);
			nyHouse = y+lengthdir_y(38,-camera_get_view_angle(view_camera[0])+90);
        
			if (nyHouse < 0) { nyHouse += room_height; }
			if (nyHouse >= room_height) { nyHouse -= room_height; }
			if (nxHouse < 0) { nxHouse += room_width; }
			if (nxHouse >= room_width) { nxHouse -= room_width; }

			dyHouse = nyHouse;
			//if(image_angle >90 && image_angle < 270){
				//dyHouse = nyHouse+lengthdir_y(4, view_camera[0])+lengthdir_y(-66, -camera_get_view_angle(view_camera[0])+90);
				dyHouse = nyHouse+lengthdir_y(4, view_camera[0])+lengthdir_y(-99, -camera_get_view_angle(view_camera[0])+90);
				if (dyHouse < 0) { dyHouse += room_height; }
				if (dyHouse >= room_height) { dyHouse -= room_height; }
			//}
			
			/*
			dyHouse = nyHouse-lengthdir_y(4,image_angle)+lengthdir_y(33, image_angle+90);
			if (dyHouse < 0) { dyHouse += room_height; }
			if (dyHouse >= room_height) { dyHouse -= room_height; }
			*/
				
			miniValuesHouse[0] = sprite_index; //set sprite for minimap
			miniValuesHouse[1] = image_angle; //set angle of rotation
			miniValuesHouse[2] = nxHouse; //x position
			miniValuesHouse[3] = nyHouse; //y position
			miniValuesHouse[4] = dyHouse; //general depth, some objects can set this to 0 or other small number if bottom layer

			ds_map_add(global.minimapVar, id, miniValuesHouse);
			ds_list_add(global.activemm, id); //add it to list of active minimap symbols
		}
		else if(object_index == o_digmound){
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
			if((object_index == o_lake) || (object_index == o_pond) || (object_index == o_pond2)){
				dy = 1;		
				//scr_checkWrap(id, 1);
			}
		
			miniValues[0] = sprite_index; //set sprite for minimap
			miniValues[1] = image_angle; //set angle of rotation
			miniValues[2] = nx; //x position
			miniValues[3] = ny; //y position
			miniValues[4] = dy; //general depth, some objects can set this to 0 or other small number if bottom layer
		
			ds_map_add(global.minimapVar, id, miniValues);
			ds_list_add(global.activemm, id); //add it to list of active minimap symbols
			
			ds_list_add(global.moundTypeList, 0);
			ds_list_add(global.moundXList, x);
			ds_list_add(global.moundYList, y);
			ds_list_add(global.moundPointerList, id);
			
			o_generatorNStepNew.moundNum++;
		}
		else if((object_get_parent(object_index)==par_3d_object || object_get_parent(object_index)==par_flammable)&&(object_index != o_firepit)&&(object_index!=o_rabbit)&&(object_index!=o_squirrel)&&(object_index!=o_stick)){
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
			if((object_index == o_lake) || (object_index == o_pond) || (object_index == o_pond2)){
				dy = 1;		
				//scr_checkWrap(id, 1);
			}
		
			miniValues[0] = sprite_index; //set sprite for minimap
			miniValues[1] = image_angle; //set angle of rotation
			miniValues[2] = nx; //x position
			miniValues[3] = ny; //y position
			miniValues[4] = dy; //general depth, some objects can set this to 0 or other small number if bottom layer
		
			ds_map_add(global.minimapVar, id, miniValues);
			ds_list_add(global.activemm, id); //add it to list of active minimap symbols
		}
		else if (object_index == o_firepit){
			if(isBloomery < 32){
				//copy paste from par_3d_object  create to do minimap stuff
				//take into account room shift
				//var nx = x+global.xoffset;
				//var ny = y+global.yoffset;
		
		        nx2 = x;
				ny2 = y;
		
				if (ny2 < 0) { ny2 += room_height; }
				if (ny2>= room_height) { ny2 -= room_height; }
				if (nx2 < 0) { nx2 += room_width; }
				if (nx2 >= room_width) { nx2 -= room_width; }

				dy2 = ny2;
		
				miniValues2[0] = sprite_index; //set sprite for minimap
				miniValues2[1] = image_angle; //set angle of rotation
				miniValues2[2] = nx2; //x position
				miniValues2[3] = ny2; //y position
				miniValues2[4] = dy2; //general depth, some objects can set this to 0 or other small number if bottom layer
		
				ds_map_add(global.minimapVar, id, miniValues2);
				ds_list_add(global.activemm, id); //add it to list of active minimap symbols
			}
			else{
				show_debug_message("replacing bloomery");
				nx3 = x;
				ny3 = y;
		
				if (ny3 < 0) { ny3 += room_height; }
				if (ny3>= room_height) { ny3 -= room_height; }
				if (nx3 < 0) { nx3 += room_width; }
				if (nx3 >= room_width) { nx3 -= room_width; }
				
				var miniValuesNWater;
				miniValuesNWater[0] = s_bloomery_4; //set sprite for minimap
				miniValuesNWater[1] = image_angle; //set angle of rotation
				miniValuesNWater[2] = x; //x position
				miniValuesNWater[3] = y; //y position
				miniValuesNWater[4] = y;
				ds_map_add(global.minimapVar, id, miniValuesNWater);
				ds_list_add(global.activemm, id);
			
			}
		}
		else if (object_index == o_tower || object_index == o_tower_roof){
			//create a minimap version (dont do it while dynamically generating tho)=	
			//take into account room shift
			nxTower = x+lengthdir_x(26,-camera_get_view_angle(view_camera[0])+90);
			nyTower = y+lengthdir_y(26,-camera_get_view_angle(view_camera[0])+90);
			//var xx = x+lengthdir_x(z+i,-camera_get_view_angle(view_camera[0])+90);
			//var yy = y+lengthdir_y(z+i,-camera_get_view_angle(view_camera[0])+90);

			
			//dxShed = nxShed+lengthdir_x(16, -camera_get_view_angle(view_camera[0])+90);
			if (nyTower < 0) { nyTower += room_height; }
			if (nyTower >= room_height) { nyTower -= room_height; }
			if (nxTower < 0) { nxTower += room_width; }
			if (nxTower >= room_width) { nxTower -= room_width; }

			miniValuesTower[0] = sprite_index; //set sprite for minimap
			miniValuesTower[1] = image_angle; //set angle of rotation
			miniValuesTower[2] = nxTower; //x position
			miniValuesTower[3] = nyTower; //y position
			miniValuesTower[4] = nyTower; //general depth, some objects can set this to 0 or other small number if bottom layer

			ds_map_add(global.minimapVar, id, miniValuesTower);
			ds_list_add(global.activemm, id); //add it to list of active minimap symbols
		}else if(object_index == o_snow_texture){
			//copy paste from par_3d_object  create to do minimap stuff
			//take into account room shift
			//var nx = x+global.xoffset;
			//var ny = y+global.yoffset;
		
	        nx_t = x;
			ny_t = y;
		
			if (ny_t < 0) { ny_t += room_height; }
			if (ny_t >= room_height) { ny_t -= room_height; }
			if (nx_t < 0) { nx_t += room_width; }
			if (nx_t >= room_width) { nx_t -= room_width; }

			dy_t = 0;
				//scr_checkWrap(id, 1);
		
			miniValues_t[0] = sprite_index; //set sprite for minimap
			miniValues_t[1] = image_angle; //set angle of rotation
			miniValues_t[2] = nx_t; //x position
			miniValues_t[3] = ny_t; //y position
			miniValues_t[4] = dy_t; //general depth, some objects can set this to 0 or other small number if bottom layer
		
			ds_map_add(global.minimapVar, id, miniValues_t);
			ds_list_add(global.activemm, id); //add it to list of active minimap symbols
		}
	
	}//with(inst)
	
	instance_deactivate_object(instId);// deactivate once its done with it

}//if statement
}//repeat section



	if(ds_stack_empty(objectStack)){
		//move all objects that are not moved by the above code
		//namely the peices of the tower
		//(NOT ANYMORE)
		
		instanceActivateOffset = 2;
	}

}
#endregion

#region instanceActivateOffset 2
miniValues[0]=0;
if(y >room_height && instanceActivateOffset == 2){


	//remove all loading elements
	var loadLayerId = layer_get_id("loadingLayer");
	with(all){
		if(layer == loadLayerId)
			instance_destroy(self);
	}	
	
	instanceActivateOffset = 3;
	
	//*********************************************************
	//stuff to clear out map blocks and debug messages for it!
	//*********************************************************
	with(o_hud){
		//show_debug_message("minimapVar size: "+string((global.minimapVar)));
		show_debug_message("activemm size"+string(ds_list_size(global.activemm)));
		show_debug_message("creating map blocks");
		//only clear out the array as all false when the game first starts
		scr_clear_update(global.blockUpdateArr);

		//initiate the sprites (ugh idk what else can be done here tho)
		// and add them to the array
		show_debug_message("mapWidth : "+string(mapWidth));
		show_debug_message("mapHeight : "+string(mapHeight));
		
		show_debug_message("blockXNum : "+string(global.blockXNum));
		show_debug_message("blockYNum : "+string(global.blockYNum));
	}
	
	instance_deactivate_all(true);
	//replaces the commented out section below
	var sizeAQ = ds_queue_size(activationQueue);
	for(var queV = 0; queV < sizeAQ; queV++){
		var queueID = ds_queue_dequeue(activationQueue);
		//show_debug_message("activating: "+string(object_get_name(queueID.object_index)));
		instance_activate_object(queueID);
		ds_queue_enqueue(activationQueue, queueID);
	}
	/*
	instance_activate_object(o_camera);
	instance_activate_object(o_generatorNStepNew);
	instance_activate_object(o_player);
	instance_activate_object(o_shaders);	
	instance_activate_object(o_initializer);
	instance_activate_object(o_weather);
	instance_activate_object(o_hud);
	instance_activate_object(o_debugger);
	instance_activate_object(o_input);*/
			
	//activate the first section
	//instance_activate_region(-1,-1, 525,525, true);//activate loading section
	//instance_activate_region(x, y-250, room_width, y+250, true);
	
	
}
#endregion

#region instanceActivateOffset = 3
if(y >room_height && instanceActivateOffset == 3){
	//generate one map block
	
	//mapBlockCurrent
	
	repeat(40){
		var mapBlockCurrent = mapBlock;
		with(o_hud){
		//array of all blocks of minimaps
			//if(global.isDev){
				#region filling the array, old fashioned way
	
				var iv = 0;
				//var tim1 = get_timer();
				//************************
				//      normal loop
				//************************
				var iv = 0;
				//find the bx and by values from the i value
				for(var bx2 = 0; bx2 < global.blockXNum; bx2++){
					for(var by2 = 0; by2 < global.blockYNum; by2++){
						if(iv == mapBlockCurrent){
							var	blockSpr = scr_create_map_block(bx2,by2, mapWidth, mapHeight);
							ds_list_set(global.blockUpdateHistory, iv, true);
							//var blockSpr = scr_create_blank_block(bx2, by2, mapWidth, mapHeight);
							global.blockArr[iv] = blockSpr;
							//show_debug_message("block"+string(iv));
						}
						//draw_sprite(global.blockArr[iv], 0 , bx*(blockWidthmm), by*(blockHeightmm));
						iv++;
					}
				}
			
				//var tim2 = get_timer();
			
				//show_debug_message("map create time: "+string(tim2-tim1));
			#endregion	
			//}
			//else{
				#region filling the array with blank block sprites (commented out)
				/*
				var iv = 0;
				//var tim1 = get_timer();
				//************************
				//      normal loop
				//************************
				var iv = 0;
				//find the bx and by values from the i value
				for(var bx2 = 0; bx2 < global.blockXNum; bx2++){
					for(var by2 = 0; by2 < global.blockYNum; by2++){
						if(iv == mapBlockCurrent){
							var blockSpr = scr_create_blank_block(bx2, by2, mapWidth, mapHeight);
							//var blockSpr = scr_create_blank_block(bx2, by2, mapWidth, mapHeight);
							global.blockArr[iv] = blockSpr;
							//show_debug_message("block"+string(iv));
						}
						//draw_sprite(global.blockArr[iv], 0 , bx*(blockWidthmm), by*(blockHeightmm));
						iv++;
					}
				}*/
				#endregion
			//}
		}
		mapBlock+=1;
		if(mapBlock == (global.blockXNum*global.blockYNum)){
				show_debug_message("finished loading");
				//if creating initial map create the initial map
	
				//it is no longer generating environment
				global.generatingEnvironment=false;
				//global.generatingGrass = false;
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

				//var mapWidth = o_hud.mapWidth;
				//var mapHeight = o_hud.mapHeight;
				
				//just save here so that it has a base save state
				//save_createNew(global.currentFile);
				global.canMove = false;
				global.loading = false;
				o_player.x = room_width/2;
				o_player.y = room_height/2;
				//scr_clipping_primary(o_player, false);
				o_camera.x = room_width/2;
				o_camera.y = room_height/2;
				global.xoffset = 0;
				global.yoffset = 0;	
				
				instance_destroy(self);
		}
	}
}
#endregion

#region instanceActivateOffset 0, sets activate 1 and activates all
if((y > room_height) && instanceActivateOffset == 0){//load up all active instances for the last fixes
	instanceActivateOffset = 1;
	
	instance_deactivate_all(true);
	
	//replaces the commented out section below
				var sizeAQ = ds_queue_size(activationQueue);
				for(var queV = 0; queV < sizeAQ; queV++){
					var queueID = ds_queue_dequeue(activationQueue);
					//show_debug_message("activating: "+string(object_get_name(queueID.object_index)));
					instance_activate_object(queueID);
					ds_queue_enqueue(activationQueue, queueID);
				}
				
	/*
	instance_activate_object(o_camera);
	instance_activate_object(o_generatorNStepNew);
	instance_activate_object(o_player);
	instance_activate_object(o_shaders);	
	instance_activate_object(o_initializer);
	instance_activate_object(o_weather);
	instance_activate_object(o_hud);
	instance_activate_object(o_debugger);
	instance_activate_object(o_input);
	*/
	
	//activate the first section
	instance_activate_layer(loadingLayerId);
	instance_activate_object(o_footprint);
	//instance_activate_region(-1,-1, 525,525, true);//activate loading section
}
#endregion

