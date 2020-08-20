/// @desc save_deleteFiles(filename)
/// @arg filename
function save_deleteFiles(argument0) {

	var filename = argument0;

	file_delete(filename+".dat");
	//find the selected file position in the list
	var filePos = ds_list_find_index(global.saveFileNames, filename);
	//remove it from list
	ds_list_delete(global.saveFileNames, filePos);
	save_nameHub();//save this change

	//delete all minimap sprites
	file_delete(filename+"-ba0.png");
	file_delete(filename+"-ba1.png");
	file_delete(filename+"-ba2.png");
	file_delete(filename+"-ba3.png");
	file_delete(filename+"-ba4.png");
	file_delete(filename+"-ba5.png");
	file_delete(filename+"-ba6.png");
	file_delete(filename+"-ba7.png");
	file_delete(filename+"-ba8.png");
	file_delete(filename+"-ba9.png");
	file_delete(filename+"-ba10.png");
	file_delete(filename+"-ba11.png");
	file_delete(filename+"-ba12.png");
	file_delete(filename+"-ba13.png");
	file_delete(filename+"-ba14.png");
	file_delete(filename+"-ba15.png");
	file_delete(filename+"-ba16.png");
	file_delete(filename+"-ba17.png");
	file_delete(filename+"-ba18.png");
	file_delete(filename+"-ba19.png");
	file_delete(filename+"-ba20.png");
	file_delete(filename+"-ba21.png");
	file_delete(filename+"-ba22.png");
	file_delete(filename+"-ba23.png");
	file_delete(filename+"-ba24.png");
	file_delete(filename+"-os.png");



}
