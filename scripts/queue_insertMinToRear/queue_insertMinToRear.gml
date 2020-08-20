/// queue_insertMinToRear(queue, min_index)
/// @description moves given min element to rear of queue
/// @param queue
/// @param min_index
function queue_insertMinToRear(argument0, argument1) {

	var q = argument0;
	var min_index = argument1;

		var min_val = -1;
		var n = ds_queue_size(q);
		for (var i = 0; i< n; i++){
			var curr = ds_queue_dequeue(q);
			if(i != min_index)
				ds_queue_enqueue(q, curr);
			else
				min_val = curr;
		}
		if(min_val != -1)
			ds_queue_enqueue(q, min_val);


}
