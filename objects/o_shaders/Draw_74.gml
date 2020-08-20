#region LIGHTING
var angle = -camera_get_view_angle(view_camera[0])+90;

if (!surface_exists(srf_lights)) {
	srf_lights = surface_create(1920, 1080); 
	tex_lights = surface_get_texture(srf_lights);
}

surface_set_target(srf_lights);

draw_clear(c_black);
	gpu_set_blendmode_ext(bm_src_alpha, bm_inv_src_alpha)
	gpu_set_tex_filter(true); // optional
	
	// draw light sprites
	if(global.hour < 8 || global.hour > 19) {
		with(o_light) {
			var scale = 6+(irandom_range(-5, 5)/5);
			if(!lightOff) {
				var xx = x+lengthdir_x(0, angle);
				var yy = y+lengthdir_y(0, angle);
				draw_sprite_ext(s_light, image_index, x_to_gui(xx,yy), y_to_gui(xx,yy), image_xscale*scale, image_yscale*scale, image_angle+(-(angle-90)), $779AEE, image_alpha * .03);
			}
		}
		
		with(o_drone) {
			if(!o_drone.lightOff) {
				var scale = 6+(irandom_range(1, 5)/20);
				var xx = x+lengthdir_x(0, angle);
				var yy = y+lengthdir_y(0, angle);
				draw_sprite_ext(s_light, image_index, x_to_gui(xx,yy), y_to_gui(xx,yy), image_xscale*scale, image_yscale*scale, image_angle+(-(angle-90)), c_white, .3);
			}
		}
		
		with(o_grenade) {
			if(!o_grenade.isExploded) {
				var scale = 3+(irandom_range(1, 5)/20);
				var xx = x+lengthdir_x(0, angle);
				var yy = y+lengthdir_y(0, angle);
				draw_sprite_ext(s_light, image_index, x_to_gui(xx,yy), y_to_gui(xx,yy), image_xscale*scale, image_yscale*scale, image_angle+(-(angle-90)), $725BE5, .1);
			}
		}
	}
		
	// reset GPU
	gpu_set_tex_filter(false); // optional
	gpu_set_blendmode(bm_normal);
surface_reset_target();

// Create day/night surface
if(!surface_exists(global.dayNightSurf))
	global.dayNightSurf = surface_create(1920, 1080);
	
// Draw lighting shader
shader_set(shader);

shader_set_uniform_f_array(u_col, color_mix);
shader_set_uniform_f_array(u_con_sat_brt, con_sat_brt_mix);

texture_set_stage(s_lights, tex_lights);

surface_set_target(global.dayNightSurf);

// Drawing application surface to day/night surface
if (surface_exists(application_surface))
	draw_surface(application_surface, 0, 0);
	
surface_reset_target();

draw_surface(global.dayNightSurf, 0, 0);
	
shader_reset();

#endregion

#region PIXEL

if(!surface_exists(global.pixelSurf))
	global.pixelSurf = surface_create(1920, 1080);

// Drawing the pixel shader
shader_set(sh_pixel);

shader_set_uniform_f(pixel,1920, 1080,size,size);

surface_set_target(global.pixelSurf);
draw_surface(global.dayNightSurf, 0, 0);
surface_reset_target();

shader_reset();

#endregion

draw_surface(global.pixelSurf, 0, 0);

