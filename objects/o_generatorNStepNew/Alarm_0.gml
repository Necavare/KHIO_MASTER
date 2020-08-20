if(instanceActivateOffset == 0){
	instance_activate_object(o_camera);
	instance_activate_object(o_generatorNStepNew);
	instance_activate_object(o_player);
	instance_activate_object(o_shaders);	
	instance_activate_object(o_initializer);
	instance_activate_object(o_weather);
	instance_activate_object(o_hud);
	//instance_activate_object(o_debugger);
	instance_activate_object(o_input);
			
		//activate the first section
	instance_activate_layer(loadingLayerId);
}
alarm[0] = 10;