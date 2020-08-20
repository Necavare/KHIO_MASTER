//check if enemies should spawn
if(isBloomery == 32 && isLit){
	//chance to not spawn enemies
	if(irandom(100) > spawnOdds)
		spawnOdds+=5;
	else{//spawn enemies
		
		show_debug_message("spawning enemies");
		
		/*
		var nearest1 = -1;
		var nearest2 = -1;
		var nearest3 = -1
		
		instance_activate_object(o_enemySword);
		instance_activate_object(o_enemyBow);
		*/
		
		//find three enemies nearby
		var nearest1 = -1;
		var nearest2 = -1;
		var nearest3 = -1;
		
		var nearest1X = 0;
		var nearest1Y = 0;
		
		var nearest2X = 0;
		var nearest2Y = 0;
		
		var nearest3X = 0;
		var nearest3Y = 0;
		
		var playerX = x;
		var playerY = y;
		
		for(var i = 3; i <ds_list_size(global.enemyInstList); i++){
			var currInst = ds_list_find_value(global.enemyInstList, i);
			var currX = ds_list_find_value(global.enemyXList, i);
			var currY = ds_list_find_value(global.enemyYList, i);
			var pointDisCurr = point_distance(playerX, playerY, currX, currY);
			
			if(pointDisCurr > 200){
				
				if(nearest1 == -1){
					nearest1 = currInst;
					nearest1X = currX;
					nearest1Y = currY;
					//show_debug_message("initialize nearest1");
				}
				else if(nearest2 == -1 && currInst != nearest1){
					nearest2 = currInst;
					nearest2X = currX;
					nearest2Y = currY;
					//show_debug_message("initialize nearest2");
				}
				else if(nearest3 == -1 && currInst != nearest2){
					nearest3 = currInst;
					nearest3X = currX;
					nearest3Y = currY;
					//show_debug_message("initialize nearest3");
				}
				else{
					if(pointDisCurr < point_distance(playerX, playerY, nearest1X, nearest1Y)){
						nearest1 = currInst;
						nearest1X = currX;
						nearest1Y = currY;
						//show_debug_message("nearest1X: "+string(nearest1X));
						//show_debug_message("nearest1Y: "+string(nearest1Y));
					}
					else if(pointDisCurr < point_distance(playerX, playerY, nearest2X, nearest2Y)){
						nearest2 = currInst;
						nearest2X = currX;
						nearest2Y = currY;
						//show_debug_message("nearest2X: "+string(nearest2X));
						//show_debug_message("nearest2Y: "+string(nearest2Y));
					}
					else if(pointDisCurr < point_distance(playerX, playerY, nearest2X, nearest2Y)){
						nearest3 = currInst;
						nearest3X = currX;
						nearest3Y = currY;
						//show_debug_message("nearest3X: "+string(nearest3X));
						//show_debug_message("nearest3Y: "+string(nearest3Y));
					}
				}
				
			}
		}
		
		//place the enemies outside of enemy viewarea and make them detect him
		var nearest1Ang = irandom(360);
		var nearest2Ang = irandom(360);
		var nearest3Ang = irandom(360);
		
		var nearest1XNew = playerX + lengthdir_x(nearest1Ang, 100);
		var nearest1YNew = playerY + lengthdir_y(nearest1Ang, 100);
		
		var nearest2XNew = playerX + lengthdir_x(nearest2Ang, 100);
		var nearest2YNew = playerY + lengthdir_y(nearest2Ang, 100);
		
		var nearest3XNew = playerX + lengthdir_x(nearest3Ang, 100);
		var nearest3YNew = playerY + lengthdir_y(nearest3Ang, 100);
		
		if(nearest1 != -1){
			//show_debug_message(object_get_name(nearest1));
			//show_debug_message("nearest1 spawn");
			instance_activate_object(nearest1);
			with(nearest1){
				//show_debug_message(object_get_name(id));
				x = nearest1XNew;
				y = nearest1YNew;
				playerDetected = true;
			}
			/*
			near1Pointer.x = nearest1XNew;
			near1Pointer.y = nearest1YNew;
			near1Pointer.playerDetected = true;*/
		}
		if(nearest2 != -1){
			//show_debug_message(object_get_name(nearest2));
			//show_debug_message("nearest2 spawn");
			instance_activate_object(nearest2);
			with(nearest2){
				//show_debug_message(object_get_name(id));
				x = nearest2XNew;
				y = nearest2YNew;
				playerDetected = true;
			}
			/*
			near2Pointer.x = nearest2XNew;
			near2Pointer.y = nearest2YNew;
			near2Pointer.playerDetected = true;*/
			//instance_activate_object(nearest2);
		}
		if(nearest3 != -1){
			//show_debug_message(object_get_name(nearest3));
			//show_debug_message("nearest3 spawn");
			instance_activate_object(nearest3);
			with(nearest3){
				//show_debug_message(object_get_name(id));
				x = nearest3XNew;
				y = nearest3YNew;
				playerDetected = true;
			}
			/*
			near3Pointer.x = nearest3XNew;
			near3Pointer.y = nearest3YNew;
			near3Pointer.playerDetected = true;*/
			//instance_activate_object(nearest3);
		}
		
		spawnOdds = -100;
	}
}

alarm[5] = 240;