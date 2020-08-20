var angle = -global.camera_angle+90;
var oX = x;
var oY = y;
	// Actually drawing
for (var i = 0; i < image_number; i++) {
	var xx = oX+lengthdir_x(-2+i,angle);
	var yy = oY+lengthdir_y(-2+i,angle);

	draw_sprite_ext(sprite_index, i,xx,yy, 1, 1, image_angle, image_blend, 1);
}

/*var angle = -camera_get_view_angle(view_camera[0])+90;

for(var i = type; i < type + 3; i++) {
	var xx = x+lengthdir_x(i-type, angle);
	var yy = y+lengthdir_y(i-type, angle);
	draw_sprite_ext(sprite_index, i,xx,yy, image_xscale, image_yscale, image_angle, image_blend, global.alpha);
}

if(type % 3 != 0)
	type--;
	
if(room != r_title && instance_exists(o_weather) && o_weather.isSnowing)
	isCovered = true;

// Setting sprite image to snow covered version
if(isCovered && type < 9)
	type+=9;*/