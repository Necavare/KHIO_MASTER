// Inherit the parent event
if(global.generatingEnvironment && !global.loadingWorld)
	image_angle = irandom(360);
else{
	image_angle = o_loadingStep.generatorWallAngle;
}

event_inherited();


#region door (o_house_door) NOTE: NO DOOR RN IS BAD
/*
instDoor = instance_create_depth(x,y,depth,o_house_door);
doorPointer = instDoor.id;
instDoor.housePointer = id; 
instDoor.image_angle = image_angle;
instDoor.startingAngle = image_angle;

if(!global.generatingEnvironment || global.loadingWorld){
	show_debug_message("creating door mm");
	var xn = x + global.xoffset;
	var yn = y + global.yoffset;
	//create a minimap version
	var miniValuesDoor;
	miniValuesDoor[0] = instDoor.sprite_index; //set sprite for minimap
	miniValuesDoor[1] = image_angle; //set angle of rotation
	miniValuesDoor[2] = xn; //x position
	miniValuesDoor[3] = yn; //y position
	miniValuesDoor[4] = yn; //general depth, some objects can set this to 0 or other small number if bottom layer
	ds_map_add(global.minimapVar, instDoor.id, miniValuesDoor);
	ds_list_add(global.activemm, instDoor.id); 
}*/
#endregion

#region back (o_house_back)

instBack = instance_create_depth(x+lengthdir_x(68, image_angle+90),y+lengthdir_y(68, image_angle+90),depth,o_house_back);
backPointer = instBack.id;
instBack.housePointer = id;
instBack.image_angle = image_angle;

if(!global.generatingEnvironment || global.loadingWorld){
	show_debug_message("creating back mm");
	var xn = instBack.x + global.xoffset;
	var yn = instBack.y + global.yoffset;
	
	if (yn < 0) { yn += room_height; }
	if (yn >= room_height) { yn -= room_height; }
	if (xn < 0) { xn += room_width; }
	if (xn >= room_width) { xn -= room_width; }
	
	//create a minimap version
	var miniValues1;
	miniValues1[0] = instBack.sprite_index; //set sprite for minimap
	miniValues1[1] = image_angle; //set angle of rotation
	miniValues1[2] = xn; //x position
	miniValues1[3] = yn; //y position
	miniValues1[4] = yn; //general depth, some objects can set this to 0 or other small number if bottom layer
	ds_map_add(global.minimapVar, instBack.id, miniValues1);
	ds_list_add(global.activemm, instBack.id); 
}

#endregion

#region side left (o_house_side)

instSideL = instance_create_depth(x+lengthdir_x(34, image_angle+90),y+lengthdir_y(34, image_angle+90),depth,o_house_side);
sideLPointer = instSideL.id;
instSideL.housePointer = id;
instSideL.x += lengthdir_x(-72, image_angle);
instSideL.y += lengthdir_y(-72, image_angle);
instSideL.image_angle = image_angle;

if(!global.generatingEnvironment || global.loadingWorld){
	show_debug_message("creating leftside mm");
	var xn2 = instSideL.x + global.xoffset;
	var yn2 = instSideL.y + global.yoffset;
	
	if (yn2 < 0) { yn2 += room_height; }
	if (yn2 >= room_height) { yn2 -= room_height; }
	if (xn2 < 0) { xn2 += room_width; }
	if (xn2 >= room_width) { xn2 -= room_width; }
	
	//create minimap value
	var miniValues2;
	miniValues2[0] = instSideL.sprite_index; //set sprite for minimap
	miniValues2[1] = image_angle; //set angle of rotation
	miniValues2[2] = xn2; //x position
	miniValues2[3] = yn2; //y position
	miniValues2[4] = yn2; //general depth, some objects can set this to 0 or other small number if bottom layer
	ds_map_add(global.minimapVar, instSideL.id, miniValues2);
	ds_list_add(global.activemm, instSideL.id); 
}

#endregion

#region side right (o_house_side)
instSideR = instance_create_depth(x+lengthdir_x(33, image_angle+90),y+lengthdir_y(33, image_angle+90),depth,o_house_side);
sideRPointer = instSideR.id;
instSideR.housePointer = id;
instSideR.x += lengthdir_x(63, image_angle);
instSideR.y += lengthdir_y(63, image_angle);
instSideR.image_angle = image_angle+180;
if(!global.generatingEnvironment || global.loadingWorld){
	show_debug_message("creating right side mm");
	var xn3 = instSideR.x + global.xoffset;
	var yn3 = instSideR.y + global.yoffset;
	
	if (yn3 < 0) { yn3 += room_height; }
	if (yn3 >= room_height) { yn3 -= room_height; }
	if (xn3 < 0) { xn3 += room_width; }
	if (xn3 >= room_width) { xn3 -= room_width; }
	//create minimap value
	var miniValues3
	miniValues3[0] = instSideR.sprite_index; //set sprite for minimap
	miniValues3[1] = instSideR.image_angle; //set angle of rotation
	miniValues3[2] = xn3; //x position
	miniValues3[3] = yn3; //y position
	miniValues3[4] = yn3; //general depth, some objects can set this to 0 or other small number if bottom layer
	ds_map_add(global.minimapVar, instSideR.id, miniValues3);
	ds_list_add(global.activemm, instSideR.id); 
}

#endregion

#region floor (o_house_floor)

instFloor = instance_create_depth(x,y,depth,o_house_floor);
floorPointer = instFloor.id;
instFloor.housePointer = id;
/*with(instDoor){
	housePointer.instFloor.doorPointer = id;
}*/
with(instBack){
	housePointer.instFloor.backPointer = id;
}
with(instSideL){
	housePointer.instFloor.sideLPointer = id;
}
with(instSideR){
	housePointer.instFloor.sideRPointer = id;
}
/*
instFloor.doorPointer = instDoor.id;
instFloor.backPointer = instBack.id;
instFloor.sideLPointer = instSideL.id;
instFloor.sideRPointer = instSideR.id;
*/


instFloor.image_angle = image_angle;
instRoof = instFloor.instRoof;
//create minimap version for the roof created from floor
instRoof.image_angle = image_angle;
instRoof.housePointer = id;

if(!global.generatingEnvironment || global.loadingWorld){
	show_debug_message("creating roof mm");
	var xx = x+lengthdir_x(38,-camera_get_view_angle(view_camera[0])+90);
	var yy = y+lengthdir_y(38,-camera_get_view_angle(view_camera[0])+90);
	var xn4 = xx + global.xoffset;
	var yn4 = yy + global.yoffset;
	if (yn4 < 0) { yn4 += room_height; }
	if (yn4 >= room_height) { yn4 -= room_height; }
	if (xn4 < 0) { xn4 += room_width; }
	if (xn4 >= room_width) { xn4 -= room_width; }
	
	var dyHouse = yn4;
	//if(image_angle >90 && image_angle < 270){
		dyHouse = yn+lengthdir_y(4, view_camera[0])+lengthdir_y(-99, -camera_get_view_angle(view_camera[0])+90);
		if (dyHouse < 0) { dyHouse += room_height; }
		if (dyHouse >= room_height) { dyHouse -= room_height; }
	//}
	//create a minimap version
	var miniValuesRoof;
	miniValuesRoof[0] = instRoof.sprite_index; //set sprite for minimap
	miniValuesRoof[1] = instRoof.image_angle; //set angle of rotation
	miniValuesRoof[2] = xn4; //x position
	miniValuesRoof[3] = yn4; //y position
	miniValuesRoof[4] = dyHouse; //general depth
	ds_map_add(global.minimapVar, instRoof.id, miniValuesRoof);
	ds_list_add(global.activemm, instRoof.id); 
}

#endregion

#region make a shed

if(global.generatingEnvironment && !global.loadingWorld){
	var shedLen = irandom_range(120,160);
	var shedAngle = irandom_range(-45,45);
	var shedX = x+lengthdir_x(shedLen,image_angle+90+shedAngle);
	var shedY = y+lengthdir_y(shedLen,image_angle+90+shedAngle);
	var objShed = instance_create_depth(shedX, shedY, 1, o_shed);
				
	//push all its parts
	ds_stack_push(o_generatorNStepNew.objectStack, objShed);
	ds_stack_push(o_generatorNStepNew.objectStack, objShed.instBackWall);
	ds_stack_push(o_generatorNStepNew.objectStack, objShed.instBR);
	ds_stack_push(o_generatorNStepNew.objectStack, objShed.instBL);
	ds_stack_push(o_generatorNStepNew.objectStack, objShed.instFL);
	ds_stack_push(o_generatorNStepNew.objectStack, objShed.instFR);
	ds_stack_push(o_generatorNStepNew.objectStack, objShed.instDoor);
	ds_stack_push(o_generatorNStepNew.objectStack, objShed.instLeftSide);
	ds_stack_push(o_generatorNStepNew.objectStack, objShed.instRightSide);
	ds_stack_push(o_generatorNStepNew.objectStack, objShed.instFloor);
	ds_stack_push(o_generatorNStepNew.objectStack, objShed.instFloor.instRoof);	
		
	ds_queue_enqueue(o_generatorNStepNew.floorHouseQueue, objShed.instFloor);
	scr_clipping_primary(objShed.instFloor, true);

}
#endregion