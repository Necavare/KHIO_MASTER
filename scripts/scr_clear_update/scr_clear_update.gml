/// scr_clear_update(update_list_array)
/// @description scr_clear_update(update_list_array)
/// @param update_list_array
function scr_clear_update(argument0) {

	//----------------------------------------------
	//cleans the array of necessarily updated blocks
	//----------------------------------------------

	//set all values to false
	var listArr= argument0;
	for(i=0; i<array_length_1d(listArr); i++){
		listArr[@ i] = false;	
	}


}
