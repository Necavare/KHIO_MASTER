alarm[4] = 60;

// Player animations/drawing
depth = 9000;

// Direction
img_index = 5;
dir_ref = 0;

//***************
// chest stuff
//***************
spawnCount = 0;

z = 12;
health_ = 10;

options = false;
optionsX = -1;
optionsY = -1;
mouseX = -1;
mouseY = -1;

// Crate inventory dimensions
width = 2;
height = 3;
z = 28;

singleClick = false;

playerNear = true;

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

// Take all
takeAllSlot = instance_create_depth(x, y, 0, o_hud_slot);

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

if(!global.loadingWorld)
	alarm[2] = 10;

//global vals
global.swapX = -1;
global.swapY = -1;
global.swapItemGrid = -1;
global.swapCountGrid = -1;
global.swapDurabilityGrid = -1;

