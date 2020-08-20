
global.birch_tree_angle = 0;

//randomize rotation
image_angle = irandom(360);


// Chopping tree
hitCount = -1;

spawnCount = 0;

z = 0;

// Scale
scale = .6;

// Flammable stuff
health_ = 6;
healthMax = health_;
birchFlame = true;

event_inherited();