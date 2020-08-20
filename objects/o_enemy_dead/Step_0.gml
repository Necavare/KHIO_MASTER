//depth = blood_id.depth-1;
#region Image Indexing

// Changing the player index when camera is rotated left.
if(global.dir > dir_ref)
	img_index++;	

// Changing the player index when camera is rotated right.
if(global.dir < dir_ref)
	img_index--;	

// Exceptions for the camera rotation.
if(global.dir == 7 && dir_ref == 0)
	img_index = img_index - 2;
		
if(global.dir == 0 && dir_ref == 7)
	img_index = img_index + 2;
		
if(img_index >= 8)
	img_index = 0;
		
if(img_index < 0)
	img_index = 7;

// Setting direction reference to the global.dir.
if(global.dir != dir_ref)
	dir_ref = global.dir;
	

#endregion

if(holdSlot && alarm[1] == -1)
	alarm[1] = 5;

if(startingSprite == -1)
	startingSprite = sprite_index;
	
if(health_ <= 0)
	instance_destroy(self);
	
if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && health_ > 0)
	take_hit(self, 3);