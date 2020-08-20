///@description dying
//var bloodObj = instance_create_depth(x,y, 1, o_bloodsplat);
var enemyObj = instance_create_depth(x,y, 1, o_enemy_dead);
enemyObj.enemy_type = 0;
enemyObj.img_index = img_index;
//enemyObj.blood_id = bloodObj.id;
enemyObj.dir_ref = dir_ref;

if(startingEnemy){
	item1 = item.enemymap;
	item1Count = 1;
	item1Dur = 11;
}
else if(irandom(100) < 15){
	item1 = item.enemymap;
	item1Count = 1;
	item1Dur = 11;
}
if(item1 != -1){
	enemyObj.spawnItems = false;//dont spawn items normally
	pickup_item(enemyObj, item1, item1Count, item1Dur);
}
if(item2 != -1){
	enemyObj.spawnItems = false;//dont spawn items normally
	pickup_item(enemyObj, item2, item2Count, item2Dur);
}
if(item3 != -1){
	enemyObj.spawnItems = false;//dont spawn items normally
	pickup_item(enemyObj, item3, item3Count, item3Dur);
}

instance_destroy(self);