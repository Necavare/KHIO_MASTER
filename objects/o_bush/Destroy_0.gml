// Inherit the parent event
event_inherited();

if(!isOnFire && !global.generatingEnvironment) {
	
	if(isRabbit)
		instance_create_depth(x,y,depth,o_rabbit);

	var stick = instance_create_depth(x,y,depth,o_item);
	stick.image_index = item.stick;
	stick.direction = irandom_range(0,360);
	stick.bounce = true;
		
	if(!isEmpty) {
		var berry = instance_create_depth(x,y,depth,o_item);
		berry.image_index = item.berry;
		berry.direction = irandom_range(0,360);
		berry.bounce = true;
		berry.durability = 11;
	}
	
	if(isKey) {
		var fungi = instance_create_depth(x,y,depth, o_item);
			
		fungi.image_index = item.keycard;
				
		fungi.direction = irandom_range(0,360);
		fungi.fountain = true;
		fungi.wait = true;
		fungi.durability = 11;
	}
}