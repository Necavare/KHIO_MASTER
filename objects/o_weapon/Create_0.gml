//add it to the activation queue in camera
	ds_queue_enqueue(o_camera.activationQueue, id);

weaponMode = 0; //0 is rifle, 1 is shotgun
if(global.itemEquipped == item.rifle){
	sprite_index = s_rifle;
	ejectlength = 5;
	barrellength = 18;
	weaponMode = 0;
	totalammo = 5;
	if(ds_map_exists(global.weaponAmmo, item.rifle)){
		ammo = ds_map_find_value(global.weaponAmmo, item.rifle);	
	}
	else{
		ammo = 0;
		ds_map_add(global.weaponAmmo, item.rifle, ammo);	
	}
}
if(global.itemEquipped == item.shotgun){
	sprite_index = s_shotgun_pump;
	ejectlength = 5;
	barrellength = 16;
	weaponMode = 1;
	totalammo = 8;
	if(ds_map_exists(global.weaponAmmo, item.shotgun)){
		ammo = ds_map_find_value(global.weaponAmmo, item.shotgun);	
	}
	else{
		ammo = 0;
		ds_map_add(global.weaponAmmo, item.shotgun, ammo);	
	}
}
if(global.itemEquipped == item.crossbow){
	ejectlength = 0;//no ejection
	barrellength = 9;
	weaponMode = 2;
	totalammo = 1;
	if(ds_map_exists(global.weaponAmmo, item.crossbow)){
		ammo = ds_map_find_value(global.weaponAmmo, item.crossbow);	
	}
	else{
		ammo = 0;
		ds_map_add(global.weaponAmmo, item.crossbow, ammo);	
	}
	if(ammo == 0)
		sprite_index = s_crossbow_shot;
	else
		sprite_index = s_crossbow;
}

//if
// Roughly the height of the players hands
z = 17;

//global.no_angle = true;
o_player.isHoldingWeapon = true
global.isHolding = false;
global.rifleHolding = true;


// Targeting objects
target = false;
targetObject = 0;
targetX = 0;
targetY = 0;
targetAngle = 0;
midOffsetX = 0;
midOffsetY = 0;
pdisOffset = 0;
prev_imageAngle = global.camera_angle;

//shooting
firex = 0;
firey = 0;
fireangle = 0;
canshoot = true;
canload = true;
smokedelay = 0;

//reloading
wBoltP = false;//wooden present
wPoisBoltP = false;//wooden poison present
fBoltP = false;// flame bolt present
bBoltP = false;//bone bolt present
bPoisBoltP = false;//bone poison bolt present
flBoltP = false;//flint bolt present
flPoisBoltP = false;//flint poison bolt present
mBoltP = false;//metal bolt present
mPoisBoltP = false;//metal poison bolt present
boltNum = 0;

//oltP = false; //bolt present
//pboltP = false; //poison bolt present

// 0 = normal, 1 = poison, 2= fire, 3=bone normal, 4=bone poison, 5=flint normal, 6= flint poison,
// 7 = metal normal, 8 = metal poison
boltLoad = 0;
highlightLoad = -1;

options = false;
optionsX = -1;
optionsY = -1;
mouseX = -1;
mouseY = -1;

firstLoad = false;
isloading = false;
loadingcancel = false;
showtext = false;

//running and bobbing alarm variable
runningPrev = false;
bobbing = false;
alarm[0] = 15; //doesnt matter until hes running
//alarmSet = false;
display_mouse_set(display_get_width()/2, display_get_height()/4);

// Audio
weapon = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(weapon, 25, 50, 1);

audio_emitter_position(weapon, x, y, 0);
switch(irandom_range(0,3)) {
	case 0: audio_play_sound_on(weapon, sn_equip_1, 0, 1); break;
	case 1: audio_play_sound_on(weapon, sn_equip_2, 0, 1); break;
	case 2: audio_play_sound_on(weapon, sn_equip_3, 0, 1); break;
	case 3: audio_play_sound_on(weapon, sn_equip_4, 0, 1); break;
}