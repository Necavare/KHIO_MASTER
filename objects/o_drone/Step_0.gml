if(collision_circle(x,y,350,o_player,true, false))
	audio_emitter_position(drone, x, y, 0);

if(!global.generatingEnvironment && !global.isPaused && o_weather.isSnowing && alarm[4] == -1 && isExploded)
	alarm[4] = room_speed * 5;
/*var xTo = o_player.x;
var yTo = o_player.y;

image_angle = point_direction(x,y,xTo,yTo);
x += (xTo-x)*.0025;
y += (yTo-y)*.0025; */

if(!dead&& !isExploded) {
	if(dir != -1) {
		image_angle = dir;
		x += lengthdir_x(1.5, dir);
		y += lengthdir_y(1.5, dir);
	}

	if(!player && collision_circle(x,y,75,o_player,true, false))
		alarm[0] = 1;

	// Getting randomly targetted
	if(collision_circle(x,y,90,o_player,true, false) && canTarget) {
		playerTargeted = true;
		switch(irandom_range(0,1)) {
			case 0: audio_play_sound_on(drone, sn_drone_switch_1, 0, 1); break;
			case 1: audio_play_sound_on(drone, sn_drone_switch_2, 0, 1); break;
		}
		canTarget = false;
	}
	
	if(playerTargeted && place_meeting(x,y,o_player)) {
		playerTargeted = false;
		alarm[1] = 60 * 4;
		var grenade = instance_create_depth(x,y,depth,o_grenade);
		grenade.z = 130;
	} else if(playerTargeted){
		dir = point_direction(x,y,o_player.x,o_player.y);
		image_angle = dir;
		x += lengthdir_x(1.5, dir);
		y += lengthdir_y(1.5, dir);
	} 

	if(!audio_is_playing(sn_drone) && collision_circle(x,y,350,o_player,true, false))
		audio_play_sound_on(drone, sn_drone, 1, 1);
	else if(!collision_circle(x,y,350,o_player,true, false))
		audio_stop_sound(sn_drone);
	
}
	
// Shooting down
if((place_meeting(x,y,o_bullet) || place_meeting(x,y,o_buckshot)) && canHit) {
	repeat(5) {
		var chip = instance_create_depth(x, y, depth, o_particles);
		chip.drone = true;
	}
	canHit = false;
	alarm[2] = 60;
	health_-=3;
}

if(health_ <= 0 && !dead && !isExploded) {
	dead = true;
	sprite_index = s_drone_dead;
	lightOff = true;
	switch(irandom_range(0,1)) {
		case 0: audio_play_sound_on(drone, sn_drone_switch_1, 0, 1); break;
		case 1: audio_play_sound_on(drone, sn_drone_switch_2, 0, 1); break;
	}
	if(audio_is_playing(sn_drone))
		audio_stop_sound(sn_drone);
}
	
if(dead && z > 0 && !isExploded) {
	z -= 4;
	x += lengthdir_x(2, dir);
	y += lengthdir_y(2, dir);
}
	
if(z <= 0) {
	z = 0;
	if(alarm[3] == -1 && !isExploded)
		alarm[3] = 120;
}
	
if(explode && !isExploded) {
	audio_emitter_position(drone, x, y, 0);
	audio_play_sound_on(drone, sn_grenade, 0, 1);
	sprite_index = s_grenade_explode;
	isExploded = true;
	repeat(10) {
		var chip = instance_create_depth(x, y, depth, o_particles);
		chip.drone = true;
	}
	repeat(30) {
		instance_create_depth(x+irandom_range(-16,16), y+irandom_range(-16,16), depth, o_effect_fire);	
	}
	z = -14;
	
	if(collision_circle(x,y,45,o_player, true, true)) {
		o_player.isHit = true;
			
		o_player.objectHitting = self;
		o_player.health_-=25*o_player.armor;
	}
	
	// Creates item
	repeat(irandom_range(1,4)) {
		var metal = instance_create_depth(x,y,depth, o_item);
		metal.item_ = item.metal;
		metal.direction = irandom_range(0,360);
		metal.bounce = true;
	}
	
	// Creates grenades
	repeat(irandom_range(1,3)) {
		var grenade = instance_create_depth(x,y,depth, o_item);
		grenade.item_ = item.grenade;
		grenade.direction = irandom_range(0,360);
		grenade.bounce = true;
	}
}

if(isExploded) 
	depth = 8999;
else
	depth = -8999;