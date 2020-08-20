// Food decay
alarm[7] = 60;

event_inherited();

if(global.buildangle != -1) {
	image_angle = global.buildangle;
	global.buildangle = -1;
}

isCamp = false;

buildZ = -image_number;

hotCoals = false;
coalOpacity = 1;
opswitch = true;

options = false;
optionsX = -1;
optionsY = -1;
mouseX = -1;
mouseY = -1;

// Crate inventory dimensions
width = 1;
height = 1;
z = 28;

singleClick = false;

mouseMoving = false;
gx = device_mouse_x_to_gui(0);
gy = device_mouse_y_to_gui(0);

// Creating slot instances for highlighting
slots = ds_grid_create(width, height);
ds_grid_clear(slots, false);

for(var ix = 0; ix < width; ix++){
	for(var iy = 0; iy < height; iy++) {
		var inst = instance_create_depth(x, y, 0, o_hud_slot);
		inst.ix = ix;
		inst.iy = iy;
		slots[# ix, iy] = inst;
	}
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

// Cooking/Fire variables
logCount = 0;
isLit = false;

isBloomery = -1;
canAdd = true;
isSulfur = 0;
isMetal = 0;

spawnOdds = 0;

spawnStartingEnemy = false;

bloomeryDoOnce = false; //minimap update for bloomery upgrade
alarm[5] = 240;

health_ = 5;
canHit = true;

fire = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(fire, 25, 50, 1);

alarm[8] = 1;