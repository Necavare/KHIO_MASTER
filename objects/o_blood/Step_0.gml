if(isPoison && z != 0)
	sprite_index = s_poisondrop;

if(z > 0)
	z-=1;
	
if(z == 0 && sprite_index != s_blooddrip) {
	sprite_index = s_blooddrip;
	image_index = irandom_range(0,3);
}

if(z > 0){
	if(sprite_index == s_blooddrip && place_meeting(x,y,o_player))
		depth = o_player.depth+1;
	else
		depth = o_player.depth-1;
}
else{
	depth = 8997;//1 less then lake
}

if(isDestroying){
	imageAlpha_-=0.05;
	if(imageAlpha_ < 0)
		instance_destroy(self);
}
