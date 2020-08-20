/// @desc save_loadJsonFromFile(filename)
/// @arg filename
function save_loadJsonFromFile(argument0) {

	var _filename = argument0+".dat";

	var _buffer = buffer_load( _filename);
	var _string = buffer_read( _buffer, buffer_string);
	buffer_delete (_buffer);

	var _json = json_decode ( _string);
	return _json;


}
