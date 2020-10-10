if(ds_stack_empty(global.newGamePlusItemList)){
	
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

	// Chance to pickup berries
	pickup_item(self, item.berry, irandom_range(0,4), 5);
	
	// Chance to pickup bandage
	pickup_item(self, item.bandage, irandom_range(0,2));
	
	// Chance to spawn with torch
	pickup_item(self, item.torch, 1, irandom_range(6,9));
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
	if(itemNum < 4) {
	// Chance to pickup berries
	pickup_item(self, item.berry, irandom_range(0,4), 5);
	
	// Chance to pickup bandage
	pickup_item(self, item.bandage, irandom_range(0,2));
	
	// Chance to spawn with torch
	pickup_item(self, item.torch, 1, irandom_range(6,9));
	
	}
	
}