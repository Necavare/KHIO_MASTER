/// scr_createTownBlock(startingX, startingY, wallAngle, townAngle, angleOffset, spawnAnvil, spawnBloomery)
/// @description creates town block so i dont need to repeat the code
/// @param startingX
/// @param startingY
/// @param wallAngle
/// @param townAngle
/// @param angleOffset
/// @param spawnAnvil
/// @param spawnBloomery
function scr_createTownBlock(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

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
	var wallArr = array_create(8, false);
	//find the walls that will exist
	for(var iW = 0; iW < 8; iW++){
		if(irandom(99)<50){
			wallArr[iW] = true;
			wallNum++;
		}if(iW >= 6 && wallNum < 2){
			wallArr[iW] = true;
			wallNum++;	
		}
	}


	var cenX = roadX+lengthdir_x(100, townAngle+angleOffset)+lengthdir_x(54, townAngle+angleOffset);
	var cenY = roadY+lengthdir_y(100, townAngle+angleOffset)+lengthdir_y(54, townAngle+angleOffset);

	if(spawnAnvil){
		var anvilLen = irandom_range(0,55);
		var anvilAng = irandom(360);
		var anvilX = cenX+lengthdir_x(anvilLen, anvilAng);
		var anvilY = cenY+lengthdir_y(anvilLen, anvilAng);
		var anvilInst = instance_create_depth(anvilX, anvilY, 1, o_anvil);
		ds_stack_push(objectStack, anvilInst);
	}

	if(spawnBloomery){
		var bloomeryLen = irandom_range(22,24);
		var bloomeryAng = irandom(360);
		var bloomeryX = cenX+lengthdir_x(bloomeryLen, bloomeryAng);
		var bloomeryY = cenY+lengthdir_y(bloomeryLen, bloomeryAng);
		var bloomeryInst = instance_create_depth(bloomeryX, bloomeryY, 1, o_firepit);
		bloomeryInst.image_angle = bloomeryAng;
		bloomeryInst.isBloomery = 32;
		ds_stack_push(objectStack, bloomeryInst);
		ds_queue_enqueue(activationQueue, bloomeryInst);

		//spawn old man out front
		var oldManAng = irandom(360);
		//var oldManX = bloomeryX+lengthdir_x(12, oldManAng);
		//var oldManY = bloomeryY+lengthdir_y(12, oldManAng);
		var oldManX = cenX+lengthdir_x(8, bloomeryAng+180);
		var oldManY = cenY+lengthdir_y(8, bloomeryAng+180);
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
		var wall0 = choose(o_wall, o_tall_wall);
	
		//if its a tree:++
		if(treeSelected == 0){
			var ranTree = instance_create_depth(wallX_1, wallY_1, 1, o_spruce);
			var ranTree2 = instance_create_depth(wallX_1+lengthdir_x(14, townAngle), wallY_1+lengthdir_y(14, townAngle), 1, o_spruce);
			var ranTree3 = instance_create_depth(wallX_1+lengthdir_x(-14, townAngle), wallY_1+lengthdir_y(-14, townAngle), 1, o_spruce);
			ds_stack_push(objectStack, ranTree3);
		
			ds_stack_push(objectStack, ranTree);
			ds_stack_push(objectStack, ranTree2);
		}
		else{
	
			if(!wallArr[4]){
				wall0 = o_broken_wall;
				wallAng0 = 0;
				/*
				if(offsetFlip)
					wallAng0 = 180;*/
			}
			if(!wallArr[1]){
				wall0 = o_broken_wall;
				wallAng0 = 180;
				/*
				if(offsetFlip)
					wallAng0 = 0;*/
			}
			if(wallArr[1] && wallArr[4])
				wall0 = o_tall_wall;	
			var wallInst_1 = instance_create_depth(wallX_1, wallY_1, 1, wall0);
			ds_queue_enqueue(activationQueue, wallInst_1);
			ds_stack_push(objectStack, wallInst_1);
			wallInst_1.image_angle = wallAngle + wallAng0;
	
			//if the top is existent
			//add corner value
			if(wallArr[4]){
				var cornerInst1 = instance_create_depth(wallX_1+lengthdir_x(27, townAngle+180), wallY_1+lengthdir_y(27, townAngle+180), 1, o_wall_corner);
				ds_stack_push(objectStack, cornerInst1);
				cornerInst1.image_angle = wallAngle-90;
			}
	
		}
	
	
	}


	//another one parallel to road
	if(wallArr[1]){
		var wallAng1 = choose(0, 180);
		var wall1 = choose(o_wall, o_tall_wall);
	
		var wallX_1_2 = roadX+lengthdir_x(54, townAngle)+lengthdir_x(100,townAngle+angleOffset);
		var wallY_1_2 = roadY+lengthdir_y(54, townAngle)+lengthdir_y(100,townAngle+angleOffset);
	
		//if its a tree:
		if(treeSelected == 1){
			var ranTree = instance_create_depth(wallX_1_2, wallY_1_2, 1, o_spruce);
			var ranTree2 = instance_create_depth(wallX_1_2+lengthdir_x(14, townAngle), wallY_1_2+lengthdir_y(14, townAngle), 1, o_spruce);
			var ranTree3 = instance_create_depth(wallX_1_2+lengthdir_x(-14, townAngle), wallY_1_2+lengthdir_y(-14, townAngle), 1, o_spruce);
			ds_stack_push(objectStack, ranTree3);
			ds_stack_push(objectStack, ranTree);
			ds_stack_push(objectStack, ranTree2);
		}
		else{
			if(!wallArr[2]){
				wall1 = o_broken_wall;
				wallAng1 = 180;
				/*
				if(offsetFlip)
					wallAng1 = 0;*/
			}
			if(!wallArr[0]){
				wall1 = o_broken_wall;
				wallAng1 = 0;
				/*
				if(offsetFlip)
					wallAng1 = 180;*/
			}
			if(wallArr[0] && wallArr[2])
				wall1 = o_tall_wall;
			//var wallX_1_2 = roadX+lengthdir_x(54, townAngle)+lengthdir_x(100,townAngle+angleOffset);
			//var wallY_1_2 = roadY+lengthdir_y(54, townAngle)+lengthdir_y(100,townAngle+angleOffset);
			var wallInst_1_2 = instance_create_depth(wallX_1_2, wallY_1_2, 1, wall1);
			ds_queue_enqueue(activationQueue, wallInst_1_2);
			ds_stack_push(objectStack, wallInst_1_2);
			wallInst_1_2.image_angle = wallAngle+wallAng1;

			//if the bottom is existent
			//add corner value
			if(wallArr[2]){
				var cornerInst2 = instance_create_depth(wallX_1+lengthdir_x(80, townAngle), wallY_1+lengthdir_y(80, townAngle), 1, o_wall_corner);
				ds_stack_push(objectStack, cornerInst2);
				cornerInst2.image_angle = wallAngle;
			}
		}
	}


	//spawn underneath
	if(wallArr[2]){
		var wallAng2 = choose(90, -90);
		var wall2 = choose(o_wall, o_tall_wall);
	
		var wallX_2 = wallX_1+lengthdir_x(80, townAngle)+lengthdir_x(27, townAngle+angleOffset);
		var wallY_2 = wallY_1+lengthdir_y(80, townAngle)+lengthdir_y(27, townAngle+angleOffset);
		//if its a tree:
		if(treeSelected == 2){
			var ranTree = instance_create_depth(wallX_2, wallY_2, 1, o_spruce);
			var ranTree2 = instance_create_depth(wallX_2+lengthdir_x(14, townAngle+angleOffset), wallY_2+lengthdir_y(14, townAngle+angleOffset), 1, o_spruce);
			var ranTree3 = instance_create_depth(wallX_2+lengthdir_x(-14, townAngle+angleOffset), wallY_2+lengthdir_y(-14, townAngle+angleOffset), 1, o_spruce);
			ds_stack_push(objectStack, ranTree3);
			ds_stack_push(objectStack, ranTree);
			ds_stack_push(objectStack, ranTree2);
		}
		else{
			if(!wallArr[3]){
				wall2 = o_broken_wall;
				wallAng2 = 90;
				if(offsetFlip)
					wallAng2 = -90;
			}
			if(!wallArr[1]){
				wall2 = o_broken_wall;
				wallAng2 = -90;
				if(offsetFlip)
					wallAng2 = 90;
			}
			if(wallArr[1] && wallArr[3])
				wall2 = o_tall_wall;
			//var wallX_2 = wallX_1+lengthdir_x(80, townAngle)+lengthdir_x(27, townAngle+angleOffset);
			//var wallY_2 = wallY_1+lengthdir_y(80, townAngle)+lengthdir_y(27, townAngle+angleOffset);
			var wallInst_2 = instance_create_depth(wallX_2, wallY_2, 1, wall2);
			ds_queue_enqueue(activationQueue, wallInst_2);
			ds_stack_push(objectStack, wallInst_2);
			//wallInst_2.image_angle = wallAngle+choose(90, -90);
			wallInst_2.image_angle = wallAngle+wallAng2;
		}

	}

	//another one underneath
	if(wallArr[3]){
		var wallAng3 = choose(90, -90);
		var wall3 = choose(o_wall, o_tall_wall);
	
		var wallX_2_1 = wallX_1+lengthdir_x(27+54, townAngle+angleOffset)+lengthdir_x(80, townAngle)
		var wallY_2_1 = wallY_1+lengthdir_y(27+54, townAngle+angleOffset)+lengthdir_y(80, townAngle)
		//if its a tree:
		if(treeSelected == 3){
			var ranTree = instance_create_depth(wallX_2_1, wallY_2_1, 1, o_spruce);
			var ranTree2 = instance_create_depth(wallX_2_1+lengthdir_x(14, townAngle+angleOffset), wallY_2_1+lengthdir_y(14, townAngle+angleOffset), 1, o_spruce);
			var ranTree3 = instance_create_depth(wallX_2_1+lengthdir_x(-14, townAngle+angleOffset), wallY_2_1+lengthdir_y(-14, townAngle+angleOffset), 1, o_spruce);
			ds_stack_push(objectStack, ranTree3);
			ds_stack_push(objectStack, ranTree);
			ds_stack_push(objectStack, ranTree2);
		}
		else{
			if(!wallArr[7]){
				wall3 = o_broken_wall;
				wallAng3 = 90;
				if(offsetFlip)
					wallAng3 = -90;
			}
			if(!wallArr[2]){
				wall3 = o_broken_wall;
				wallAng3 = -90;
				if(offsetFlip)
					wallAng3 = 90;
			}
			if(wallArr[7] && wallArr[2])
				wall3 = o_tall_wall;
			//var wallX_2_1 = wallX_1+lengthdir_x(27+54, townAngle+angleOffset)+lengthdir_x(80, townAngle)
			//var wallY_2_1 = wallY_1+lengthdir_y(27+54, townAngle+angleOffset)+lengthdir_y(80, townAngle)
			var wallInst_2_1 = instance_create_depth(wallX_2_1, wallY_2_1, 1, wall3);
			ds_queue_enqueue(activationQueue, wallInst_2_1);
			ds_stack_push(objectStack, wallInst_2_1);
			//wallInst_2_1.image_angle = wallAngle+choose(90, -90);
			wallInst_2_1.image_angle = wallAngle+wallAng3;
		}
	}
					
	//spawn above
	if(wallArr[4]){
		var wallAng4 = choose(90, -90);
		var wall4 = choose(o_wall, o_tall_wall);
	
		var wallX_3 = wallX_1+lengthdir_x(27, townAngle+180)+lengthdir_x(27, townAngle+angleOffset);
		var wallY_3 = wallY_1+lengthdir_y(27, townAngle+180)+lengthdir_y(27, townAngle+angleOffset);
		//if its a tree:
		if(treeSelected == 4){
			var ranTree = instance_create_depth(wallX_3, wallY_3, 1, o_spruce);
			var ranTree2 = instance_create_depth(wallX_3+lengthdir_x(14, townAngle+angleOffset), wallY_3+lengthdir_y(14, townAngle+angleOffset), 1, o_spruce);
			var ranTree3 = instance_create_depth(wallX_3+lengthdir_x(-14, townAngle+angleOffset), wallY_3+lengthdir_y(-14, townAngle+angleOffset), 1, o_spruce);
			ds_stack_push(objectStack, ranTree3);
			ds_stack_push(objectStack, ranTree);
			ds_stack_push(objectStack, ranTree2);
		}
		else{
			if(!wallArr[5]){
				wall4 = o_broken_wall;
				wallAng4 = 90;
				if(offsetFlip)
					wallAng4 = -90;
			}
			if(!wallArr[0]){
				wall4 = o_broken_wall;
				wallAng4 = -90;
				if(offsetFlip)
					wallAng4 = 90;
			}
			if(wallArr[5] && wallArr[0])
				wall4 = o_tall_wall;
			//var wallX_3 = wallX_1+lengthdir_x(27, townAngle+180)+lengthdir_x(27, townAngle+angleOffset);
			//var wallY_3 = wallY_1+lengthdir_y(27, townAngle+180)+lengthdir_y(27, townAngle+angleOffset);
			var wallInst_3 = instance_create_depth(wallX_3, wallY_3, 1, wall4);
			ds_queue_enqueue(activationQueue, wallInst_3);
			ds_stack_push(objectStack, wallInst_3);
			//wallInst_3.image_angle = wallAngle+choose(90, -90);
			wallInst_3.image_angle = wallAngle+wallAng4;

		}
	}


	//another one above
	if(wallArr[5]){
		var wallAng5 = choose(90, -90);
		var wall5 = choose(o_wall, o_tall_wall);
	
		var wallX_3_2 = wallX_1+lengthdir_x(27+54, townAngle+angleOffset)+lengthdir_x(27, townAngle+180);
		var wallY_3_2 = wallY_1+lengthdir_y(27+54, townAngle+angleOffset)+lengthdir_y(27, townAngle+180);
		//if its a tree:
		if(treeSelected == 5){
			var ranTree = instance_create_depth(wallX_3_2, wallY_3_2, 1, o_spruce);
			var ranTree2 = instance_create_depth(wallX_3_2+lengthdir_x(14, townAngle+angleOffset), wallY_3_2+lengthdir_y(14, townAngle+angleOffset), 1, o_spruce);
			var ranTree3 = instance_create_depth(wallX_3_2+lengthdir_x(-14, townAngle+angleOffset), wallY_3_2+lengthdir_y(-14, townAngle+angleOffset), 1, o_spruce);
			ds_stack_push(objectStack, ranTree3);
			ds_stack_push(objectStack, ranTree);
			ds_stack_push(objectStack, ranTree2);
		
		}
		else{
			if(!wallArr[6]){
				wall5 = o_broken_wall;
				wallAng5 = 90;
				if(offsetFlip)
					wallAng5 = -90;
			}
			if(!wallArr[4]){
				wall5 = o_broken_wall;
				wallAng5 = -90;
				if(offsetFlip)
					wallAng5 = 90;
			}
			if(wallArr[6] && wallArr[4])
				wall5 = o_tall_wall;
			//var wallX_3_2 = wallX_1+lengthdir_x(27+54, townAngle+angleOffset)+lengthdir_x(27, townAngle+180);
			//var wallY_3_2 = wallY_1+lengthdir_y(27+54, townAngle+angleOffset)+lengthdir_y(27, townAngle+180);
			var wallInst_3_2 = instance_create_depth(wallX_3_2, wallY_3_2, 1, wall5);
			ds_queue_enqueue(activationQueue, wallInst_3_2);
			ds_stack_push(objectStack, wallInst_3_2);
			//wallInst_3_2.image_angle = wallAngle+choose(90, -90);
			wallInst_3_2.image_angle = wallAngle+wallAng5;

		}
	}


	//spawn on the other side
	if(wallArr[6]){
		var wallAng6 = choose(0, 180);
		var wall6 = choose(o_wall, o_tall_wall);
	
		var wallX_4 = wallX_1+lengthdir_x(54+54, townAngle+angleOffset);
		var wallY_4 = wallY_1+lengthdir_y(54+54, townAngle+angleOffset);
		//if its a tree:
		if(treeSelected == 6){
			var ranTree = instance_create_depth(wallX_4, wallY_4, 1, o_spruce);
			var ranTree2 = instance_create_depth(wallX_4+lengthdir_x(14, townAngle), wallY_4+lengthdir_y(14, townAngle), 1, o_spruce);
			var ranTree3 = instance_create_depth(wallX_4+lengthdir_x(-14, townAngle), wallY_4+lengthdir_y(-14, townAngle), 1, o_spruce);
			ds_stack_push(objectStack, ranTree3);
			ds_stack_push(objectStack, ranTree);
			ds_stack_push(objectStack, ranTree2);
		}
		else{
			if(!wallArr[7]){
				wall6 = o_broken_wall;
				wallAng6 = 180;
				/*
				if(offsetFlip)
					wallAng6 = 0;*/
			}
			if(!wallArr[5]){
				wall6 = o_broken_wall;
				wallAng6 = 0;
				/*
				if(offsetFlip)
					wallAng6 = 180;*/
			}
			if(wallArr[7] && wallArr[5])
				wall6 = o_tall_wall;
			//var wallX_4 = wallX_1+lengthdir_x(54+54, townAngle+angleOffset);
			//var wallY_4 = wallY_1+lengthdir_y(54+54, townAngle+angleOffset);
			var wallInst_4 = instance_create_depth(wallX_4, wallY_4, 1, wall6);
			ds_queue_enqueue(activationQueue, wallInst_4);
			ds_stack_push(objectStack, wallInst_4);
			//wallInst_4.image_angle = wallAngle+choose(0, 180);
			wallInst_4.image_angle = wallAngle+wallAng6;

			//if the top is existent
			//add corner value
			if(wallArr[5]){
				var cornerInst3 = instance_create_depth(wallX_4+lengthdir_x(27, townAngle+180), wallY_4+lengthdir_y(27, townAngle+180), 1, o_wall_corner);
				ds_stack_push(objectStack, cornerInst3);
				cornerInst3.image_angle = wallAngle-180;
			}
	
		}
	}

	//spawn another one on side
	if(wallArr[7]){
		var wallAng7 = 0
		var wall7 = choose(o_wall, o_tall_wall);
	
		var wallX_4_2 = wallX_1+lengthdir_x(54, townAngle)+lengthdir_x(54+54, townAngle+angleOffset);
		var wallY_4_2 = wallY_1+lengthdir_y(54, townAngle)+lengthdir_y(54+54, townAngle+angleOffset);
		//if its a tree:
		if(treeSelected == 7){
			var ranTree = instance_create_depth(wallX_4_2, wallY_4_2, 1, o_spruce);
			var ranTree2 = instance_create_depth(wallX_4_2+lengthdir_x(14, townAngle), wallY_4_2+lengthdir_y(14, townAngle), 1, o_spruce);
			var ranTree3 = instance_create_depth(wallX_4_2+lengthdir_x(-14, townAngle), wallY_4_2+lengthdir_y(-14, townAngle), 1, o_spruce);
			ds_stack_push(objectStack, ranTree3);
			ds_stack_push(objectStack, ranTree);
			ds_stack_push(objectStack, ranTree2);
		}
		else{
			if(!wallArr[3]){
				wall7 = o_broken_wall;
				wallAng7 = 180;
				/*
				if(offsetFlip)
					wallAng7 = 0;*/
			}
			if(!wallArr[6]){
				wall7 = o_broken_wall;
				wallAng7 = 0;
				/*
				if(offsetFlip)
					wallAng7 = 180;*/
			}
			if(wallArr[3] && wallArr[6])
					wall7= o_tall_wall;
			//var wallX_4_2 = wallX_1+lengthdir_x(54, townAngle)+lengthdir_x(54+54, townAngle+angleOffset);
			//var wallY_4_2 = wallY_1+lengthdir_y(54, townAngle)+lengthdir_y(54+54, townAngle+angleOffset);
			var wallInst_4_2= instance_create_depth(wallX_4_2, wallY_4_2, 1, wall7);
			ds_queue_enqueue(activationQueue, wallInst_4_2);
			ds_stack_push(objectStack, wallInst_4_2);
			//wallInst_4_2.image_angle = wallAngle+choose(0, 180);
			wallInst_4_2.image_angle = wallAngle+wallAng7;

			//if the bottom is existent
			//add corner value
			if(wallArr[3]){
				var cornerInst4 = instance_create_depth(wallX_4_2+lengthdir_x(27, townAngle), wallY_4_2+lengthdir_y(27, townAngle), 1, o_wall_corner);
				ds_stack_push(objectStack, cornerInst4);
				cornerInst4.image_angle = wallAngle + 90;
			}
	
		}
	}


}
