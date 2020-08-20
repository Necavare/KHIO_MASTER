// Inherit the parent event
event_inherited();

buildZ = 0;
keyCard = false;

health_ = 0;

// Audio
compound = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(compound, 25, 50, 1);