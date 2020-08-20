if(other.x == x && other.y == y) {
	other.isOnFire = true;
	instance_destroy(other);
}