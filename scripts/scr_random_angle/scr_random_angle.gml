/// scr_randomAngle(instance)
/// @description scr_randomAngle(inst)
/// @param obj
function scr_random_angle(argument0) {

	var inst=argument0;
	var ranAngle = irandom(360);

	//randomizes the image angle of the instance that is put in
	with(inst){
		mmObj.image_angle = ranAngle; //set the minimap angle equivalent
		image_angle = ranAngle;
	}


}
