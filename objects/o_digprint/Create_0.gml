objectIndex = -1;
changedAngle = false;

isRolling = false;
	
drawKick = true;
alarm[1] = 15;

kickIndex = 0;
alarm[2] = 10;
	
canDestroy = false;
alarm[3] = 120;

z = -4;

image_angle = -global.camera_angle;

if(choose(true, false))
	audio_play_sound(sn_dodge_2,1,0);
else
	audio_play_sound(sn_dodge_1,1,0);

repeat(15) {
	var chip = instance_create_depth(x, y, depth, o_particles);
	chip.snow = true;
}

var snow = instance_create_depth(x,y,depth, o_item);
snow.item_ = item.snowball;
snow.item_count = irandom_range(0,3);
snow.direction = irandom_range(0,360);
snow.bounce = true;