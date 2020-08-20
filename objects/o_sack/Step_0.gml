x += (o_player.x-x)*.6;
y += (o_player.y-y)*.6;

switch(o_player.img_index) {
	case 0: image_angle = -global.camera_angle+180; depth = o_player.depth + 1; break; // Down
	case 1: image_angle = -global.camera_angle+225; depth = o_player.depth + 1; break; // Down Right
	case 2: image_angle = -global.camera_angle-90; depth = o_player.depth - 1; break; // Right
	case 3: image_angle = -global.camera_angle-45; depth = o_player.depth - 1; break; // Up Right
	case 4: image_angle = -global.camera_angle; depth = o_player.depth - 1; break; // Up
	case 5: image_angle = -global.camera_angle+45; depth = o_player.depth - 1; break; // Up Left
	case 6: image_angle = -global.camera_angle+90; depth = o_player.depth - 1; break; // Left
	case 7: image_angle = -global.camera_angle+135; depth = o_player.depth + 1; break; // Down Left
}

if(sprite_index == s_sack_empty)
	if(o_player.bob)
		z = 8;
	else
		z = 7;
else {
	if(o_player.bob)
		z = 9;
	else
		z = 8;
}

if(logs == 0 && rocks == 0)
	sprite_index = s_sack_empty;
else if(logs == 1 && birch && !spruce)
	sprite_index = s_sack_wood_birch_one;
else if(logs == 1 && !birch && spruce)
	sprite_index = s_sack_wood_spruce_one;
else if(logs == 2 && birch && !spruce)
	sprite_index = s_sack_wood_birch_two;
else if(logs == 2 && !birch && spruce)
	sprite_index = s_sack_wood_spruce_two;
else if(logs == 2 && birch && spruce)
	sprite_index = s_sack_wood_both;
	
if(rocks == 1)
	sprite_index = s_sack_rocks_one;
if(rocks == 2)
	sprite_index = s_sack_rocks_two;
if(rocks == 3)
	sprite_index = s_sack_rocks_two;

// Drop logs and rocks	
if(!global.sack || o_player.isSitting || o_player.isSleeping || o_player.isRolling || o_player.isDead || o_player.isDying) {
	if(logs > 0 && birch && spruce) {
		var log = instance_create_depth(x,y,depth,o_spruce_log);
		log.stackCount = logs - 1;
		log.birch = true;
	} else if(logs > 0 && birch && !spruce) {
		var log = instance_create_depth(x,y,depth,o_birch_log);
		log.stackCount = logs - 1;
		log.birch = true;
	} else if(logs > 0 && !birch && spruce) {
		var log = instance_create_depth(x,y,depth,o_spruce_log);
		log.stackCount = logs - 1;
		log.spruce = true;
	}
		
	if(rocks > 0) {
		var rock = instance_create_depth(x,y,depth,o_rocks);
		rock.stackCount = rocks - 1;
	}
	
	global.sack = false;
	o_hud.sackInst = -1;
	instance_destroy(self);
}