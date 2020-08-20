if(ds_stack_empty(global.newGamePlusItemList)){
	pickup_item(self, item.treasureMap, 1);
	pickup_item(self, item.enemymap, 1);
	
	//pickup_item(self, item.metalaxeS, 1, choose(4,5,6));
	pickup_item(self, item.guide, 1);
	
	//create axe:
	var ranDir = irandom(360);
	var ranX = x+lengthdir_x(10,ranDir);
	var ranY = y+lengthdir_y(10, ranDir);
	var axe = instance_create_depth(ranX,ranY,depth, o_tool_thrown);
	axe.sprite_index = s_tool; 
	axe.image_index = 5;
	axe.angle = -global.camera_angle+90;
	axe.durability = choose(4,5,6);
	axe.item_ = item.metalaxeS;
	axe.count = 1;
	axe.z = 0;
	axe.isTutorial = true;

	//pickup_item(self, item.treasureMap, 1);
	
	// Chance to pickup berries
	repeat(irandom_range(0,2)){
		pickup_item(self, item.berry, 1, 5);
	}
	// Chance to pickup bandage
	repeat(irandom_range(0,1)){
		pickup_item(self, item.bandage, 1);
	}
	// Chance to spawn with torch
	if(irandom_range(0, 10) == 0){
		pickup_item(self, item.torch, 1, 11);
	}
}
else{
	var itemNum = 0;
	while(!ds_stack_empty(global.newGamePlusItemList)  && itemNum<6){
		if(ds_stack_size(global.newGamePlusItemList) <= (6-itemNum) || irandom(99) < 50){
			pickup_item(self, ds_stack_pop(global.newGamePlusItemList),
			ds_stack_pop(global.newGamePlusCountList),ds_stack_pop(global.newGamePlusDurList));
			itemNum++;
		}
		else{
			ds_stack_pop(global.newGamePlusCountList);
			ds_stack_pop(global.newGamePlusItemList);
			ds_stack_pop(global.newGamePlusDurList);
		}
	}
	
	pickup_item(self, item.treasureMap, 1);
	// Chance to pickup berries
	repeat(irandom_range(0,2)){
		pickup_item(self, item.berry, 1, 5);
	}
	// Chance to pickup bandage
	repeat(irandom_range(0,1)){
		pickup_item(self, item.bandage, 1);
	}
	// Chance to spawn with torch
	if(irandom_range(0, 10) == 0){
		pickup_item(self, item.torch, 1, 11);
	}
	
	
	
	
}