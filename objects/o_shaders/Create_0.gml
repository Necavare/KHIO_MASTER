//persistant
/*
if(room != r_title && room != r_display_init)
	persistent = true;
*/

// Shaders
shader			= sh_lighting;
u_col			= shader_get_uniform(shader, "col");
u_con_sat_brt	= shader_get_uniform(shader, "con_sat_brt");

s_lights		= shader_get_sampler_index(shader, "lights");
tex_lights		= -1;
srf_lights		= -1;

// Color variables
color_mix		= -1;
color[0,0]		= undefined;

con_sat_brt_mix	= -1;

key_previous	= -1;
key_next		= -1;

// Key Times
// arguments:	R		G		B		con		sat		brt		popS	popT

//	Midnight
scr_add_key_time(070,	113,	199,	1.00,	1.25,  -.8,	0.85,	1.00);
//	Midnight
scr_add_key_time(070,	113,	199,	1.00,	1.25,  -.8,	0.85,	1.00);
//	Morning
scr_add_key_time(184,	171,	129,	1.20,	1.25,  -0.4,	0.30,	0.80);
//	Afternoon
scr_add_key_time(128,	128,	128,	1.00,	1.25,	-0.05,	0.00,	0.00);
//	Afternoon
scr_add_key_time(128,	128,	128,	1.00,	1.25,	-0.05,	0.00,	0.00);
//	Sunset
scr_add_key_time(219,	137,	059,	1.00,	1.00,  -0.4,	0.35,	1.00);

number_of_key_times = array_height_2d(color);
minute_of_day = 400;
hour_of_day = minute_of_day/1440;
alarm[0] = 30;
minute_target = -1;

tempMax = 0;
tempMin = -38;

global.alpha = 1;
fadeOutWorld = false;
alarm[2] = 1;

// Pixel Shader
pixel = shader_get_uniform(sh_pixel,"pixel");

size = 3;

//application_surface_draw_enable(true);

global.pixelSurf = -1;
global.dayNightSurf = -1;