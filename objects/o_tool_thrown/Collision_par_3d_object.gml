if(other.solid) {
if(z > 4 && other != o_tool_thrown) {

	switch(range) {
		case 0: speed_ = 14/3; z = 14/3; break;
		case 1: speed_ = 11/3; z = 11/3; break;
		case 2: speed_ = 7/3; z = 7/3; break;
	}

	angle = -angle;
}
}