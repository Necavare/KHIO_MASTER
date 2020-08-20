/// @description spawn enemies to attack or that just loot it
show_debug_message("alarm 5 triggered");

// if player is far away 
if(point_distance(x,y,o_player.x, o_player.y) >= 500){
	if(!wallTimeOffset){
		//5 minutes * every wall cycle
		alarm[5] = 60*60*5*ds_list_size(cycleList);	
		wallTimeOffset = true;
	}
	else{
	
		//shuffle list
		ds_list_shuffle(surroundingWalls);
	
		//for every cycle in the surrounding area
		for(var ci = 0; ci < ds_list_size(cycleList); ci++){
			show_debug_message("cycle list loop");
			//find the first of that cycle and destroy it
			for(var ci2 = 0; ci2 < ds_list_size(surroundingWalls); ci2++){
				show_debug_message("wall loop");
				var curWInst3 = ds_list_find_value(surroundingWalls, ci2);
				if(curWInst3.cycleId == ds_list_find_value(cycleList, ci) && (curWInst3.isWall || !curWInst3.cycleId.upgraded) ){
					show_debug_message("destroy wall");
					instance_activate_object(curWInst3);
					instance_destroy(curWInst3);
					ds_list_delete(surroundingWalls, ci2);
					ci2 = ds_list_size(surroundingWalls);	
				}
			}	
		}
	
		//spawn enemies at the chest and make them cowardly
		var enemyAng = irandom(360);
		var enemyInst = instance_create_depth(x+lengthdir_x(8, enemyAng),y+lengthdir_y(8, enemyAng),1,o_enemySword);
		enemyInst.cowardlyFellow = true;
		var ranY1 = choose(0,1,2);
		if(items[# 0, ranY1] != false){
			enemyInst.item1 = items[# 0, ranY1];
			enemyInst.item1Dur = durability[# 0, ranY1];
			enemyInst.item1Count = count[# 0, ranY1];
		
			remove_item(self, 0, ranY1, count[# 0, ranY1]);
		}
		var ranY2 = choose(0,1,2);
		if(items[# 1, ranY2] != false){
			enemyInst.item2 = items[# 1, ranY2];
			enemyInst.item2Dur = durability[# 1, ranY2];
			enemyInst.item2Count = count[# 1, ranY2];
		
			remove_item(self, 1, ranY2, count[# 1, ranY2]);
		}
		var ranY3 = choose(0,1,2);
		if(items[# 2, ranY3] != false){
			enemyInst.item3 = items[# 2, ranY3];
			enemyInst.item3Dur = durability[# 2, ranY3];
			enemyInst.item3Count = count[# 2, ranY3];
	
			remove_item(self, 2, ranY3, count[# 2, ranY3]);
		}
		
		wallTimeOffset = false;
	}
}
else{
	var enemyAng = 360;
	
	var enemyInst1 = instance_create_depth(x+lengthdir_x(200, enemyAng), y+lengthdir_y(200, enemyAng), 1, o_enemySword);
	var enemyInst2 = instance_create_depth(x+lengthdir_x(200, enemyAng+15), y+lengthdir_y(200, enemyAng+15), 1, o_enemySword);
	var enemyInst3 = instance_create_depth(x+lengthdir_x(200, enemyAng-15), y+lengthdir_y(200, enemyAng-15), 1, o_enemySword);
	enemyInst1.playerDetected = true;
	enemyInst2.playerDetected = true;
	enemyInst3.playerDetected = true;
	
}
