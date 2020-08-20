// Inherit the parent event
//event_inherited();

type = irandom_range(0,3); // 0 = spruce, 1 = birch

image_angle = irandom_range(0,360);

spawnCount = 0;

// Audio
emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_emitter_falloff(emitter, 50, 50, 1);