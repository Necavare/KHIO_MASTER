// Setting random angle
image_angle = irandom_range(0,360);

// Variables for bouncing items or fountaining items
bounce = -1;
fountain = -1;

bounceHeight = irandom_range(12, 16);

wait = false;

s_ = 0;

// Z level
z = 0;

// Number of items in stack
item_ = 0;
item_count = 1;
durability = -1;

// Delay until player can pickup item
canPickup = false;
alarm[2] = 30;
bob = false;

speed = 5;

moving = false;

long = false;