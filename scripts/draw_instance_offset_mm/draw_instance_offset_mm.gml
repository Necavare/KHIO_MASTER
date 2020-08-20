///draw_instance_mm(instance, x_off, y_off, xscale, yscale, alpha)
/// @descrition draw_instance_mm(instance, x_off, y_off, xp, yp, xscale, yscale, alpha )
/// @param instance
/// @param xp
/// @param yp
/// @param xscale
/// @param yscale
/// @param alpha
function draw_instance_offset_mm(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {


	var xOff = argument1;
	var yOff = argument2;
	var xp = argument3;
	var yp = argument4;
	var xscale = argument5;
	var yscale = argument6;
	var alpha = argument7;

	var arraymm = ds_map_find_value(global.minimapVar, argument0);//find the array of values to use
	for(var i =0; i <sprite_get_number(arraymm[0]); i++){ //for every element in the image
			var xx = (arraymm[2]-xOff)+lengthdir_x(i, 90);
			var yy = (arraymm[3]-yOff)+lengthdir_y(i, 90);
			draw_sprite_ext(arraymm[0], i, xp + xx*(xscale), yp + yy*(yscale), 
			xscale, yscale, arraymm[1], c_white, alpha);
	}


}
