/// qsort_active_list(list, low, high)
/// @description qsort(list, low, high)
/// @param list
/// @param low
/// @param high
function qsort_active_list(argument0, argument1, argument2) {

	if(argument1 < argument2){
		var partRef = qsort_partition(argument0, argument1, argument2); //partitioning the index
	
		//recursively sort elements before and after the partition
		qsort_active_list(argument0, argument1, partRef-1);
		qsort_active_list(argument0, partRef+1, argument2);
	}


}
