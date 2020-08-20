// Inherit the parent event
event_inherited();

buildZ = -image_number;


z = 26;
if(global.buildangle != -1 && !global.generatingEnvironment) {
	image_angle = global.buildangle;
	global.buildangle = -1;
}
if(global.generatingEnvironment && !global.loading && room!=r_testing){
	image_angle = o_generatorNStepNew.generatorWallAngle+180;	
}
else if(global.loadingWorld){
	image_angle = o_loadingStep.generatorWallAngle;
}



//create a minimap version (dont do it while dynamically generating tho)
if(!global.generatingEnvironment || global.loadingWorld){
	
	//take into account room shift
	var nx = x+ global.xoffset;
	var ny = y+global.yoffset;
        
	if (ny < 0) { ny += room_height; }
	if (ny >= room_height) { ny -= room_height; }
	if (nx < 0) { nx += room_width; }
	if (nx >= room_width) { nx -= room_width; }


	var miniValues;
	miniValues[0] = sprite_index; //set sprite for minimap
	miniValues[1] = image_angle; //set angle of rotation
	miniValues[2] = nx; //x position
	miniValues[3] = ny; //y position
	miniValues[4] = ny; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, id, miniValues);
	ds_list_add(global.activemm, id); //add it to list of active minimap symbols
	if(!global.generatingEnvironment){ // if its not being generated
		//scr_refresh_update(nx,ny);	//update minimap
	}
}



//createTower = true;
#region instBotLeftLog

var x_bll = x+lengthdir_x(-14, image_angle);
var y_bll = y+lengthdir_y(-14, image_angle);
instBotLeftLog = instance_create_depth(x_bll,y_bll,depth,o_tower_log);
instBotLeftLog.image_angle = image_angle;
	
if(!global.generatingEnvironment || global.loadingWorld){

	//create a minimap version (dont do it while dynamically generating tho)
	
	//take into account room shift
	var nx_bll = x_bll+ global.xoffset;
	var ny_bll = y_bll+global.yoffset;
        
	if (ny_bll < 0) { ny_bll += room_height; }
	if (ny_bll >= room_height) { ny_bll -= room_height; }
	if (nx_bll < 0) { nx_bll += room_width; }
	if (nx_bll >= room_width) { nx_bll -= room_width; }

	var miniValuesBLL;
	miniValuesBLL[0] = instBotLeftLog.sprite_index; //set sprite for minimap
	miniValuesBLL[1] = image_angle; //set angle of rotation
	miniValuesBLL[2] = nx_bll; //x position
	miniValuesBLL[3] = ny_bll; //y position
	miniValuesBLL[4] = ny_bll; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, instBotLeftLog, miniValuesBLL);
	ds_list_add(global.activemm, instBotLeftLog); //add it to list of active minimap symbols
}

#endregion

#region instBotRightLog
	
	//instBotRightLog = instance_create_depth(x+lengthdir_x(13, image_angle),y+lengthdir_y(13, image_angle),depth,o_tower_log);
	//instBotRightLog.image_angle = image_angle;
	
	var x_brl = x+lengthdir_x(13, image_angle);
	var y_brl = y+lengthdir_y(13, image_angle);
	instBotRightLog = instance_create_depth(x_brl,y_brl,depth,o_tower_log);
	instBotRightLog.image_angle = image_angle;
	
if(!global.generatingEnvironment || global.loadingWorld){

	//create a minimap version (dont do it while dynamically generating tho)
	
	//take into account room shift
	var nx_brl = x_brl+ global.xoffset;
	var ny_brl = y_brl+global.yoffset;
        
	if (ny_brl < 0) { ny_brl += room_height; }
	if (ny_brl >= room_height) { ny_brl -= room_height; }
	if (nx_brl < 0) { nx_brl += room_width; }
	if (nx_brl >= room_width) { nx_brl -= room_width; }

	var miniValuesBRL;
	miniValuesBRL[0] = instBotRightLog.sprite_index; //set sprite for minimap
	miniValuesBRL[1] = image_angle; //set angle of rotation
	miniValuesBRL[2] = nx_brl; //x position
	miniValuesBRL[3] = ny_brl; //y position
	miniValuesBRL[4] = ny_brl; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, instBotRightLog, miniValuesBRL);
	ds_list_add(global.activemm, instBotRightLog); //add it to list of active minimap symbols
}
#endregion

#region instTopLeftLog
	//instTopLeftLog = instance_create_depth(x+lengthdir_x(-14, image_angle),y+lengthdir_y(-14, image_angle),depth,o_tower_log);
	//instTopLeftLog.x += lengthdir_x(-27, image_angle-90);
	//instTopLeftLog.y += lengthdir_y(-27, image_angle-90);
	//instTopLeftLog.image_angle = image_angle;

	var x_tll = x+lengthdir_x(-14, image_angle)+lengthdir_x(-27, image_angle-90);
	var y_tll = y+lengthdir_y(-14, image_angle)+lengthdir_y(-27, image_angle-90);
	instTopLeftLog = instance_create_depth(x_tll,y_tll,depth,o_tower_log);
	instTopLeftLog.image_angle = image_angle;
	
if(!global.generatingEnvironment || global.loadingWorld){

	//create a minimap version (dont do it while dynamically generating tho)
	
	//take into account room shift
	var nx_tll = x_tll+ global.xoffset;
	var ny_tll = y_tll+ global.yoffset;
        
	if (ny_tll < 0) { ny_tll += room_height; }
	if (ny_tll >= room_height) { ny_tll -= room_height; }
	if (nx_tll < 0) { nx_tll += room_width; }
	if (nx_tll >= room_width) { nx_tll -= room_width; }

	var miniValuesTLL;
	miniValuesTLL[0] = instTopLeftLog.sprite_index; //set sprite for minimap
	miniValuesTLL[1] = image_angle; //set angle of rotation
	miniValuesTLL[2] = nx_tll; //x position
	miniValuesTLL[3] = ny_tll; //y position
	miniValuesTLL[4] = ny_tll; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, instTopLeftLog, miniValuesTLL);
	ds_list_add(global.activemm, instTopLeftLog); //add it to list of active minimap symbols
}
#endregion

#region instTopRightLog
	//instTopRightLog = instance_create_depth(x+lengthdir_x(13, image_angle),y+lengthdir_y(13, image_angle),depth,o_tower_log);
	//instTopRightLog.x += lengthdir_x(-27, image_angle-90);
	//instTopRightLog.y += lengthdir_y(-27, image_angle-90);
	//instTopRightLog.image_angle = image_angle;

	var x_trl = x+lengthdir_x(13, image_angle)+lengthdir_x(-27, image_angle-90);
	var y_trl = y+lengthdir_y(13, image_angle)+lengthdir_y(-27, image_angle-90);
	instTopRightLog = instance_create_depth(x_trl,y_trl,depth,o_tower_log);
	instTopRightLog.image_angle = image_angle;
	
if(!global.generatingEnvironment || global.loadingWorld){

	//create a minimap version (dont do it while dynamically generating tho)
	
	//take into account room shift
	var nx_trl = x_trl+ global.xoffset;
	var ny_trl = y_trl+global.yoffset;
        
	if (ny_trl < 0) { ny_trl += room_height; }
	if (ny_trl >= room_height) { ny_trl -= room_height; }
	if (nx_trl < 0) { nx_trl += room_width; }
	if (nx_trl >= room_width) { nx_trl -= room_width; }

	var miniValuesTRL;
	miniValuesTRL[0] = instTopRightLog.sprite_index; //set sprite for minimap
	miniValuesTRL[1] = image_angle; //set angle of rotation
	miniValuesTRL[2] = nx_trl; //x position
	miniValuesTRL[3] = ny_trl; //y position
	miniValuesTRL[4] = ny_trl; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, instTopRightLog, miniValuesTRL);
	ds_list_add(global.activemm, instTopRightLog); //add it to list of active minimap symbols
}

#endregion
	
#region instLadder
	//instLadder = instance_create_depth(x+lengthdir_x(2, image_angle-90),y+lengthdir_y(2, image_angle-90),depth,o_tower_ladder);
	//instLadder.image_angle = image_angle;

	var x_ladder = x+lengthdir_x(2, image_angle-90);
	var y_ladder = y+lengthdir_y(2, image_angle-90);
	instLadder = instance_create_depth(x_ladder,y_ladder,depth,o_tower_ladder);
	instLadder.image_angle = image_angle;
	
if(!global.generatingEnvironment || global.loadingWorld){

	//create a minimap version (dont do it while dynamically generating tho)
	
	//take into account room shift
	var nx_ladder = x_ladder+ global.xoffset;
	var ny_ladder = y_ladder+ global.yoffset;
        
	if (ny_ladder < 0) { ny_ladder += room_height; }
	if (ny_ladder >= room_height) { ny_ladder -= room_height; }
	if (nx_ladder < 0) { nx_ladder += room_width; }
	if (nx_ladder >= room_width) { nx_ladder -= room_width; }

	var miniValuesLadder;
	miniValuesLadder[0] = instLadder.sprite_index; //set sprite for minimap
	miniValuesLadder[1] = image_angle; //set angle of rotation
	miniValuesLadder[2] = nx_ladder; //x position
	miniValuesLadder[3] = ny_ladder; //y position
	miniValuesLadder[4] = ny_ladder; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, instLadder, miniValuesLadder);
	ds_list_add(global.activemm, instLadder); //add it to list of active minimap symbols
}
#endregion

#region instRoof

	//instRoof = instance_create_depth(x,y,depth,o_tower_roof);
	//instRoof.image_angle = image_angle;
	
	var x_roof = x;
	var y_roof = y;
	instRoof = instance_create_depth(x_roof,y_roof,depth,o_tower_roof);
	instRoof.image_angle = image_angle;
	
if(!global.generatingEnvironment || global.loadingWorld){

	//create a minimap version (dont do it while dynamically generating tho)
	
	//take into account room shift
	var nx_roof = x_roof+ global.xoffset;
	var ny_roof = y_roof+ global.yoffset;
        
	if (ny_roof < 0) { ny_roof += room_height; }
	if (ny_roof >= room_height) { ny_roof -= room_height; }
	if (nx_roof < 0) { nx_roof += room_width; }
	if (nx_roof >= room_width) { nx_roof -= room_width; }

	var miniValuesRoof;
	miniValuesRoof[0] = instRoof.sprite_index; //set sprite for minimap
	miniValuesRoof[1] = image_angle; //set angle of rotation
	miniValuesRoof[2] = nx_roof; //x position
	miniValuesRoof[3] = ny_roof; //y position
	miniValuesRoof[4] = ny_roof; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, instRoof, miniValuesRoof);
	ds_list_add(global.activemm, instRoof); //add it to list of active minimap symbols
}	
#endregion


playerGround = false;

canPickup = true;

options = false;
optionsX = -1;
optionsY = -1;
mouseX = -1;
mouseY = -1;
