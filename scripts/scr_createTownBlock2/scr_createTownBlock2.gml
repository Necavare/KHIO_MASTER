/// scr_createTownBlock2(startingX, startingY, wallAngle, townAngle, angleOffset, spawnAnvil, spawnBloomery)
/// @description creates town block so i dont need to repeat the code
/// @param startingX
/// @param startingY
/// @param wallAngle
/// @param townAngle
/// @param angleOffset
/// @param spawnAnvil
/// @param spawnBloomery
function scr_createTownBlock2(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	//64 is highest size possible for a wall
	//with 32 being its center
					
	var roadX = argument0;
	var roadY = argument1;
	var wallAngle = argument2;
	var townAngle = argument3;
	var angleOffset = argument4;
	var spawnAnvil = argument5;
	var spawnBloomery = argument6;
	var treeSelected = -1;

	//when its compoundBool set height to 6 and width to 4, thats the only difference.


	var offsetFlip = false;
	if(angleOffset > 0)
			offsetFlip = true;

	var wallNum = 0;
	var wallArr = array_create(20, false);
	//find the walls that will exist

	for(var iW = 0; iW < 20; iW++){
		if(irandom(99)<80){
			wallArr[iW] = true;
			wallNum++;
		}if(iW >= 15 && wallNum < 5){
			wallArr[iW] = true;
			wallNum++;	
		}
	}


	var cenX = roadX+lengthdir_x(100, townAngle+angleOffset)+lengthdir_x(64, townAngle+angleOffset);
	var cenY = roadY+lengthdir_y(100, townAngle+angleOffset)+lengthdir_y(64, townAngle+angleOffset);

	if(spawnAnvil){
		var anvilLen = irandom_range(0,55);
		var anvilAng = irandom(360);
		var anvilX = cenX+lengthdir_x(anvilLen, anvilAng);
		var anvilY = cenY+lengthdir_y(anvilLen, anvilAng);
		var anvilInst = instance_create_depth(anvilX, anvilY, 1, o_anvil);
		ds_stack_push(objectStack, anvilInst);
	}

	if(spawnBloomery){
		var bloomeryLen = irandom_range(0,40-17);
		var bloomeryAng = irandom(360);
		var bloomeryX = cenX+lengthdir_x(bloomeryLen, bloomeryAng);
		var bloomeryY = cenY+lengthdir_y(bloomeryLen, bloomeryAng);
		var bloomeryInst = instance_create_depth(bloomeryX, bloomeryY, 1, o_firepit);
		bloomeryInst.isBloomery = 32;
		ds_stack_push(objectStack, bloomeryInst);
		ds_queue_enqueue(activationQueue, bloomeryInst);

		//spawn old man out front
		var oldManAng = irandom(360);
		var oldManX = bloomeryX+lengthdir_x(12, oldManAng);
		var oldManY = bloomeryY+lengthdir_y(12, oldManAng);
		var oldManInst = instance_create_depth(oldManX, oldManY, 1, o_friendly_oldman);
		ds_stack_push(objectStack, oldManInst);
	
		//spawn all walls and set one to trees
		treeSelected = choose(0,1,2,3,4,5,6,7);
		for(var iW2 = 0; iW2 < 8; iW2++){
			wallArr[iW2] = true;
		}
		wallNum = 8;
	
	}

	if(!spawnBloomery && !spawnAnvil && irandom(99) < 20){
		var trappedChest = instance_create_depth(cenX, cenY, 1, o_trapped_crate);
		trappedChest.image_angle = townAngle;
		ds_stack_push(objectStack, trappedChest);
	
		//spawn grass
		var grassT = instance_create_depth(cenX+lengthdir_x(14, townAngle-90), cenY+lengthdir_y(14, townAngle-90), 1, o_grass);
		var grassR = instance_create_depth(cenX+lengthdir_x(14, townAngle), cenY+lengthdir_y(14, townAngle), 1, o_grass);
		var grassB = instance_create_depth(cenX+lengthdir_x(14, townAngle+90), cenY+lengthdir_y(14, townAngle), 1, o_grass);
		var grassL = instance_create_depth(cenX+lengthdir_x(14, townAngle+180), cenY+lengthdir_y(14, townAngle+180), 1, o_grass);
		grassT.image_angle = townAngle;
		grassR.image_angle = townAngle;
		grassB.image_angle = townAngle;
		grassL.image_angle = townAngle;
	
		ds_stack_push(objectStack, grassT, grassR, grassB, grassL);
	
	}

	//parrallel to road
	//var wallLen = 25;
	var wallX_1 = roadX+lengthdir_x(100,townAngle+angleOffset);
	var wallY_1 = roadY+lengthdir_y(100,townAngle+angleOffset);

	if(wallArr[0]){
		var wallAng0 = choose(0, 180);
		var wall0 = choose(o_con_wall, o_con_tall_wall);
	
			if(!wallArr[2]){
				wall0 = o_con_wall_broken;
				wallAng0 = 0;
				/*
				if(offsetFlip)
					wallAng0 = 180;*/
			}
			if(!wallArr[1]){
				wall0 = o_con_wall_broken;
				wallAng0 = 180;
				/*
				if(offsetFlip)
					wallAng0 = 0;*/
			}
			if(wallArr[1] && wallArr[2])
				wall0 = o_con_tall_wall;	
			var wallInst_1 = instance_create_depth(wallX_1, wallY_1, 1, wall0);
			ds_queue_enqueue(activationQueue, wallInst_1);
			ds_stack_push(objectStack, wallInst_1);
			wallInst_1.image_angle = wallAngle + wallAng0;
	
			//if the top is existent
			//add corner value
			if(wallArr[4]){
				var cornerInst1 = instance_create_depth(wallX_1+lengthdir_x(27, townAngle+180), wallY_1+lengthdir_y(27, townAngle+180), 1, o_con_wall_corner);
				ds_stack_push(objectStack, cornerInst1);
				cornerInst1.image_angle = wallAngle-90;
			}
	
	
	}


	//another one parallel to road
	//second one parallel
	if(wallArr[1]){
		var wallAng1 = choose(0, 180);
		var wall1 = choose(o_con_wall, o_con_tall_wall);
	
		var wallX_1_2 = roadX+lengthdir_x(54, townAngle)+lengthdir_x(100,townAngle+angleOffset);
		var wallY_1_2 = roadY+lengthdir_y(54, townAngle)+lengthdir_y(100,townAngle+angleOffset);
	
			if(!wallArr[6]){
				wall1 = o_con_wall_broken;
				wallAng1 = 180;
				/*
				if(offsetFlip)
					wallAng1 = 0;*/
			}
			if(!wallArr[0]){
				wall1 = o_con_wall_broken;
				wallAng1 = 0;
				/*
				if(offsetFlip)
					wallAng1 = 180;*/
			}
			if(wallArr[0] && wallArr[6])
				wall1 = o_con_tall_wall;
			//var wallX_1_2 = roadX+lengthdir_x(54, townAngle)+lengthdir_x(100,townAngle+angleOffset);
			//var wallY_1_2 = roadY+lengthdir_y(54, townAngle)+lengthdir_y(100,townAngle+angleOffset);
			var wallInst_1_2 = instance_create_depth(wallX_1_2, wallY_1_2, 1, wall1);
			ds_queue_enqueue(activationQueue, wallInst_1_2);
			ds_stack_push(objectStack, wallInst_1_2);
			wallInst_1_2.image_angle = wallAngle+wallAng1;

			//if the bottom is existent
			//add corner value
			/*
			if(wallArr[2]){
				var cornerInst2 = instance_create_depth(wallX_1+lengthdir_x(80, townAngle), wallY_1+lengthdir_y(80, townAngle), 1, o_wall_corner);
				ds_stack_push(objectStack, cornerInst2);
				cornerInst2.image_angle = wallAngle;
			}*/
	
	}

	//third parralell
	if(wallArr[2]){
		var wallAng2 = choose(0, 180);
		var wall2 = choose(o_con_wall, o_con_tall_wall);
	
		var wallX_2 = roadX+lengthdir_x(54+54, townAngle)+lengthdir_x(100,townAngle+angleOffset);
		var wallY_2 = roadY+lengthdir_y(54+54, townAngle)+lengthdir_y(100,townAngle+angleOffset);
	
			if(!wallArr[0]){
				wall2 = o_con_wall_broken;
				wallAng2 = 180;
				/*
				if(offsetFlip)
					wallAng1 = 0;*/
			}
			if(!wallArr[1]){
				wall2 = o_con_wall_broken;
				wallAng2 = 0;
				/*
				if(offsetFlip)
					wallAng1 = 180;*/
			}
			if(wallArr[0] && wallArr[1])
				wall2 = o_con_tall_wall;
			//var wallX_1_2 = roadX+lengthdir_x(54, townAngle)+lengthdir_x(100,townAngle+angleOffset);
			//var wallY_1_2 = roadY+lengthdir_y(54, townAngle)+lengthdir_y(100,townAngle+angleOffset);
			var wallInst_2 = instance_create_depth(wallX_2, wallY_2, 1, wall2);
			ds_queue_enqueue(activationQueue, wallInst_2);
			ds_stack_push(objectStack, wallInst_2);
			wallInst_2.image_angle = wallAngle+wallAng2;

			//if the bottom is existent
			//add corner value
			/*
			if(wallArr[2]){
				var cornerInst2 = instance_create_depth(wallX_1+lengthdir_x(80, townAngle), wallY_1+lengthdir_y(80, townAngle), 1, o_wall_corner);
				ds_stack_push(objectStack, cornerInst2);
				cornerInst2.image_angle = wallAngle;
			}*/
	}

	//fourth parralell
	if(wallArr[3]){
		var wallAng3 = choose(0, 180);
		var wall3 = choose(o_con_wall, o_con_tall_wall);
	
		var wallX_3 = roadX+lengthdir_x(54+54+54, townAngle)+lengthdir_x(100,townAngle+angleOffset);
		var wallY_3 = roadY+lengthdir_y(54+54+54, townAngle)+lengthdir_y(100,townAngle+angleOffset);
	
			if(!wallArr[1]){
				wall3 = o_con_wall_broken;
				wallAng3 = 180;
				/*
				if(offsetFlip)
					wallAng1 = 0;*/
			}
			if(!wallArr[2]){
				wall3 = o_con_wall_broken;
				wallAng3 = 0;
				/*
				if(offsetFlip)
					wallAng1 = 180;*/
			}
			if(wallArr[1] && wallArr[2])
				wall3 = o_con_tall_wall;
			//var wallX_1_2 = roadX+lengthdir_x(54, townAngle)+lengthdir_x(100,townAngle+angleOffset);
			//var wallY_1_2 = roadY+lengthdir_y(54, townAngle)+lengthdir_y(100,townAngle+angleOffset);
			var wallInst_3 = instance_create_depth(wallX_3, wallY_3, 1, wall3);
			ds_queue_enqueue(activationQueue, wallInst_3);
			ds_stack_push(objectStack, wallInst_3);
			wallInst_3.image_angle = wallAngle+wallAng3;

			//if the bottom is existent
			//add corner value
			/*
			if(wallArr[2]){
				var cornerInst2 = instance_create_depth(wallX_1+lengthdir_x(80, townAngle), wallY_1+lengthdir_y(80, townAngle), 1, o_wall_corner);
				ds_stack_push(objectStack, cornerInst2);
				cornerInst2.image_angle = wallAngle;
			}*/
	}

	//fith parrallel
	if(wallArr[4]){
		var wallAng4 = choose(0, 180);
		var wall4 = choose(o_con_wall, o_con_tall_wall);
	
		var wallX_4 = roadX+lengthdir_x(54+54+54+54, townAngle)+lengthdir_x(100,townAngle+angleOffset);
		var wallY_4 = roadY+lengthdir_y(54+54+54+54, townAngle)+lengthdir_y(100,townAngle+angleOffset);
	
			if(!wallArr[10]){
				wall4 = o_con_wall_broken;
				wallAng4 = 180;
				/*
				if(offsetFlip)
					wallAng1 = 0;*/
			}
			if(!wallArr[5]){
				wall4 = o_con_wall_broken;
				wallAng4 = 0;
				/*
				if(offsetFlip)
					wallAng1 = 180;*/
			}
			if(wallArr[10] && wallArr[5])
				wall4 = o_con_tall_wall;
			//var wallX_1_2 = roadX+lengthdir_x(54, townAngle)+lengthdir_x(100,townAngle+angleOffset);
			//var wallY_1_2 = roadY+lengthdir_y(54, townAngle)+lengthdir_y(100,townAngle+angleOffset);
			var wallInst_4 = instance_create_depth(wallX_4, wallY_4, 1, wall4);
			ds_queue_enqueue(activationQueue, wallInst_4);
			ds_stack_push(objectStack, wallInst_4);
			wallInst_4.image_angle = wallAngle+wallAng4;

			//if the bottom is existent
			//add corner value
			/*
			if(wallArr[2]){
				var cornerInst2 = instance_create_depth(wallX_1+lengthdir_x(80, townAngle), wallY_1+lengthdir_y(80, townAngle), 1, o_wall_corner);
				ds_stack_push(objectStack, cornerInst2);
				cornerInst2.image_angle = wallAngle;
			}*/
	}

	//sixth parrallel
	if(wallArr[5]){
		var wallAng5 = choose(0, 180);
		var wall5 = choose(o_con_wall, o_con_tall_wall);
	
		var wallX_5 = roadX+lengthdir_x(54+54+54+54+54, townAngle)+lengthdir_x(100,townAngle+angleOffset);
		var wallY_5 = roadY+lengthdir_y(54+54+54+54+54, townAngle)+lengthdir_y(100,townAngle+angleOffset);
	
			if(!wallArr[3]){
				wall5 = o_con_wall_broken;
				wallAng5 = 180;
				/*
				if(offsetFlip)
					wallAng1 = 0;*/
			}
			if(!wallArr[4]){
				wall5 = o_con_wall_broken;
				wallAng5 = 0;
				/*
				if(offsetFlip)
					wallAng1 = 180;*/
			}
			if(wallArr[0] && wallArr[2])
				wall5 = o_con_tall_wall;
			//var wallX_1_2 = roadX+lengthdir_x(54, townAngle)+lengthdir_x(100,townAngle+angleOffset);
			//var wallY_1_2 = roadY+lengthdir_y(54, townAngle)+lengthdir_y(100,townAngle+angleOffset);
			var wallInst_5 = instance_create_depth(wallX_5, wallY_5, 1, wall5);
			ds_queue_enqueue(activationQueue, wallInst_5);
			ds_stack_push(objectStack, wallInst_5);
			wallInst_5.image_angle = wallAngle+wallAng5;

			//if the bottom is existent
			//add corner value
		
			if(wallArr[10]){
				var cornerInst2 = instance_create_depth(wallX_1+lengthdir_x(80, townAngle), wallY_1+lengthdir_y(80, townAngle), 1, o_con_wall_corner);
				ds_stack_push(objectStack, cornerInst2);
				cornerInst2.image_angle = wallAngle;
			}
	}


	//spawn underneath
	if(wallArr[6]){
		var wallAng6 = choose(90, -90);
		var wall6 = choose(o_con_wall, o_con_tall_wall);
	
		var wallX_6 = wallX_1+lengthdir_x(80+54+54+54+54, townAngle)+lengthdir_x(27, townAngle+angleOffset);
		var wallY_6 = wallY_1+lengthdir_y(80+54+54+54+54, townAngle)+lengthdir_y(27, townAngle+angleOffset);

	
			if(!wallArr[7]){
				wall6 = o_con_wall_broken;
				wallAng6 = 90;
				if(offsetFlip)
					wallAng6 = -90;
			}
			if(!wallArr[1]){
				wall6 = o_con_wall_broken;
				wallAng6 = -90;
				if(offsetFlip)
					wallAng6 = 90;
			}
			if(wallArr[1] && wallArr[7])
				wall6 = o_con_tall_wall;
			//var wallX_2 = wallX_1+lengthdir_x(80, townAngle)+lengthdir_x(27, townAngle+angleOffset);
			//var wallY_2 = wallY_1+lengthdir_y(80, townAngle)+lengthdir_y(27, townAngle+angleOffset);
			var wallInst_6 = instance_create_depth(wallX_6, wallY_6, 1, wall6);
			ds_queue_enqueue(activationQueue, wallInst_6);
			ds_stack_push(objectStack, wallInst_6);
			//wallInst_2.image_angle = wallAngle+choose(90, -90);
			wallInst_6.image_angle = wallAngle+wallAng6;
	

	}

	//another one underneath
	if(wallArr[7]){
		var wallAng7 = choose(90, -90);
		var wall7 = choose(o_con_wall, o_con_tall_wall);
	
		var wallX_7 = wallX_1+lengthdir_x(27+54, townAngle+angleOffset)+lengthdir_x(80+54+54+54+54, townAngle)
		var wallY_7 = wallY_1+lengthdir_y(27+54, townAngle+angleOffset)+lengthdir_y(80+54+54+54+54, townAngle)

			if(!wallArr[9]){
				wall7 = o_con_wall_broken;
				wallAng7 = 90;
				if(offsetFlip)
					wallAng7 = -90;
			}
			if(!wallArr[6]){
				wall7 = o_con_wall_broken;
				wallAng7 = -90;
				if(offsetFlip)
					wallAng7 = 90;
			}
			if(wallArr[9] && wallArr[6])
				wall7 = o_con_tall_wall;
			//var wallX_2_1 = wallX_1+lengthdir_x(27+54, townAngle+angleOffset)+lengthdir_x(80, townAngle)
			//var wallY_2_1 = wallY_1+lengthdir_y(27+54, townAngle+angleOffset)+lengthdir_y(80, townAngle)
			var wallInst_7 = instance_create_depth(wallX_7, wallY_7, 1, wall7);
			ds_queue_enqueue(activationQueue, wallInst_7);
			ds_stack_push(objectStack, wallInst_7);
			//wallInst_2_1.image_angle = wallAngle+choose(90, -90);
			wallInst_7.image_angle = wallAngle+wallAng7;
	
	}

	//3rd underneath
	if(wallArr[8]){
		var wallAng8 = choose(90, -90);
		var wall8 = choose(o_con_wall, o_con_tall_wall);
	
		var wallX_8 = wallX_1+lengthdir_x(27+54+54, townAngle+angleOffset)+lengthdir_x(80+54+54+54+54, townAngle)
		var wallY_8 = wallY_1+lengthdir_y(27+54+54, townAngle+angleOffset)+lengthdir_y(80+54+54+54+54, townAngle)

			if(!wallArr[14]){
				wall8 = o_con_wall_broken;
				wallAng8 = 90;
				if(offsetFlip)
					wallAng8 = -90;
			}
			if(!wallArr[7]){
				wall8 = o_con_wall_broken;
				wallAng8 = -90;
				if(offsetFlip)
					wallAng8 = 90;
			}
			if(wallArr[7] && wallArr[14])
				wall8 = o_con_tall_wall;
			//var wallX_2_1 = wallX_1+lengthdir_x(27+54, townAngle+angleOffset)+lengthdir_x(80, townAngle)
			//var wallY_2_1 = wallY_1+lengthdir_y(27+54, townAngle+angleOffset)+lengthdir_y(80, townAngle)
			var wallInst_8 = instance_create_depth(wallX_8, wallY_8, 1, wall8);
			ds_queue_enqueue(activationQueue, wallInst_8);
			ds_stack_push(objectStack, wallInst_8);
			//wallInst_2_1.image_angle = wallAngle+choose(90, -90);
			wallInst_8.image_angle = wallAngle+wallAng8;
	
	}

	//4th underneath
	if(wallArr[9]){
		var wallAng9 = choose(90, -90);
		var wall9 = choose(o_con_wall, o_con_tall_wall);
	
		var wallX_9 = wallX_1+lengthdir_x(27+54+54+54, townAngle+angleOffset)+lengthdir_x(80+54+54+54+54, townAngle)
		var wallY_9 = wallY_1+lengthdir_y(27+54+54+54, townAngle+angleOffset)+lengthdir_y(80+54+54+54+54, townAngle)

			if(!wallArr[15]){
				wall9 = o_con_wall_broken;
				wallAng9 = 90;
				if(offsetFlip)
					wallAng9 = -90;
			}
			if(!wallArr[8]){
				wall9 = o_con_wall_broken;
				wallAng9 = -90;
				if(offsetFlip)
					wallAng9 = 90;
			}
			if(wallArr[15] && wallArr[8])
				wall9 = o_con_tall_wall;
			//var wallX_2_1 = wallX_1+lengthdir_x(27+54, townAngle+angleOffset)+lengthdir_x(80, townAngle)
			//var wallY_2_1 = wallY_1+lengthdir_y(27+54, townAngle+angleOffset)+lengthdir_y(80, townAngle)
			var wallInst_9 = instance_create_depth(wallX_9, wallY_9, 1, wall9);
			ds_queue_enqueue(activationQueue, wallInst_9);
			ds_stack_push(objectStack, wallInst_9);
			//wallInst_2_1.image_angle = wallAngle+choose(90, -90);
			wallInst_9.image_angle = wallAngle+wallAng9;
	
	}
					
	//spawn above
	if(wallArr[10]){
		var wallAng10 = choose(90, -90);
		var wall10 = choose(o_con_wall, o_con_tall_wall);
	
		var wallX_10 = wallX_1+lengthdir_x(27, townAngle+180)+lengthdir_x(27, townAngle+angleOffset);
		var wallY_10 = wallY_1+lengthdir_y(27, townAngle+180)+lengthdir_y(27, townAngle+angleOffset);

			if(!wallArr[11]){
				wall10 = o_con_wall_broken;
				wallAng10 = 90;
				if(offsetFlip)
					wallAng10 = -90;
			}
			if(!wallArr[4]){
				wall10 = o_con_wall_broken;
				wallAng10 = -90;
				if(offsetFlip)
					wallAng10 = 90;
			}
			if(wallArr[11] && wallArr[4])
				wall10 = o_con_tall_wall;
			//var wallX_3 = wallX_1+lengthdir_x(27, townAngle+180)+lengthdir_x(27, townAngle+angleOffset);
			//var wallY_3 = wallY_1+lengthdir_y(27, townAngle+180)+lengthdir_y(27, townAngle+angleOffset);
			var wallInst_10 = instance_create_depth(wallX_10, wallY_10, 1, wall10);
			ds_queue_enqueue(activationQueue, wallInst_10);
			ds_stack_push(objectStack, wallInst_10);
			//wallInst_3.image_angle = wallAngle+choose(90, -90);
			wallInst_10.image_angle = wallAngle+wallAng10;

	}


	//another one above
	if(wallArr[11]){
		var wallAng11 = choose(90, -90);
		var wall11 = choose(o_con_wall, o_con_tall_wall);
	
		var wallX_11 = wallX_1+lengthdir_x(27+54, townAngle+angleOffset)+lengthdir_x(27, townAngle+180);
		var wallY_11 = wallY_1+lengthdir_y(27+54, townAngle+angleOffset)+lengthdir_y(27, townAngle+180);

			if(!wallArr[13]){
				wall11 = o_con_wall_broken;
				wallAng11 = 90;
				if(offsetFlip)
					wallAng11 = -90;
			}
			if(!wallArr[10]){
				wall11 = o_con_wall_broken;
				wallAng11 = -90;
				if(offsetFlip)
					wallAng11 = 90;
			}
			if(wallArr[13] && wallArr[10])
				wall11 = o_con_tall_wall;
			//var wallX_3_2 = wallX_1+lengthdir_x(27+54, townAngle+angleOffset)+lengthdir_x(27, townAngle+180);
			//var wallY_3_2 = wallY_1+lengthdir_y(27+54, townAngle+angleOffset)+lengthdir_y(27, townAngle+180);
			var wallInst_11 = instance_create_depth(wallX_11, wallY_11, 1, wall11);
			ds_queue_enqueue(activationQueue, wallInst_11);
			ds_stack_push(objectStack, wallInst_11);
			//wallInst_3_2.image_angle = wallAngle+choose(90, -90);
			wallInst_11.image_angle = wallAngle+wallAng11;

	}

	//third above
	if(wallArr[12]){
		var wallAng12 = choose(90, -90);
		var wall12 = choose(o_con_wall, o_con_tall_wall);
	
		var wallX_12 = wallX_1+lengthdir_x(27+54+54, townAngle+angleOffset)+lengthdir_x(27, townAngle+180);
		var wallY_12 = wallY_1+lengthdir_y(27+54+54, townAngle+angleOffset)+lengthdir_y(27, townAngle+180);

			if(!wallArr[19]){
				wall12 = o_con_wall_broken;
				wallAng12 = 90;
				if(offsetFlip)
					wallAng12 = -90;
			}
			if(!wallArr[11]){
				wall12 = o_con_wall_broken;
				wallAng12 = -90;
				if(offsetFlip)
					wallAng12 = 90;
			}
			if(wallArr[19] && wallArr[11])
				wall12 = o_con_tall_wall;
			//var wallX_3_2 = wallX_1+lengthdir_x(27+54, townAngle+angleOffset)+lengthdir_x(27, townAngle+180);
			//var wallY_3_2 = wallY_1+lengthdir_y(27+54, townAngle+angleOffset)+lengthdir_y(27, townAngle+180);
			var wallInst_12 = instance_create_depth(wallX_12, wallY_12, 1, wall12);
			ds_queue_enqueue(activationQueue, wallInst_12);
			ds_stack_push(objectStack, wallInst_12);
			//wallInst_3_2.image_angle = wallAngle+choose(90, -90);
			wallInst_12.image_angle = wallAngle+wallAng12;

	}

	//fourth above
	if(wallArr[13]){
		var wallAng13 = choose(90, -90);
		var wall13 = choose(o_wall, o_tall_wall);
	
		var wallX_13 = wallX_1+lengthdir_x(27+54+54+54, townAngle+angleOffset)+lengthdir_x(27, townAngle+180);
		var wallY_13 = wallY_1+lengthdir_y(27+54+54+54, townAngle+angleOffset)+lengthdir_y(27, townAngle+180);

			if(!wallArr[18]){
				wall13 = o_con_wall_broken;
				wallAng13 = 90;
				if(offsetFlip)
					wallAng13 = -90;
			}
			if(!wallArr[12]){
				wall13 = o_con_wall_broken;
				wallAng13 = -90;
				if(offsetFlip)
					wallAng13 = 90;
			}
			if(wallArr[18] && wallArr[12])
				wall13 = o_con_tall_wall;
			//var wallX_3_2 = wallX_1+lengthdir_x(27+54, townAngle+angleOffset)+lengthdir_x(27, townAngle+180);
			//var wallY_3_2 = wallY_1+lengthdir_y(27+54, townAngle+angleOffset)+lengthdir_y(27, townAngle+180);
			var wallInst_13 = instance_create_depth(wallX_13, wallY_13, 1, wall13);
			ds_queue_enqueue(activationQueue, wallInst_13);
			ds_stack_push(objectStack, wallInst_13);
			//wallInst_3_2.image_angle = wallAngle+choose(90, -90);
			wallInst_13.image_angle = wallAngle+wallAng13;

	}


	//spawn on the other side
	if(wallArr[14]){
		var wallAng14 = choose(0, 180);
		var wall14 = choose(o_con_wall, o_con_tall_wall);
	
		var wallX_14 = wallX_1+lengthdir_x(54+54+54+54, townAngle+angleOffset);
		var wallY_14 = wallY_1+lengthdir_y(54+54+54+54, townAngle+angleOffset);

			if(!wallArr[15]){
				wall14 = o_con_wall_broken;
				wallAng14 = 180;
				/*
				if(offsetFlip)
					wallAng6 = 0;*/
			}
			if(!wallArr[16]){
				wall14 = o_con_wall_broken;
				wallAng14 = 0;
				/*
				if(offsetFlip)
					wallAng6 = 180;*/
			}
			if(wallArr[15] && wallArr[16])
				wall14 = o_con_tall_wall;
			//var wallX_4 = wallX_1+lengthdir_x(54+54, townAngle+angleOffset);
			//var wallY_4 = wallY_1+lengthdir_y(54+54, townAngle+angleOffset);
			var wallInst_14 = instance_create_depth(wallX_14, wallY_14, 1, wall14);
			ds_queue_enqueue(activationQueue, wallInst_14);
			ds_stack_push(objectStack, wallInst_14);
			//wallInst_4.image_angle = wallAngle+choose(0, 180);
			wallInst_14.image_angle = wallAngle+wallAng14;

			//if the top is existent
			//add corner value
			/*
			if(wallArr[5]){
				var cornerInst3 = instance_create_depth(wallX_4+lengthdir_x(27, townAngle+180), wallY_4+lengthdir_y(27, townAngle+180), 1, o_wall_corner);
				ds_stack_push(objectStack, cornerInst3);
				cornerInst3.image_angle = wallAngle-180;
			}*/
	
	}

	//spawn another one on side
	if(wallArr[15]){
		var wallAng15 = 0
		var wall15 = choose(o_con_wall, o_con_tall_wall);
	
		var wallX_15 = wallX_1+lengthdir_x(54, townAngle)+lengthdir_x(54+54+54+54, townAngle+angleOffset);
		var wallY_15 = wallY_1+lengthdir_y(54, townAngle)+lengthdir_y(54+54+54+54, townAngle+angleOffset);

			if(!wallArr[9]){
				wall15 = o_con_wall_broken;
				wallAng15 = 180;
				/*
				if(offsetFlip)
					wallAng7 = 0;*/
			}
			if(!wallArr[14]){
				wall15 = o_con_wall_broken;
				wallAng15 = 0;
				/*
				if(offsetFlip)
					wallAng7 = 180;*/
			}
			if(wallArr[9] && wallArr[14])
					wall15 = o_con_tall_wall;
			//var wallX_4_2 = wallX_1+lengthdir_x(54, townAngle)+lengthdir_x(54+54, townAngle+angleOffset);
			//var wallY_4_2 = wallY_1+lengthdir_y(54, townAngle)+lengthdir_y(54+54, townAngle+angleOffset);
			var wallInst_15= instance_create_depth(wallX_15, wallY_15, 1, wall15);
			ds_queue_enqueue(activationQueue, wallInst_15);
			ds_stack_push(objectStack, wallInst_15);
			//wallInst_4_2.image_angle = wallAngle+choose(0, 180);
			wallInst_15.image_angle = wallAngle+wallAng15;

			//if the bottom is existent
			//add corner value
			/*
			if(wallArr[3]){
				var cornerInst4 = instance_create_depth(wallX_4_2+lengthdir_x(27, townAngle), wallY_4_2+lengthdir_y(27, townAngle), 1, o_wall_corner);
				ds_stack_push(objectStack, cornerInst4);
				cornerInst4.image_angle = wallAngle + 90;
			}*/
	
	
	}

	//third on side
	if(wallArr[16]){
		var wallAng16 = 0
		var wall16 = choose(o_con_wall, o_con_tall_wall);
	
		var wallX_16 = wallX_1+lengthdir_x(54+54, townAngle)+lengthdir_x(54+54+54+54, townAngle+angleOffset);
		var wallY_16 = wallY_1+lengthdir_y(54+54, townAngle)+lengthdir_y(54+54+54+54, townAngle+angleOffset);

			if(!wallArr[14]){
				wall16 = o_con_wall_broken;
				wallAng16 = 180;
				/*
				if(offsetFlip)
					wallAng7 = 0;*/
			}
			if(!wallArr[15]){
				wall16 = o_con_wall_broken;
				wallAng16 = 0;
				/*
				if(offsetFlip)
					wallAng7 = 180;*/
			}
			if(wallArr[15] && wallArr[14])
					wall16 = o_con_tall_wall;
			//var wallX_4_2 = wallX_1+lengthdir_x(54, townAngle)+lengthdir_x(54+54, townAngle+angleOffset);
			//var wallY_4_2 = wallY_1+lengthdir_y(54, townAngle)+lengthdir_y(54+54, townAngle+angleOffset);
			var wallInst_16= instance_create_depth(wallX_16, wallY_16, 1, wall16);
			ds_queue_enqueue(activationQueue, wallInst_16);
			ds_stack_push(objectStack, wallInst_16);
			//wallInst_4_2.image_angle = wallAngle+choose(0, 180);
			wallInst_16.image_angle = wallAngle+wallAng16;

			//if the bottom is existent
			//add corner value
			/*
			if(wallArr[3]){
				var cornerInst4 = instance_create_depth(wallX_4_2+lengthdir_x(27, townAngle), wallY_4_2+lengthdir_y(27, townAngle), 1, o_wall_corner);
				ds_stack_push(objectStack, cornerInst4);
				cornerInst4.image_angle = wallAngle + 90;
			}*/
	
	}

	//fourth on side
	if(wallArr[17]){
		var wallAng17 = 0
		var wall17 = choose(o_con_wall, o_con_tall_wall);
	
		var wallX_17 = wallX_1+lengthdir_x(54+54+54, townAngle)+lengthdir_x(54+54+54+54, townAngle+angleOffset);
		var wallY_17 = wallY_1+lengthdir_y(54+54+54, townAngle)+lengthdir_y(54+54+54+54, townAngle+angleOffset);

			if(!wallArr[15]){
				wall17 = o_con_wall_broken;
				wallAng17 = 180;
				/*
				if(offsetFlip)
					wallAng7 = 0;*/
			}
			if(!wallArr[16]){
				wall17 = o_con_wall_broken;
				wallAng17 = 0;
				/*
				if(offsetFlip)
					wallAng7 = 180;*/
			}
			if(wallArr[15] && wallArr[16])
					wall17 = o_con_tall_wall;
			//var wallX_4_2 = wallX_1+lengthdir_x(54, townAngle)+lengthdir_x(54+54, townAngle+angleOffset);
			//var wallY_4_2 = wallY_1+lengthdir_y(54, townAngle)+lengthdir_y(54+54, townAngle+angleOffset);
			var wallInst_17= instance_create_depth(wallX_17, wallY_17, 1, wall17);
			ds_queue_enqueue(activationQueue, wallInst_17);
			ds_stack_push(objectStack, wallInst_17);
			//wallInst_4_2.image_angle = wallAngle+choose(0, 180);
			wallInst_17.image_angle = wallAngle+wallAng17;

			//if the bottom is existent
			//add corner value
			/*
			if(wallArr[3]){
				var cornerInst4 = instance_create_depth(wallX_4_2+lengthdir_x(27, townAngle), wallY_4_2+lengthdir_y(27, townAngle), 1, o_wall_corner);
				ds_stack_push(objectStack, cornerInst4);
				cornerInst4.image_angle = wallAngle + 90;
			}*/
	
	}

	//fith on side
	if(wallArr[18]){
		var wallAng18 = 0
		var wall18 = choose(o_con_wall, o_con_tall_wall);
	
		var wallX_18 = wallX_1+lengthdir_x(54+54+54+54, townAngle)+lengthdir_x(54+54+54+54, townAngle+angleOffset);
		var wallY_18 = wallY_1+lengthdir_y(54+54+54+54, townAngle)+lengthdir_y(54+54+54+54, townAngle+angleOffset);

			if(!wallArr[16]){
				wall18 = o_con_wall_broken;
				wallAng18 = 180;
				/*
				if(offsetFlip)
					wallAng7 = 0;*/
			}
			if(!wallArr[17]){
				wall18 = o_con_wall_broken;
				wallAng18 = 0;
				/*
				if(offsetFlip)
					wallAng7 = 180;*/
			}
			if(wallArr[16] && wallArr[17])
					wall18 = o_con_tall_wall;
			//var wallX_4_2 = wallX_1+lengthdir_x(54, townAngle)+lengthdir_x(54+54, townAngle+angleOffset);
			//var wallY_4_2 = wallY_1+lengthdir_y(54, townAngle)+lengthdir_y(54+54, townAngle+angleOffset);
			var wallInst_18= instance_create_depth(wallX_18, wallY_18, 1, wall18);
			ds_queue_enqueue(activationQueue, wallInst_18);
			ds_stack_push(objectStack, wallInst_18);
			//wallInst_4_2.image_angle = wallAngle+choose(0, 180);
			wallInst_18.image_angle = wallAngle+wallAng18;

			//if the bottom is existent
			//add corner value
			/*
			if(wallArr[3]){
				var cornerInst4 = instance_create_depth(wallX_4_2+lengthdir_x(27, townAngle), wallY_4_2+lengthdir_y(27, townAngle), 1, o_wall_corner);
				ds_stack_push(objectStack, cornerInst4);
				cornerInst4.image_angle = wallAngle + 90;
			}*/
	
	}

	//sixth on side
	if(wallArr[19]){
		var wallAng19 = 0
		var wall19 = choose(o_con_wall, o_con_tall_wall);
	
		var wallX_19 = wallX_1+lengthdir_x(54+54+54+54+54, townAngle)+lengthdir_x(54+54+54+54, townAngle+angleOffset);
		var wallY_19 = wallY_1+lengthdir_y(54+54+54+54+54, townAngle)+lengthdir_y(54+54+54+54, townAngle+angleOffset);

			if(!wallArr[17]){
				wall19 = o_con_wall_broken;
				wallAng19 = 180;
				/*
				if(offsetFlip)
					wallAng7 = 0;*/
			}
			if(!wallArr[18]){
				wall19 = o_con_wall_broken;
				wallAng19 = 0;
				/*
				if(offsetFlip)
					wallAng7 = 180;*/
			}
			if(wallArr[17] && wallArr[18])
					wall19 = o_con_tall_wall;
			//var wallX_4_2 = wallX_1+lengthdir_x(54, townAngle)+lengthdir_x(54+54, townAngle+angleOffset);
			//var wallY_4_2 = wallY_1+lengthdir_y(54, townAngle)+lengthdir_y(54+54, townAngle+angleOffset);
			var wallInst_19= instance_create_depth(wallX_19, wallY_19, 1, wall19);
			ds_queue_enqueue(activationQueue, wallInst_19);
			ds_stack_push(objectStack, wallInst_19);
			//wallInst_4_2.image_angle = wallAngle+choose(0, 180);
			wallInst_19.image_angle = wallAngle+wallAng19;

			//if the bottom is existent
			//add corner value
			/*
			if(wallArr[3]){
				var cornerInst4 = instance_create_depth(wallX_4_2+lengthdir_x(27, townAngle), wallY_4_2+lengthdir_y(27, townAngle), 1, o_wall_corner);
				ds_stack_push(objectStack, cornerInst4);
				cornerInst4.image_angle = wallAngle + 90;
			}*/
	
	}

	//spawn the bunker door
	var bunkerX = wallX_1+lengthdir_x(irandom_range(54, 54*3), townAngle+angleOffset)+lengthdir_x(irandom_range(54,54*5), townAngle);
	var bunkerY = wallY_1+lengthdir_y(irandom_range(54, 54*3), townAngle+angleOffset)+lengthdir_y(irandom_range(54,54*5), townAngle);
	var bunker = instance_create_depth(bunkerX, bunkerY, 1, o_bunker);
	bunker.image_angle = townAngle;
	ds_stack_push(objectStack, bunker);


}
