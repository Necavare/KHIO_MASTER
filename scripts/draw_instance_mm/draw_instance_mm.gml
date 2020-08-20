///draw_instance_mm(instance, xscale, yscale, alpha)
/// @descrition draw_instance_mm(instance, xp, yp, xscale, yscale, alpha )
/// @param instance
/// @param xp
/// @param yp
/// @param xscale
/// @param yscale
/// @param alpha
function draw_instance_mm(argument0, argument1, argument2, argument3, argument4, argument5) {

	var xp = argument1;
	var yp = argument2;
	var xscale = argument3;
	var yscale = argument4;
	var alpha = argument5;

	var arraymm = ds_map_find_value(global.minimapVar, argument0);//find the array of values to use
	for(var i =0; i <sprite_get_number(arraymm[0]); i++){ //for every element in the image
			var xx = arraymm[2]+lengthdir_x(i, 90);
			var yy = arraymm[3]+lengthdir_y(i, 90);
			draw_sprite_ext(arraymm[0], i, xp + xx*(xscale), yp + yy*(yscale), 
			xscale, yscale, arraymm[1], c_white, alpha);
	}



}
