/// @desc save_editFiles(oldfilename, newfilename)
/// @arg oldfilename
/// @arg newfilename
function save_editFiles(argument0, argument1) {

	var oldfilename = argument0;
	var newfilename = argument1;


	file_rename(oldfilename+".dat", newfilename+".dat");
	//find the selected file position in the list
	var filePos = ds_list_find_index(global.saveFileNames, oldfilename);
	//replace it in the list
	/*
	//make sure its original
	var saveFileSize = ds_list_size(global.saveFileNames);
	var originalName = false;
	var originalityCheck = false;
	var originalityNum = 1;
	while(!originalName){
		for(var i =0; i <saveFileSize; i++){
			if(newfilename == ds_list_find_value(global.saveFileNames, i))
				originalityCheck = true;
		}
		if(originalityCheck){
			newfilename = newfilename+string(originalityNum);
			originalityNum++;
			originalName = false;
		}else
			originalName = true;
	}*/

	ds_list_replace(global.saveFileNames, filePos, newfilename);
	save_nameHub();//save this change

	//replace all minimap sprites
	/*
	file_rename(oldfilename+"-ba0.png", newfilename+"-ba0.png");
	file_rename(oldfilename+"-ba1.png", newfilename+"-ba1.png");
	file_rename(oldfilename+"-ba2.png", newfilename+"-ba2.png");
	file_rename(oldfilename+"-ba3.png", newfilename+"-ba3.png");
	file_rename(oldfilename+"-ba4.png", newfilename+"-ba4.png");
	file_rename(oldfilename+"-ba5.png", newfilename+"-ba5.png");
	file_rename(oldfilename+"-ba6.png", newfilename+"-ba6.png");
	file_rename(oldfilename+"-ba7.png", newfilename+"-ba7.png");
	file_rename(oldfilename+"-ba8.png", newfilename+"-ba8.png");
	file_rename(oldfilename+"-ba9.png", newfilename+"-ba9.png");
	file_rename(oldfilename+"-ba10.png", newfilename+"-ba10.png");
	file_rename(oldfilename+"-ba11.png", newfilename+"-ba11.png");
	file_rename(oldfilename+"-ba12.png", newfilename+"-ba12.png");
	file_rename(oldfilename+"-ba13.png", newfilename+"-ba13.png");
	file_rename(oldfilename+"-ba14.png", newfilename+"-ba14.png");
	file_rename(oldfilename+"-ba15.png", newfilename+"-ba15.png");
	file_rename(oldfilename+"-ba16.png", newfilename+"-ba16.png");
	file_rename(oldfilename+"-ba17.png", newfilename+"-ba17.png");
	file_rename(oldfilename+"-ba18.png", newfilename+"-ba18.png");
	file_rename(oldfilename+"-ba19.png", newfilename+"-ba19.png");
	file_rename(oldfilename+"-ba20.png", newfilename+"-ba20.png");
	file_rename(oldfilename+"-ba21.png", newfilename+"-ba21.png");
	file_rename(oldfilename+"-ba22.png", newfilename+"-ba22.png");
	file_rename(oldfilename+"-ba23.png", newfilename+"-ba23.png");
	file_rename(oldfilename+"-ba24.png", newfilename+"-ba24.png");*/
	file_rename(oldfilename+"-os.png", newfilename+"-os.png");


}
