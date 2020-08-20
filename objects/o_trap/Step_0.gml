event_inherited();

//chance to spawn rabbits or squirrels
if(irandom(1000) == 0 && point_distance(x,y,o_player.x,o_player.y) > 400){
	var ranAng = irandom(360);
	var trapLen = irandom_range(5,15);
	instance_create_depth(x+lengthdir_x(ranAng, trapLen),y+lengthdir_y(ranAng, trapLen),1, choose(o_squirrel, o_rabbit));
}


if(buildZ < 0)
	buildZ+=.5;
	
// Destroys the instance
if(health_ <= 0)
	instance_destroy(self);

var instS = instance_place(x,y,o_squirrel);
var instR = instance_place(x,y,o_rabbit);

if(instS != noone && instS.isDead) {
	depth = instS.depth-1;
	isSet = false;
	if(!trapPlayed) {
		audio_emitter_position(spike, x, y, 0);
		audio_play_sound_on(spike, sn_spike_1, 0, 1);
		audio_play_sound_on(spike, sn_spike_2, 0, 1);
		trapPlayed = true;
	}
	
	sprite_index = s_trap_caught;
	instS.image_angle = image_angle;
	instS.x = x;
	instS.y = y;
}

if(instR != noone && instR.isDead) {
	depth = instR.depth-1;
	isSet = false;
	if(!trapPlayed) {
		audio_emitter_position(spike, x, y, 0);
		audio_play_sound_on(spike, sn_spike_1, 0, 1);
		audio_play_sound_on(spike, sn_spike_2, 0, 1);
		trapPlayed = true;
	}
	
	sprite_index = s_trap_caught;
	instR.image_angle = image_angle;
	instR.x = x;
	instR.y = y;
} else if(instR != noone && !instR.isDead) {
	instR.isDead = true;
	instR.isTrapped = true;
}

if(instS != noone)
	depth = instS.depth-1;
	
if(instR != noone)
	depth = instR.depth-1;

if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && canHit)
	take_hit(self, 0);
	
if(health_ <= 0)
	instance_destroy(self);