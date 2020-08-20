var snow = instance_create_depth(x,y,depth, o_item);
snow.image_index = item.snowball;
snow.item_count = irandom_range(0,3);
snow.direction = irandom_range(0,360);
snow.bounce = true;