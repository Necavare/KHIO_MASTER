// Inherit the parent event
event_inherited();

//check if player is in range
if(ds_list_find_value(global.campCol, campId) == 0){
	if(collision_circle(x,y, 150, o_player, false, false)){
		ds_list_set(global.campCol, campId, 1);
		
		global.enemyMap = true;
		o_hud.enemyMapTime = 0;
	}
}


if(!upgraded) {
	/*if(!isOnFire && logs > 0) {
		health_ = 22*logs;
	} else */
	
	if(logs <= 0)
		isOnFire = false;
	
	
} else if(upgraded)
	isOnFire = false;
	
if(buildZ < 0)
	buildZ+=.5;
	
// Destroys the instance
if(health_ <= 0)
	instance_destroy(self);
	
if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && canHit && !upgraded) {
	take_hit(self, 0);
	logs = (health_ - 5) / 2;
} else if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && canHit && upgraded)
	take_hit(self, 2);

if(health_ > 5 && lastLogs > round(logs) && !isOnFire) {
	// Creates item
	var plank = instance_create_depth(x,y,depth, o_item);
	plank.image_index = item.planks;
	plank.direction = irandom_range(0,360);
	plank.bounce = true;
	lastLogs = round(logs);
} 

for(i = 0; i < array_length_1d(logType); i++) {
	if(i > logs)
		logType[i] = -1;
}

if(health_ < 15)
	upgraded = false;

if(logs <= 0)
	solid = false;
else
	solid = true;

