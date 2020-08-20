global.spruce_tree_angle = 0;

//randomize rotation
image_angle = irandom(360);


// Chopping tree
hitCount = -1;

spawnCount = 0;

z = 0;

// Checking if squirrel is inside
isSquirrel = false;

// Wind
movement = random(pi*2);
value = 0.027 + random(0.005);

alarm[3] = 15;

// Flammable stuff
health_ = 11;
healthMax = health_;
birchFlame = false;
event_inherited();
	
angleT = -camera_get_view_angle(view_camera[0])+90;
alarm[0] = 1;