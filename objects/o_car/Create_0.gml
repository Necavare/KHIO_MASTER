// Inherit the parent event
event_inherited();

var ran = irandom_range(0,1);

if(ran == 1)
	sprite_index = s_car_red;
	
// Crate inventory dimensions
width = 3;
height = 3;
z = 28;

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


// Add random
spawnItems = true;
if(room != r_title)
	alarm[2] = 60;

// Take all
takeAllSlot = instance_create_depth(x, y, 0, o_hud_slot);

canHit = true;

options = false;
optionsX = -1;
optionsY = -1;
mouseX = -1;
mouseY = -1;

health_ = 0;

// Audio
crate = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(crate, 25, 50, 1);