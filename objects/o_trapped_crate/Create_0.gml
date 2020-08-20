// Food decay
alarm[4] = 60;

event_inherited();

if(global.buildangle != -1) {
	image_angle = global.buildangle;
	global.buildangle = -1;
}
playerNear = true;
startingSprite = -1;

options = false;
optionsX = -1;
optionsY = -1;
mouseX = -1;
mouseY = -1;

// Crate inventory dimensions
width = 3;
height = 3;
slotZ = 28;

buildZ = -image_number;

singleClick = false;

mouseMoving = false;
gx = device_mouse_x_to_gui(0);
gy = device_mouse_y_to_gui(0);

// Creating slot instances for highlighting
slots = ds_grid_create(width, height);
ds_grid_clear(slots, false);

for(var ix = 0; ix < width; ix++)
	for(var iy = 0; iy < height; iy++) {
		var inst = instance_create_depth(x, y, 0, o_hud_slot);
		inst.ix = ix;
		inst.iy = iy;
		slots[# ix, iy] = inst;
	}

// Items
items = ds_grid_create(width, height);
ds_grid_clear(items, false);

// Item count
count = ds_grid_create(width, height);
ds_grid_clear(count, false);

// Item durability
durability = ds_grid_create(width, height);
ds_grid_clear(durability, -1);

// Used for hovering slots
animateSlot = false;
slotAnimated = -1;
holdSlot = false;
showDescription = false;

// Quickmoving items
quickMove = false;
quickMoveLoad = -1;
quickMoveItem = -1;
quickMoveCount = -1;
quickMoveDurability = -1;
quickMoveX = -1;
quickMoveY = -1;

// Take all
takeAllSlot = instance_create_depth(x, y, 0, o_hud_slot);

// Flammable stuff
z = 0
health_ = 5;
event_inherited();
isLong = true;
createAsh = false;

//enemy camp stuff
isCamp = true;

// Pickup items
alarm[3] = 60;

wallCycleList = ds_list_create();	
//things are added to this list in walls

isExploded = false;