isGameover = true;

// Opening pause menu
global.isPaused = true;
global.pausedBackground = sprite_create_from_surface(global.pixelSurf,0,0,1920,1080,false,false,0,0);
instance_deactivate_all(true);
instance_activate_object(o_player);
instance_activate_object(o_input);

confirm = true;