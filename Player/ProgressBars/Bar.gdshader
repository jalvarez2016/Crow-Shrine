shader_type canvas_item;

uniform vec3 our_color: source_color;

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 input_color = texture(TEXTURE, UV);
	COLOR = vec4(our_color.r, our_color.g, our_color.b, input_color.a);
}