if(global.isPaused && global.pausedBackground = -1 && !o_hud.isGameover) {
	global.pausedBackground = sprite_create_from_surface(application_surface,0,0, 1920,1080,false,false,0,0);
	surface_free(global.pixelSurf);
	surface_free(global.dayNightSurf); 
	surface_free(srf_lights);
	
} else if(!global.isPaused) {
	global.pausedBackground = -1;
}