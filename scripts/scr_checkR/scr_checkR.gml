/// scr_checkR(blocksize, blockradius, obj)
/// @description checkRadius(blocksize, number of blocks, obj to check for)
/// @param blocksize
/// @param radius
/// @param obj
function scr_checkR(argument0, argument1, argument2) {
	var bS=argument0;
	var num=argument1;
	var obj=argument2;

	var dis=bS;
	while(num>0){
		if(position_meeting(x+dis, y, obj)||position_meeting(x-dis, y, obj)||
		position_meeting(x, y+dis, obj)||position_meeting(x, y-dis, obj)||
		position_meeting(x+dis,y+dis, obj)||position_meeting(x-dis, y+dis,obj)||
		position_meeting(x+dis,y-dis, obj)||position_meeting(x-dis,y-dis,obj))
			return true;
	

		num-=1;
		dis+=bS;
	}
	return false;


}
