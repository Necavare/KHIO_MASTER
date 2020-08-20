// Wind
movement = random(pi*2);
value = 0.027 + random(0.005);

// Randomizing grass type
switch(irandom_range(0,4)) {
	case 0: sprite_index = s_grass; image_angle = choose(0, 90, 180, 270); break;
	case 1: sprite_index = s_grass1; image_angle = choose(0, 90, 180, 270); break;
	case 2: sprite_index = s_grass_long; image_angle = choose(0, 90, 180, 270); break;
	case 3: sprite_index = s_grass_long1; image_angle = choose(0, 90, 180, 270); break;
	case 4: sprite_index = s_grass_snow; image_angle = choose(0, 90, 180, 270); break;
}

// Flammable stuff
event_inherited();
z = 0;
health_ = 1;

// Audio
emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_emitter_falloff(emitter, 50, 50, 1);