//spawn weapons
	var weaponDur = choose(1,2,2,3,3,3,3,3,4,4,4,5,5,6);
	var ranAngle = irandom_range(0, 360);
	var ranX = x+lengthdir_x(10, ranAngle);
	var ranY = y+lengthdir_y(10, ranAngle);
	if(enemy_type == 0){//sword man
		// Creates sword
		var sword = instance_create_depth(ranX,ranY,depth, o_item);
		sword.durability = weaponDur;
		sword.item_ = item.sword;
		sword.direction = ranAngle;
		sword.bounce = true;
		//pickup_item(self, item.sword, 1, weaponDur);
	}
	if(enemy_type == 1){//bow man
		// Creates bow
		var bow = instance_create_depth(ranX,ranY,depth, o_item);
		bow.durability = weaponDur;
		bow.item_ = item.crossbow;
		bow.direction = ranAngle;
		bow.bounce = true;
		var arrowNum = choose(2,2,2,3,3,3,3,3,4,4,4,4,4,4,5,5,6,6,7,8);	
		pickup_item(self, item.bolt, arrowNum);
		//pickup_item(self, item.crossbow, 1, weaponDur);
	}
	
if(spawnItems){
	// First decided how many slots should be filled
	var itemCount = irandom_range(2,4);
	var isMap = false;

	repeat(itemCount){
		// Randomize items durability
		var itemDur = choose(5,5,6,6,6,7,7,7,7,8,8,9,10,11);
	
		var itemChance = irandom(99);
		
		if(itemChance < 10 && !isMap){//10% map
			pickup_item(self, item.enemymap, 1);
			isMap = true;
		}else if(itemChance < 25){// 15 % bandage
			pickup_item(self, item.bandage, choose(1,1,1,2,2,2,2,2,2,3,3)); 
		}else if(itemChance < 40){//15 % splint
			pickup_item(self, item.splint, 1);
		}else if(itemChance < 80){//40% tool and knife
			if(itemChance < 50){//10% knife
				if(choose(false,true))
					pickup_item(self, item.poisonknife, 1, itemDur);
				else
					pickup_item(self, item.poisonknife, 1, itemDur);
			}
			else if(itemChance <55){//5% chest
				pickup_item(self, item.metalchest, 1, itemDur);
			}
			else if(itemChance < 60){//5% head
				pickup_item(self, item.metalhead, 1, itemDur);	
			}
			else if(itemChance < 70){//10% axe
				pickup_item(self, choose(item.metalaxeS, item.metalaxeB), 1, itemDur);	
			}
			else if(itemChance < 80){//10% pic
				pickup_item(self, choose(item.metalpicS, item.metalpicB), 1, itemDur);			
			}
		}else if(itemChance<90){//10% flare
			pickup_item(self, item.flare, choose(1,1,1,2,2,3), 11);
		}else if(itemChance < 95){//5 % poisio
			pickup_item(self, item.poison, choose(1,1,2,2,3,3,4,4,5));
		}else if(itemChance < 100){//5 % lantern	
			pickup_item(self, item.lantern, 1, itemDur);
		}
	}

}