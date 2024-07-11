shader_type canvas_item;

//void vertex() {
	// Called for every vertex the material is visible on.
//}

void fragment() {
	// Called for every pixel the material is visible on.
	float current_a = texture(TEXTURE, UV).a;
	vec4 target_color = mix(texture(TEXTURE, UV), vec4(vec3(1), current_a), 0.5);
		// vec3(1) == vec3(1, 1, 1)
	COLOR = target_color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
