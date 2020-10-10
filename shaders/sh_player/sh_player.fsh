varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {

	vec4 base_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
		
	if((base_col.r == 178.0 / 255.0 && base_col.g == 80.0 / 255.0 && base_col.b == 81.0 / 255.0)
	|| (base_col.r == 205.0 / 255.0 && base_col.g == 121.0 / 255.0 && base_col.b == 115.0 / 255.0)) {	// Replace red 1 and 2
		base_col.r = 93.0 / 255.0;
		base_col.g = 129.0 / 255.0;
		base_col.b = 125.0 / 255.0;
	} 
	
	if(base_col.r == 123.0 / 255.0 && base_col.g == 63.0 / 255.0 && base_col.b == 61.0 / 255.0) {	// Replace red 3
		base_col.r = 71.0 / 255.0;
		base_col.g = 99.0 / 255.0;
		base_col.b = 94.0 / 255.0;
	} 
	
	if(base_col.r == 73.0 / 255.0 && base_col.g == 36.0 / 255.0 && base_col.b == 36.0 / 255.0) {	// Replace red 4
		base_col.r = 48.0 / 255.0;
		base_col.g = 70.0 / 255.0;
		base_col.b = 67.0 / 255.0;
	} 
	
    gl_FragColor = base_col;
}
