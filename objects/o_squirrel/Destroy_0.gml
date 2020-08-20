//override
if(!inTree && !global.generatingEnvironment) {
	instance_create_depth(x,y,depth,o_blood_spot);
			
	// Creates meat item
	var meat = instance_create_depth(x,y,depth, o_item);
		meat.image_index = item.meat;
		meat.direction = irandom_range(0,360);
		meat.bounce = true;
		meat.item_count = irandom_range(1,2);
		meat.durability = 11;
			
	// Create bone item
	var bone = instance_create_depth(x,y,depth, o_item);
		bone.image_index = item.bones;
		bone.direction = irandom_range(0,360);
		bone.bounce = true;
		bone.item_count = irandom_range(2,4);
}