if(place_meeting(x,y,o_player) && canPickup && !o_player.isDead && !inventory_full(item_)) {
	instance_destroy(self);
	
	pickup_item(o_hud, item_, item_count, durability);
	
	item_notification(item_);
}

image_index = item_+1;
// Moving towards player if within range
if(collision_circle(o_player.x, o_player.y, 30, self, true, false) && !inventory_full(item_) && !o_player.isDead && !moving) {
	x+=lengthdir_x(.25, point_direction(x, y, o_player.x, o_player.y));
	y+=lengthdir_y(.25, point_direction(x, y, o_player.x, o_player.y));
}

if(wait || bounce)
	speed = 0;

// Delay until player can pickup item
if(canPickup && z <= 3 && !moving)
	image_angle += .5;

// Bouncing item
if(bounce) {
	if(z < bounceHeight)
		z+=2.5;
	else if(z >= bounceHeight)
		bounce = false;
} else if(!bounce && !bob && fountain == -1) {
	if(z > 0)
		z-=1.5;
	else if(z <= 0) {
		alarm[0] = 15;
		bob = true
		friction = .005;
	}
}

// Fountaining item
if(fountain && !wait) {
	// Moving up
	if(z < 20) 
		z+=1;
	else if(z >= 20)
		fountain = false;	
	
	if(s_ == 0) {
		var s = irandom_range(0, 2)
	
		if(s = 0) 
			s_ = .45;
		if(s = 1)
			s_ = .55;
		if(s = 2)
			s_ = .65;
	}
	
	speed = s_;
} else if(!fountain && !bob) {
	if(z > 0)
		z-=1.5;
	else if(z <= 0) {
		alarm[0] = 15;
		bob = true
		friction = .08;
	}
}

if(moving) {
	s_ = 1;

	speed = s_;
	
	moving = false;
	
	friction = .85;
} 

if(!moving)
	s_ = 0;

if(bounce == -1 && fountain == -1) {

	if(irandom_range(0,1) == 0)
		friction = .55;
	else
		friction = .65;
	
	// Floating
	if(!bob) {
		bob = true;
		alarm[0] = 15;
	}
}
	
if(long)
	friction = .35;