/// @description get_move_vector()
/// @param acceleration
/// @param new_direction
/// @param max_speed
/// @param moving
function get_move_vector(argument0, argument1, argument2, argument3) {

	var acc = argument0;
	var new_direction = argument1;
	var max_spd = argument2;
	var moving = argument3;

	// Updates the old movement vector with the new direction and the acceleration. It also clamps the
	// speed making it not being greater of the max speed and less than 0 when it is deaccelerating.
	// It returns the speed and the direction updateds.

	if moving {
		// Accelerate towards direction.
		var move_vector = add_vectors(acc*moving, new_direction, _spd, _dir);

		_spd = move_vector[0];
		_dir = move_vector[1];
	
		// Cap the speed.
		_spd = min(_spd, max_spd);
	} else {
		// Deaccelerate.
		_spd = max(_spd-acc, 0);
	}

	return [_spd, _dir];



}
