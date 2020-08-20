//randomize rotation
image_angle = irandom(360);

// Flammable stuff
z = 0;
health_ = 3;
event_inherited();

// Wind
movement = random(pi*2);
value = 0.027 + random(0.005);

buildZ = -image_number;