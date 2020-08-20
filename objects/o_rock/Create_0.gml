spawnCount = 0;

z = 12;

// Randomizing rock
health_ = 0;
if(irandom_range(0,2) == 1) {
	sprite_index = s_rock_small;
	health_ = 6;
}
else {
	sprite_index = s_rock_medium;
	health_ = 11;
}
healthMax = health_;

//randomize rotation
image_angle = irandom(360);

// Chopping particles
chopFrame = 0;
canHit = true;
light = -1;

event_inherited();
