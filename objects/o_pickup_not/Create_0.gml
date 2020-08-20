// Item to show
item_ = global.pickedup;

if(item_ == 0 || item_ == -1 || item_ == -2 || item_ == -3) {
	sprite_index = s_stat_notifications;
	item_ = -item_;
}

z = 0;

// Dismiss notification
dismiss = false

alarm[0] = 30;

image_angle = -global.camera_angle;

currentMoving = -1;
isMoving = true;