// Inherit the parent event
if(isOnFire)
	event_inherited();

if(health_ <= 0) {
	audio_play_sound(sn_foliage_rustle_4, 1, 0);
	// Destroys the instance
	instance_destroy(self);
}

if(buildZ < 0)
	buildZ+=.5;