o_player.isHoldingTool = true;
global.draw_cursor = false;

z = 17;
startZ = 17;
bob = true;
global.no_angle = true;

frame = 0;

aiming = false;
aimImage = 0;
range = -1; // 0 = long, 1 = medium, 2 = close

// Setting sprite and damage/durability for tool	
damage = 0; // How much health to take away each hit
finalDamage = 0;
durability = 0; // How much durability to take away each hit
poison = false;

canHit = true;

canBlockAgain = true;

// Variables for torch and throwables
isLit = true;

equipped = global.itemEquipped;
switch(global.itemEquipped) {
	case item.torch: sprite_index = s_torch_spruce; if(irandom_range(0,1) == 0) sprite_index = s_torch_birch; damage = 1; durability = 1; alarm[2] = 60; range = 0; break;
	case item.flare: sprite_index = s_flare; damage = 1; durability = 1; alarm[2] = 60; range = 0; break;
	case item.sword: sprite_index = s_sword; damage = 5; durability = .35; range = 0; break;
	case item.poisonsword: sprite_index = s_poisonsword; damage = 5; durability = .35; poison = true; range = 0; break;
	case item.poisonknife: sprite_index = s_poisonknife; damage = 3; durability = .35; poison = true; range = 0; break;
	case item.knife: sprite_index = s_knife; damage = 3; durability = .35; range = 0; break;
	case item.grenade: sprite_index = s_tool; image_index = 14; damage = 1; durability = .35; range = 0; break;
	case item.stoneaxeB: sprite_index = s_tool; image_index = 0; damage = 2; durability = .25; range = 0; break;
	case item.stoneaxeS: sprite_index = s_tool; image_index = 1; damage = 2; durability = .25; range = 0; break;
	case item.stonepicB: sprite_index = s_tool; image_index = 2; damage = 2; durability = .8; range = 0; break;
	case item.stonepicS: sprite_index = s_tool; image_index = 3; damage = 2; durability = .8; range = 0; break;
	case item.metalaxeB: sprite_index = s_tool; image_index = 4; damage = 3; durability = .25; range = 0; break;
	case item.metalaxeS: sprite_index = s_tool; image_index = 5; damage = 3; durability = .25; range = 0; break;
	case item.metalpicB: sprite_index = s_tool; image_index = 6; damage = 3; durability = .4; range = 0; break;
	case item.metalpicS: sprite_index = s_tool; image_index = 7; damage = 3; durability = .4; range = 0; break;
	case item.boneaxeB: sprite_index = s_tool; image_index = 8; damage = 3; durability = .6; range = 0; break;
	case item.boneaxeS: sprite_index = s_tool; image_index = 9; damage = 3; durability = .6; range = 0; break;
	case item.bonepicB: sprite_index = s_tool; image_index = 10; damage = 3; durability = .6; range = 0; break;
	case item.bonepicS: sprite_index = s_tool; image_index = 11; damage = 3; durability = .6; range = 0; break;
	case item.boneclubB: sprite_index = s_tool; image_index = 12; damage = 4; durability = .6; range = 0; break;
	case item.boneclubS: sprite_index = s_tool; image_index = 13; damage = 4; durability = .6; range = 0; break;
	case item.stoneShovelB: sprite_index = s_tool; image_index = 16; damage = 1; durability = .8; range = 0; break;
	case item.stoneShovelS: sprite_index = s_tool; image_index = 15; damage = 1; durability = .8; range = 0; break;
	case item.metalShovelB: sprite_index = s_tool; image_index = 18; damage = 2; durability = .4; range = 0; break;
	case item.metalShovelS: sprite_index = s_tool; image_index = 17; damage = 2; durability = .4; range = 0; break;
	case item.snowball: sprite_index = s_tool; image_index = 19; damage = 1; durability = 1; range = 0; break;
}

isHitting = false;

// Swinging
startingAngle = -116;
swingAngle = startingAngle;
side = false;

canSwing = true;
isSwung = false;
isStabbed = false;

isBlocking = false;

xx = 0;
yy = 0;

// Targeting objects
target = false;
targetObject = 0;
targetX = 0;
targetY = 0;
targetAngle = 0;

lanternSwing = false;

// Audio
tool = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(tool, 25, 50, 1);

audio_emitter_position(tool, x, y, 0);
switch(irandom_range(0,3)) {
	case 0: audio_play_sound_on(tool, sn_equip_1, 0, 1); break;
	case 1: audio_play_sound_on(tool, sn_equip_2, 0, 1); break;
	case 2: audio_play_sound_on(tool, sn_equip_3, 0, 1); break;
	case 3: audio_play_sound_on(tool, sn_equip_4, 0, 1); break;
}

repeat(10)
show_debug_message("EQUIPPING FOR SOME REASON!!!!!!!!!!!!!!!")

if(global.itemEquipped == item.torch)
	audio_play_sound(sn_swing_torch, 1, 0);
	
if(global.itemEquipped == item.flare)
	audio_play_sound(sn_flare_light, 1, 0);