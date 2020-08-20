//var bloodObj = instance_create_depth(x,y, 1, o_bloodsplat);
var enemyObj = instance_create_depth(x,y, 1, o_enemy_dead);
enemyObj.enemy_type = 0;
enemyObj.img_index = img_index;
//enemyObj.blood_id = bloodObj.id;
enemyObj.dir_ref = dir_ref;
instance_destroy(self);