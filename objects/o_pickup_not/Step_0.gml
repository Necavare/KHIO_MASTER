if(isMoving) {
	z += .4;

	if(dismiss)
		image_alpha -=.04;
	
	if(image_alpha <= 0)
		instance_destroy(self);
}
	
depth = o_player.depth;

if(!instance_exists(currentMoving) || (instance_exists(currentMoving) && currentMoving.image_alpha <= .92))
	isMoving = true;