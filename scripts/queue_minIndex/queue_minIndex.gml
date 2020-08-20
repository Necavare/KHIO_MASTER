/// queue_minIndex(queue, sortedIndex)
/// @description returns index of min element from front to sortedIndex
/// @param queue
/// @param sortedIndex
function queue_minIndex(argument0, argument1) {

	var q = argument0;
	var sortedIndex = argument1;

		var min_index = -1;//index of min value
		var min_val = room_height+2000; //impossible for an object to have this y value
		var n = ds_queue_size(q);//queue size
		for(var i =0; i <n; i++){
			var curr = 	ds_queue_dequeue(q);
		
			if(curr.y<=min_val && i<=sortedIndex){
				min_index = i;
				min_val = curr.y;
			}
			ds_queue_enqueue(q,curr);
		}
		return min_index;
	


}
