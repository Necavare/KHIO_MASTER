/// queue_sortQueue(queue)
/// @description sort queue so it submits lowest to largest of instance y's
/// @param queue
function queue_sortQueue(argument0) {

	var q = argument0;

	var n = ds_queue_size(q);
	for(var i = 1; i <= n; i++){
		var min_index = queue_minIndex(q, n-i);
		queue_insertMinToRear(q, min_index);
	}


}
