//ALL OF THIS IS FOR DEBUGGING DEPTH, pls no remove
//to reinstate this debug remove all comments followed by: (remove this to undo comment)



/* (remove this to undo comment)
var viewHeight = view_get_hport(view_camera[0]);
var viewCenX = x+lengthdir_x(viewHeight/2, -90-global.camera_angle);
var viewCenY = y+lengthdir_y(viewHeight/2, -90-global.camera_angle);
var camX = x;
var camY = y;
with(all)
{
	// With all objects except these set depth (objects that dont need or want to have depth set)
	if(object_index != o_dust && object_index != o_slash && object_index != o_lighting_control 
		&& object_index != o_display_control && object_index != o_hud && object_index != o_shader_control
		&& object_index != o_main_control && object_index != o_camera && object_index != o_hud
		&& object_index != o_snow_texture && object_index != o_footprint 
		&& object_index != o_cave_ground)
	{
		var newy;
		/*
		if(object_index == o_birch_fallen){
			var x2 = x+lengthdir_x(97, image_angle);
			var y2 = y+lengthdir_y(97, image_angle);
			//draw_text(x2,y2, newy);
			draw_line(x2,y2, viewCenX, viewCenY);
			draw_circle(x2,y2,5,true);
		}*/
		
		/*
		if(object_index == o_cliff){
			var x2 = x+lengthdir_x(110,image_angle-global.camera_angle);
			var y2 = y+lengthdir_y(110, image_angle-global.camera_angle);
			var newy2 = point_distance(x2,y2,viewCenX, viewCenY);
			draw_text(x2,y2, newy2);
			draw_line(x2,y2, viewCenX, viewCenY);
			draw_circle(x2,y2,5,true);
			var xn = x+lengthdir_x(110, image_angle+180-global.camera_angle);
			var yn = y+lengthdir_y(110, image_angle+180-global.camera_angle);
			draw_line(xn, yn, viewCenX, viewCenY);
			draw_circle(xn, yn, 5, true);
			var newy = point_distance(xn,yn, viewCenX, viewCenY);	
			draw_text(xn, yn, newy);
			draw_text(xn+lengthdir_x(20, -90-global.camera_angle), yn+lengthdir_y(20, -90-global.camera_angle), newy2);
			draw_text(x2+lengthdir_x(20, -90-global.camera_angle), y2+lengthdir_y(20, -90-global.camera_angle), newy);
		}*/
		//square method
		
		/* (remove this to undo comment)
		if(object_index == o_cliff){
			//right:99, up:81
			var x1 = x+lengthdir_x(90, image_angle)+lengthdir_x(73, image_angle+90);
			var y1 = y+lengthdir_y(90, image_angle)+lengthdir_y(73, image_angle+90);
			newy = point_distance(x1,y1,viewCenX, viewCenY);
			draw_line(x1,y1, viewCenX, viewCenY);
			draw_circle(x1,y1,5,true);
			//right:87, down: 56
			var x2 = x+lengthdir_x(72, image_angle)+lengthdir_x(52, image_angle-90);
			var y2 = y+lengthdir_y(72, image_angle)+lengthdir_y(52, image_angle-90);
			var newy2 = point_distance(x2,y2, viewCenX, viewCenY);
			draw_line(x2,y2, viewCenX, viewCenY);
			draw_circle(x2,y2,5,true);
			//left: 103, up: 62
			var x3 = x+lengthdir_x(93, image_angle+180)+lengthdir_x(54, image_angle+90);
			var y3 = y+lengthdir_y(93, image_angle+180)+lengthdir_y(54, image_angle+90);
			var newy3 = point_distance(x3, y3, viewCenX, viewCenY);
			draw_line(x3,y3, viewCenX, viewCenY);
			draw_circle(x3,y3,5,true);
			//left: 94, down: 83
			var x4 = x+lengthdir_x(78, image_angle+180)+lengthdir_x(77, image_angle-90);
			var y4 = y+lengthdir_y(78, image_angle+180)+lengthdir_y(77, image_angle-90);
			var newy4 = point_distance(x4,y4, viewCenX, viewCenY);
			draw_line(x4,y4, viewCenX, viewCenY);
			draw_circle(x4,y4,5,true);
			
			var suby = lengthdir_y(x1, global.camera_angle) + lengthdir_y(y1, global.camera_angle - 90);
			var suby2 = lengthdir_y(x2, global.camera_angle) + lengthdir_y(y2, global.camera_angle - 90);
			var suby3 = lengthdir_y(x3, global.camera_angle) + lengthdir_y(y3, global.camera_angle - 90);
			var suby4 = lengthdir_y(x4, global.camera_angle) + lengthdir_y(y4, global.camera_angle - 90);
			//var suby = newy;
			//var suby2 = newy2;
			//var suby3 = newy3;
			//var suby4 = newy4;
			
			
			//if outside viewset to 0
			var d1 = point_distance(camX, camY, x1, y1);
			var d2 = point_distance(camX, camY, x2, y2);
			var d3 = point_distance(camX, camY, x3, y3);
			var d4 = point_distance(camX, camY, x4, y4);
			
			/*
			var sum0 = 0;
			var maxval = max(d1,d2,d3,d4);
			var loops = 0;
			while(loops<3){
				if(maxval > 150){
					if(maxval = d1){
						newy=1;
						maxval = max(d2,d3,d4);
					}
					else if(maxval = d2){
						newy2 = 1;
						maxval = max(d2,d3,d4);
					}
					else if(maxval = d3){
						newy3 = 1;
						maxval = max(d2,d3,d4);
					}
					else if(maxval = d4){
						newy4 = 1;
						maxval = max(d2,d3,d4);
					}
					sum0++;
				}
				loops++;
			}
			*/
			
			/*
			if(sum0 == 4){
				var minval = min(d1,d2,d3,d4);
				if(minval == d1)
					newy = point_distance(x1,y1,viewCenX, viewCenY);
				else if(minval == d2)
					newy2 = point_distance(x2,y2, viewCenX, viewCenY);
				else if(minval == d3)
					newy3 = point_distance(x3, y3, viewCenX, viewCenY);
				else if(minval == d4)
					newy4 = point_distance(x4,y4, viewCenX, viewCenY);
			}*/
			
			//if theirs 3 zeroes then theirs only one corner available to test
			//if(sum0<4){
			//setting only the edge cases
			/* (remove this to undo comment)
			var minD = min(suby, suby2, suby3, suby4);
			var maxD = max(suby, suby2, suby3, suby4);
			//if (sum0==2)
			//	maxD = pointer_null;
			if(suby == minD || suby == maxD)
				newy = 0;
			if(suby2 == minD || suby2 == maxD)
				newy2 = 0;
			if(suby3 == minD || suby3 == maxD)
				newy3 = 0;
			if(suby4 == minD || suby4 == maxD)
				newy4 = 0;
			//}
			
			if(d1 > 180){
				newy = 1;
				//sum0++;	
			}
			if(d2 > 180){
				newy2 = 1;
				//sum0++;	
			}
			if(d3 > 180){
				newy3 = 1;
				//sum0++;	
			}
			if(d4 > 180){
				newy4 = 1;
				//sum0++;	
			}
				
			draw_text(x1,y1, newy);
			draw_text(x2,y2, newy2);
			draw_text(x3,y3, newy3);
			draw_text(x4,y4, newy4);
		}
		if(object_index == o_player){
			newy = point_distance(x,y,viewCenX, viewCenY);
			draw_text(x,y, newy);
			draw_line(x,y,viewCenX, viewCenY);
			draw_circle(x,y,5,true);
		}
	}
}
*/
//^^^(remove this to undo comment)

//this is for cleaning up roomshifting for better frames
if(roomShift){
	instance_activate_all();
	show_debug_message("room shift step");
}