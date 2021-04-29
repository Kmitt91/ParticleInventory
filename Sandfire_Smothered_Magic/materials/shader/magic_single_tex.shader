shader_type canvas_item;
render_mode unshaded;

uniform sampler2D texture_mask;

uniform float emission_intensity = 2.0;


void fragment() {
	
	vec4 mask = texture(texture_mask, UV);
	vec4 col = COLOR * mask;
	
	COLOR = col * emission_intensity;
}