// Inherit the parent event
if(global.generatingEnvironment && !global.loadingWorld)
	image_angle = 60//irandom(360);
else{
	//image_angle = o_loadingStep.generatorWallAngle;
	image_angle = 60;
}

roofFrame = 32;
event_inherited(); // <-updates the map here

#region back wall (o_shed_back)

instBackWall = instance_create_depth(x+lengthdir_x(35, image_angle+90),y+lengthdir_y(35, image_angle+90),depth,o_shed_back);
instBackWall.shedPointer = id;
instBackWall.image_angle = image_angle;//180 is to flip it right
var xn = instBackWall.x+global.xoffset;
var yn = instBackWall.y+global.yoffset;
//create a minimap version (dont do it while dynamically generating tho)
if(!global.generatingEnvironment || global.loadingWorld){
        
	if (yn < 0) { yn += room_height; }
	if (yn >= room_height) { yn -= room_height; }
	if (xn < 0) { xn += room_width; }
	if (xn >= room_width) { xn -= room_width; }


	var miniValuesS0;
	miniValuesS0[0] = instBackWall.sprite_index; //set sprite for minimap
	miniValuesS0[1] = image_angle; //set angle of rotation
	miniValuesS0[2] = xn; //x position
	miniValuesS0[3] = yn; //y position
	miniValuesS0[4] = yn; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, instBackWall.id, miniValuesS0);
	ds_list_add(global.activemm, instBackWall.id); //add it to list of active minimap symbols
}
#endregion

#region shed pillar
//back right
var xp = x+lengthdir_x(34, image_angle+90)+lengthdir_x(22, image_angle);
var yp = y+lengthdir_y(34, image_angle+90)+lengthdir_y(22, image_angle);
instBR = instance_create_depth(xp, yp, depth, o_shed_pillar);
var xn1 = xp + global.xoffset;
var yn1 = yp + global.yoffset;
instBR.shedPointer = id;
instBR.image_angle = image_angle;
//create a minimap version (dont do it while dynamically generating tho)
if(!global.generatingEnvironment || global.loadingWorld){
	
	if (yn1 < 0) { yn1 += room_height; }
	if (yn1 >= room_height) { yn1 -= room_height; }
	if (xn1 < 0) { xn1 += room_width; }
	if (xn1 >= room_width) { xn1 -= room_width; }

	var miniValuesS1;
	miniValuesS1[0] = instBR.sprite_index; //set sprite for minimap
	miniValuesS1[1] = image_angle; //set angle of rotation
	miniValuesS1[2] = xn1; //x position
	miniValuesS1[3] = yn1; //y position
	miniValuesS1[4] = yn1; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, instBR.id, miniValuesS1);
	ds_list_add(global.activemm, instBR.id); //add it to list of active minimap symbols
}



//back left
xp = x+lengthdir_x(34, image_angle+90)+lengthdir_x(22, image_angle+180);
yp = y+lengthdir_y(34, image_angle+90)+lengthdir_y(22, image_angle+180);
instBL = instance_create_depth(xp, yp, depth, o_shed_pillar);
instBL.shedPointer = id;
instBL.image_angle = image_angle;
var xn2 = xp + global.xoffset;
var yn2 = yp + global.yoffset;
//create a minimap version (dont do it while dynamically generating tho)
if(!global.generatingEnvironment || global.loadingWorld){
        
	if (yn2 < 0) { yn2 += room_height; }
	if (yn2 >= room_height) { yn2 -= room_height; }
	if (xn2 < 0) { xn2 += room_width; }
	if (xn2 >= room_width) { xn2 -= room_width; }

	var miniValuesS2;
	miniValuesS2[0] = instBL.sprite_index; //set sprite for minimap
	miniValuesS2[1] = image_angle; //set angle of rotation
	miniValuesS2[2] = xn2; //x position
	miniValuesS2[3] = yn2; //y position
	miniValuesS2[4] = yn2; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, instBL.id, miniValuesS2);
	ds_list_add(global.activemm, instBL.id); //add it to list of active minimap symbols
}

//front right
xp = x+lengthdir_x(1, image_angle-90)+lengthdir_x(22, image_angle);
yp = y+lengthdir_y(1, image_angle-90)+lengthdir_y(22, image_angle);
instFR = instance_create_depth(xp, yp, depth, o_shed_pillar);
instFR.shedPointer = id;
instFR.image_angle = image_angle;
var xn3 = xp + global.xoffset;
var yn3 = yp + global.yoffset;
//create a minimap version (dont do it while dynamically generating tho)
if(!global.generatingEnvironment || global.loadingWorld){
        
	if (yn3 < 0) { yn3 += room_height; }
	if (yn3 >= room_height) { yn3 -= room_height; }
	if (xn3 < 0) { xn3 += room_width; }
	if (xn3 >= room_width) { xn3 -= room_width; }

	var miniValuesS3;
	miniValuesS3[0] = instFR.sprite_index; //set sprite for minimap
	miniValuesS3[1] = image_angle; //set angle of rotation
	miniValuesS3[2] = xn3; //x position
	miniValuesS3[3] = yn3; //y position
	miniValuesS3[4] = yn3; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, instFR.id, miniValuesS3);
	ds_list_add(global.activemm, instFR.id); //add it to list of active minimap symbols
}

//front left
xp = x+lengthdir_x(1, image_angle-90)+lengthdir_x(22, image_angle+180);
yp = y+lengthdir_y(1, image_angle-90)+lengthdir_y(22, image_angle+180)
instFL = instance_create_depth(xp, yp, depth, o_shed_pillar);
instFL.shedPointer = id;
instFL.image_angle = image_angle;
var xn4 = xp + global.xoffset;
var yn4 = yp + global.yoffset;
//create a minimap version (dont do it while dynamically generating tho)
if(!global.generatingEnvironment || global.loadingWorld){
        
	if (xn4 < 0) { yn4 += room_height; }
	if (yn4 >= room_height) { yn4 -= room_height; }
	if (xn4 < 0) { xn4 += room_width; }
	if (xn4 >= room_width) { xn4 -= room_width; }

	var miniValuesS4;
	miniValuesS4[0] = instFL.sprite_index; //set sprite for minimap
	miniValuesS4[1] = image_angle; //set angle of rotation
	miniValuesS4[2] = xn4; //x position
	miniValuesS4[3] = yn4; //y position
	miniValuesS4[4] = yn4; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, instFL.id, miniValuesS4);
	ds_list_add(global.activemm, instFL.id); //add it to list of active minimap symbols
}

#endregion

#region door (o_shed_door)
instDoor = instance_create_depth(x+lengthdir_x(-12, image_angle),y+lengthdir_y(-12, image_angle),depth,o_shed_door);
instDoor.shedPointer = id;
instDoor.image_angle = image_angle;
instDoor.startingAngle = image_angle;
var xn5 = instDoor.x + global.xoffset;
var yn5 = instDoor.y + global.yoffset;
//create a minimap version (dont do it while dynamically generating tho)
if(!global.generatingEnvironment || global.loadingWorld){
	
	if (yn5 < 0) { yn5 += room_height; }
	if (yn5 >= room_height) { yn5 -= room_height; }
	if (xn5 < 0) { xn5 += room_width; }
	if (xn5 >= room_width) { xn5 -= room_width; }

	var miniValues1;
	miniValues1[0] = instDoor.sprite_index; //set sprite for minimap
	miniValues1[1] = image_angle; //set angle of rotation
	miniValues1[2] = xn5; //x position
	miniValues1[3] = yn5; //y position
	miniValues1[4] = yn5; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, instDoor.id, miniValues1);
	ds_list_add(global.activemm, instDoor.id); //add it to list of active minimap symbols
}

#endregion

#region floor (o_shed_floor)
instFloor = instance_create_depth(x,y,depth,o_shed_floor);
instFloor.shedPointer = id;
instFloor.image_angle = image_angle;

//create minimap version for the roof created from floor
instFloor.instRoof.shedPointer = id;
instFloor.instRoof.image_angle = image_angle;
var xx = x+lengthdir_x(27,-camera_get_view_angle(view_camera[0])+90);
var yy = y+lengthdir_y(27,-camera_get_view_angle(view_camera[0])+90);
//create a minimap version
var xn6 = xx + global.xoffset;
var yn6 = yy + global.yoffset;
//create a minimap version (dont do it while dynamically generating tho)
if(!global.generatingEnvironment || global.loadingWorld){
	
	if (yn6 < 0) { yn6 += room_height; }
	if (yn6 >= room_height) { yn6 -= room_height; }
	if (xn6 < 0) { xn6 += room_width; }
	if (xn6 >= room_width) { xn6 -= room_width; }

	var dyShed = yn6;
	//if(image_angle >90 && image_angle < 270){
		dyShed = yn6+lengthdir_y(-64, -camera_get_view_angle(view_camera[0])+90);
		if (dyShed < 0) { dyShed += room_height; }
		if (dyShed >= room_height) { dyShed -= room_height; }
	//}
	
	var miniValues2;
	miniValues2[0] = instFloor.instRoof.sprite_index; //set sprite for minimap
	miniValues2[1] = image_angle; //set angle of rotation
	miniValues2[2] = xn6; //x position
	miniValues2[3] = yn6; //y position
	miniValues2[4] = dyShed; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, instFloor.instRoof.id, miniValues2);
	ds_list_add(global.activemm, instFloor.instRoof.id); //add it to list of active minimap symbols
}
#endregion

#region left side (o_shed_side)
instLeftSide = instance_create_depth(x+lengthdir_x(-21, image_angle),y+lengthdir_y(-21, image_angle),depth,o_shed_side);
instLeftSide.shedPointer = id;
instLeftSide.x = instLeftSide.x+lengthdir_x(16, image_angle+90);
instLeftSide.y = instLeftSide.y+lengthdir_y(16, image_angle+90);
instLeftSide.image_angle = image_angle;
var xn7 = instLeftSide.x + global.xoffset;
var yn7 = instLeftSide.y + global.yoffset;
//create a minimap version (dont do it while dynamically generating tho)
if(!global.generatingEnvironment || global.loadingWorld){
	
	if (yn7 < 0) { yn7 += room_height; }
	if (yn7 >= room_height) { yn7 -= room_height; }
	if (xn7 < 0) { xn7 += room_width; }
	if (xn7 >= room_width) { xn7 -= room_width; }

	var miniValues3;
	miniValues3[0] = instLeftSide.sprite_index; //set sprite for minimap
	miniValues3[1] = image_angle; //set angle of rotation
	miniValues3[2] = xn7; //x position
	miniValues3[3] = yn7; //y position
	miniValues3[4] = yn7; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, instLeftSide.id, miniValues3);
	ds_list_add(global.activemm, instLeftSide.id); //add it to list of active minimap symbols
}

#endregion

#region right side (o_shed_side)
instRightSide = instance_create_depth(x+lengthdir_x(21, image_angle),y+lengthdir_y(21, image_angle),depth,o_shed_side);
instRightSide.shedPointer = id;
instRightSide.x = instRightSide.x+lengthdir_x(16, image_angle+90);
instRightSide.y = instRightSide.y+lengthdir_y(16, image_angle+90);
instRightSide.image_angle = image_angle;
instRightSide.createChest = true;
var xn8 = instRightSide.x+global.xoffset;
var yn8 = instRightSide.y+global.yoffset;
//create a minimap version (dont do it while dynamically generating tho)
if(!global.generatingEnvironment || global.loadingWorld){
	
	if (yn8 < 0) { yn8 += room_height; }
	if (yn8 >= room_height) { yn8 -= room_height; }
	if (xn8 < 0) { xn8 += room_width; }
	if (xn8 >= room_width) { xn8 -= room_width; }

	var miniValues4;
	miniValues4[0] = instRightSide.sprite_index; //set sprite for minimap
	miniValues4[1] = image_angle; //set angle of rotation
	miniValues4[2] = xn8; //x position
	miniValues4[3] = yn8; //y position
	miniValues4[4] = yn8; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, instRightSide.id, miniValues4);
	ds_list_add(global.activemm, instRightSide.id); //add it to list of active minimap symbols
}

#endregion