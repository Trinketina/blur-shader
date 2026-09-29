shader_type canvas_item;
vec4 square_matrix(sampler2D tex, vec2 uv, vec2 tex_pixel_size) {
	vec4 total_sum = vec4(0,0,0,0);
	
	float x_min = max(uv.x-1., 0);
	float x_max = min(uv.x+2., 1./tex_pixel_size.x);
	float y_min = max(uv.y-1., 0);
	float y_max = min(uv.y+2., 1./tex_pixel_size.y);
	
	for (float x = uv.x - 1.0; x < uv.x + 1.0; x++) {
		for (float y = uv.y - 1.0; y < uv.y + 1.0; y++) {
			total_sum += texture(tex, vec2 (x, y));
		}
	}
	
	return total_sum / 9.0;
}

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	COLOR = square_matrix(TEXTURE, UV / TEXTURE_PIXEL_SIZE, TEXTURE_PIXEL_SIZE);
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
