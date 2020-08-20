/// scr_createTownBlock(startingX, startingY, angle)
/// @description creates compound
/// @param startingX
/// @param startingY
/// @param angle
function scr_createCompound(argument0, argument1, argument2) {

	//wall width is 128
	var startingX = argument0;
	var startingY = argument1;
	var angle = argument2;

	//spawn access in front
	var accessInst = instance_create_depth(startingX+lengthdir_x(35, angle-90), startingY+lengthdir_y(35, angle-90), 1, o_compound_access);
	accessInst.image_angle = angle;

	/*
	//spawn the first three walls
	var wall1 = instance_create_depth(startingX,startingY,1,o_compound_wall);
	wall1.image_angle = angle;
	var wall2 = instance_create_depth(startingX+lengthdir_x(128 , angle),startingY+lengthdir_y(128, angle),1,o_compound_wall);
	wall2.image_angle = angle;
	var wall3 = instance_create_depth(startingX+lengthdir_x(-128, angle), startingY+lengthdir_y(-128, angle), 1, o_compound_wall);
	wall3.image_angle = angle;

	//left corner
	var blCorner = instance_create_depth(startingX+lengthdir_x(-128-64-3, angle), startingY+lengthdir_y(-128-64-3, angle), 1, o_compound_corner);
	blCorner.image_angle = angle;

	//right corner
	var brCorner = instance_create_depth(startingX+lengthdir_x(128+64+4, angle), startingY+lengthdir_y(128+64+4, angle), 1, o_compound_corner);
	brCorner.image_angle = angle+90;

	//go up 4 first 
	var leftX = startingX+lengthdir_x(128+64+4, angle);
	var leftY = startingY+lengthdir_y(128+64+4, angle)
	var wall4 = instance_create_depth(leftX+lengthdir_x(4+64, angle+90), leftY+lengthdir_y(4+64, angle+90),1,o_compound_wall);
	wall4.image_angle = angle+90;
	var wall5 = instance_create_depth(leftX+lengthdir_x(4+64+128, angle+90), leftY+lengthdir_y(4+64+128, angle+90),1,o_compound_wall);
	wall5.image_angle = angle+90;
	var wall6 = instance_create_depth(leftX+lengthdir_x(4+64+128+128, angle+90), leftY+lengthdir_y(4+64+128+128, angle+90),1,o_compound_wall);
	wall6.image_angle = angle+90;

	//go up 4 on the other side
	var rightX = startingX+lengthdir_x(-128-64-3, angle);
	var rightY = startingY+lengthdir_y(-128-64-3, angle);
	var wall7 = instance_create_depth(rightX+lengthdir_x(4+64, angle+90), rightY+lengthdir_y(4+64, angle+90),1,o_compound_wall);
	wall7.image_angle = angle+90+180;
	var wall8 = instance_create_depth(rightX+lengthdir_x(4+64+128, angle+90), rightY+lengthdir_y(4+64+128, angle+90),1,o_compound_wall);
	wall8.image_angle = angle+90+180;
	var wall9 = instance_create_depth(rightX+lengthdir_x(4+64+128+128, angle+90), rightY+lengthdir_y(4+64+128+128, angle+90),1,o_compound_wall);
	wall9.image_angle = angle+90+180;

	//spawn top 3 walls
	var topX = startingX+lengthdir_x(4+128+128+128+4, angle+90);
	var topY = startingY+lengthdir_y(4+128+128+128+4, angle+90);
	var wall10 = instance_create_depth(topX,topY,1,o_compound_wall);
	wall10.image_angle = angle+180;
	var wall11 = instance_create_depth(topX+lengthdir_x(128 , angle+180),topY+lengthdir_y(128, angle+180),1,o_compound_wall);
	wall11.image_angle = angle+180;
	var wall12 = instance_create_depth(topX+lengthdir_x(-128, angle+180), topY+lengthdir_y(-128, angle+180), 1, o_compound_wall);
	wall12.image_angle = angle+180;

	//top left corner
	var tlCorner = instance_create_depth(topX+lengthdir_x(-128-64-4, angle), topY+lengthdir_y(-128-64-4, angle), 1, o_compound_corner);
	tlCorner.image_angle = angle-90;

	//top right corner
	var trCorner = instance_create_depth(topX+lengthdir_x(128+64+4, angle), topY+lengthdir_y(128+64+4, angle), 1, o_compound_corner);
	trCorner.image_angle = angle-180;

	//push them all onto the object stack
	ds_queue_enqueue(activationQueue, blCorner, brCorner, tlCorner, trCorner, accessInst, wall1, wall2, wall3, wall4, wall5, wall6, wall7, wall8, wall9, wall10, wall11, wall12);
	ds_stack_push(objectStack, blCorner, brCorner, tlCorner, trCorner, accessInst, wall1, wall2, wall3, wall4, wall5, wall6, wall7, wall8, wall9, wall10, wall11, wall12);

	*/

	//spawn the first five walls
	var wall1 = instance_create_depth(startingX,startingY,1,o_compound_wall);
	wall1.image_angle = angle;
	var wall2 = instance_create_depth(startingX+lengthdir_x(128 , angle),startingY+lengthdir_y(128, angle),1,o_compound_wall);
	wall2.image_angle = angle;
	var wall3 = instance_create_depth(startingX+lengthdir_x(-128, angle), startingY+lengthdir_y(-128, angle), 1, o_compound_wall);
	wall3.image_angle = angle;
	var wall4 = instance_create_depth(startingX+lengthdir_x(256, angle), startingY+lengthdir_y(256, angle), 1, o_compound_wall);
	wall4.image_angle = angle;
	var wall5 = instance_create_depth(startingX+lengthdir_x(-256, angle), startingY+lengthdir_y(-256, angle), 1, o_compound_wall);
	wall5.image_angle = angle;

	//left corner
	var blCorner = instance_create_depth(startingX+lengthdir_x(-128-128-64-3, angle), startingY+lengthdir_y(-128-128-64-3, angle), 1, o_compound_corner);
	blCorner.image_angle = angle;

	//right corner
	var brCorner = instance_create_depth(startingX+lengthdir_x(128+128+64+4, angle), startingY+lengthdir_y(128+128+64+4, angle), 1, o_compound_corner);
	brCorner.image_angle = angle+90;

	//go up 5 
	var leftX = startingX+lengthdir_x(128+128+64+4, angle);
	var leftY = startingY+lengthdir_y(128+128+64+4, angle)
	var wall6 = instance_create_depth(leftX+lengthdir_x(4+64, angle+90), leftY+lengthdir_y(4+64, angle+90),1,o_compound_wall);
	wall6.image_angle = angle+90;
	var wall7 = instance_create_depth(leftX+lengthdir_x(4+64+128, angle+90), leftY+lengthdir_y(4+64+128, angle+90),1,o_compound_wall);
	wall7.image_angle = angle+90;
	var wall8 = instance_create_depth(leftX+lengthdir_x(4+64+128+128, angle+90), leftY+lengthdir_y(4+64+128+128, angle+90),1,o_compound_wall);
	wall8.image_angle = angle+90;
	var wall9 = instance_create_depth(leftX+lengthdir_x(4+64+128+128+128, angle+90), leftY+lengthdir_y(4+64+128+128+128, angle+90), 1, o_compound_wall);
	wall9.image_angle = angle+90;
	var wall10 = instance_create_depth(leftX+lengthdir_x(4+64+128+128+128+128, angle+90), leftY+lengthdir_y(4+64+128+128+128+128, angle+90), 1, o_compound_wall);
	wall10.image_angle = angle+90;

	//go up 5 on the other side
	var rightX = startingX+lengthdir_x(-128-128-64-3, angle);
	var rightY = startingY+lengthdir_y(-128-128-64-3, angle);
	var wall11 = instance_create_depth(rightX+lengthdir_x(4+64, angle+90), rightY+lengthdir_y(4+64, angle+90),1,o_compound_wall);
	wall11.image_angle = angle+90+180;
	var wall12 = instance_create_depth(rightX+lengthdir_x(4+64+128, angle+90), rightY+lengthdir_y(4+64+128, angle+90),1,o_compound_wall);
	wall12.image_angle = angle+90+180;
	var wall13 = instance_create_depth(rightX+lengthdir_x(4+64+128+128, angle+90), rightY+lengthdir_y(4+64+128+128, angle+90),1,o_compound_wall);
	wall13.image_angle = angle+90+180;
	var wall14 = instance_create_depth(rightX+lengthdir_x(4+64+128+128+128, angle+90), rightY+lengthdir_y(4+64+128+128+128, angle+90), 1, o_compound_wall);
	wall14.image_angle = angle+90+180;
	var wall15 = instance_create_depth(rightX+lengthdir_x(4+64+128+128+128+128, angle+90), rightY+lengthdir_y(4+64+128+128+128+128, angle+90), 1, o_compound_wall);
	wall15.image_angle = angle+90+180;

	//spawn top 5 walls
	var topX = startingX+lengthdir_x(4+128+128+128+128+128+4, angle+90);
	var topY = startingY+lengthdir_y(4+128+128+128+128+128+4, angle+90);
	var wall16 = instance_create_depth(topX,topY,1,o_compound_wall);
	wall16.image_angle = angle+180;
	var wall17 = instance_create_depth(topX+lengthdir_x(128 , angle+180),topY+lengthdir_y(128, angle+180),1,o_compound_wall);
	wall17.image_angle = angle+180;
	var wall18 = instance_create_depth(topX+lengthdir_x(-128, angle+180), topY+lengthdir_y(-128, angle+180), 1, o_compound_wall);
	wall18.image_angle = angle+180;
	var wall19 = instance_create_depth(topX+lengthdir_x(256, angle+180), topY+lengthdir_y(256, angle+180), 1, o_compound_wall);
	wall19.image_angle = angle+180;
	var wall20 = instance_create_depth(topX+lengthdir_x(-256, angle+180), topY+lengthdir_y(-256, angle+180), 1, o_compound_wall);
	wall20.image_angle = angle+180;

	//top left corner
	var tlCorner = instance_create_depth(topX+lengthdir_x(-128-128-64-4, angle), topY+lengthdir_y(-128-128-64-4, angle), 1, o_compound_corner);
	tlCorner.image_angle = angle-90;

	//top right corner
	var trCorner = instance_create_depth(topX+lengthdir_x(128+128+64+4, angle), topY+lengthdir_y(128+128+64+4, angle), 1, o_compound_corner);
	trCorner.image_angle = angle-180;

	//push them all onto the object stack
	ds_queue_enqueue(activationQueue, blCorner, brCorner, tlCorner, trCorner, accessInst,wall1,wall2,wall3,wall4,wall5,wall6,wall7,wall8,wall9,wall10,wall11,wall12,wall13,wall14,wall15,wall16,wall17,wall18,wall19,wall20);
	ds_stack_push(objectStack, blCorner, brCorner, tlCorner, trCorner, accessInst, wall1,wall2,wall3,wall4,wall5,wall6,wall7,wall8,wall9,wall10,wall11,wall12,wall13,wall14,wall15,wall16,wall17,wall18,wall19,wall20);

	//******************
	//spawn broken walls
	//******************
	var wallX = startingX+lengthdir_x(74, angle)+lengthdir_x(128, angle+90);
	var wallY = startingY+lengthdir_y(74, angle)+lengthdir_y(128, angle+90);
	scr_createTownBlock2(wallX, wallY, angle, angle+90, 90, false, false);

	//**********
	//spawn cars
	//**********

	//for multiple strips:
	for(var i = 0; i < 3; i++){
		var carX = startingX+lengthdir_x(20+(i*100), angle);
		var carY = startingY+lengthdir_y(20+(i*100), angle);
	

		carNum = choose(1,2);
		for(c = 0; c <carNum; c++){
			if(c = 0)
				var carRange = irandom_range(60, 120);
			if(c = 1)
				var carRange = irandom_range(150,200);
	
			var car = instance_create_depth(carX+lengthdir_x(carRange, angle+90), carY+lengthdir_y(carRange, angle+90), 1, o_car);
			car.image_angle = irandom(360);
			scr_clipping_special(car, false);
			ds_stack_push(objectStack, car);
			ds_queue_enqueue(activationQueue, car);
		}

	}
	//***********
	//spawn tanks
	//***********
	var tankRange = irandom_range(300, 340);
	var tankX = startingX+lengthdir_x(60, angle)+lengthdir_x(tankRange, angle+90);
	var tankY = startingY+lengthdir_y(60, angle)+lengthdir_y(tankRange, angle+90);

	var tankRange2 = irandom_range(300,340);
	var tankX2 = startingX+lengthdir_x(120, angle)+lengthdir_x(tankRange2, angle+90);
	var tankY2 = startingY+lengthdir_y(120, angle)+lengthdir_y(tankRange2, angle+90);

	var tank1 = instance_create_depth(tankX, tankY, 1, o_tank);
	tank1.image_angle = angle+90+irandom_range(-45,45);

	var tank2 = instance_create_depth(tankX2, tankY2, 1, o_tank);
	tank2.image_angle = angle+90+irandom_range(-45, 45);
	scr_clipping_primary(tank1, false);
	scr_clipping_primary(tank2, false);
	ds_stack_push(objectStack, tank1, tank2);
	ds_queue_enqueue(activationQueue, tank1, tank2);

	/*
	tankNum = choose(1,2,3);
	for(t = 0; t<tankNum; t++){
		var tankRange = irandom_range(80, (128*5)-80);
	
		var tank = instance_create_depth(tankX+lengthdir_x(tankRange, angle+90), tankY+lengthdir_y(tankRange, angle+90), 1, o_tank);
		tank.image_angle = irandom(360);
		scr_clipping_primary(tank, false);
		ds_stack_push(objectStack, tank);
		ds_queue_enqueue(activationQueue, tank);
	}*/

	//*************
	//spawn turrets
	//*************
	//bottom left corner
	var blCTurret = instance_create_depth(startingX+lengthdir_x(-128-128-3, angle)+lengthdir_x(70, angle-90), startingY+lengthdir_y(-128-128-3, angle)+lengthdir_y(70, angle-90), 1, o_aaturret);
	blCTurret.image_angle = angle+90;
	//bottom right corner
	var brCTurret = instance_create_depth(startingX+lengthdir_x(128+128+4, angle)+lengthdir_x(70, angle-90), startingY+lengthdir_y(128+128+4, angle)+lengthdir_y(70, angle-90), 1, o_aaturret);
	brCTurret.image_angle = angle+90;
	//top left corner
	var tlCTurret = instance_create_depth(topX+lengthdir_x(-128-128-4, angle)+lengthdir_x(70, angle+90), topY+lengthdir_y(-128-128-4, angle)+lengthdir_y(70, angle+90), 1, o_aaturret);
	tlCTurret.image_angle = angle-90;
	//top right corner
	var trCTurret = instance_create_depth(topX+lengthdir_x(128+128+4, angle)+lengthdir_x(70, angle+90), topY+lengthdir_y(128+128+4, angle)+lengthdir_y(70, angle+90), 1, o_aaturret);
	trCTurret.image_angle = angle-90;

	//scr_clipping_primary(blCTurret, false);
	//scr_clipping_primary(brCTurret, false);
	//scr_clipping_primary(tlCTurret, false);
	//scr_clipping_primary(trCTurret, false);
	//ds_queue_enqueue(activationQueue, blCTurret, brCTurret, tlCTurret, trCTurret);
	ds_queue_enqueue(activationQueue, blCTurret, brCTurret, tlCTurret, trCTurret);
	ds_stack_push(objectStack, blCTurret, brCTurret, tlCTurret, trCTurret);


	var compoundCenX = startingX+lengthdir_x(((128*5)/2)+15, angle+90);
	var compoundCenY = startingY+lengthdir_y(((128*5)/2)+15, angle+90);
	var drone1 = instance_create_depth(compoundCenX+lengthdir_x(15, angle), compoundCenY+lengthdir_y(15, angle), 1, o_drone);
	var drone2 = instance_create_depth(compoundCenX, compoundCenY, 1, o_drone);
	var drone3 = instance_create_depth(compoundCenX+lengthdir_x(-15, angle), compoundCenY+lengthdir_y(-15, angle), 1, o_drone);
	var drone4 = instance_create_depth(compoundCenX+lengthdir_x(15, angle+90), compoundCenY+lengthdir_y(15, angle+90), 1, o_drone);

	ds_stack_push(objectStack, drone1, drone2, drone3, drone4);


}
