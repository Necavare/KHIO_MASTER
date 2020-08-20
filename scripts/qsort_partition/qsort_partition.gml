/// qsort_partition(list, low, high)
/// @description partition(list, low, high)
/// @param list
/// @param low
/// @param high
function qsort_partition(argument0, argument1, argument2) {

	//var pivot= argument0[argument2]; //pivot point to modify array over
	var pivotID = ds_list_find_value(argument0, argument2);
	var pivotArr = ds_map_find_value(global.minimapVar, pivotID);//find the array of values to use 
	var i= (argument1-1);

	for(j=argument1; j<argument2; j++){
		//if current element is smaller than or equal to pivot
		var currjID = ds_list_find_value(argument0, j);
		var currjArr = ds_map_find_value(global.minimapVar, currjID);
	
		if(currjArr[4] <= pivotArr[4]){
			i++;
		
			//swap arr[i] and arr[j]
			temp= ds_list_find_value(argument0, i);
			ds_list_replace(argument0, i, currjID);
			ds_list_replace(argument0, j, temp);
			//argument0[@i]=argument0[j];
			//argument0[@j] = temp;
		}
	}

	//swap arr[i+1] and arr[high] (or pivot)
	temp = ds_list_find_value(argument0, i+1);
	ds_list_replace(argument0, i+1, pivotID);
	ds_list_replace(argument0, argument2, temp);

	return (i+1);




}
