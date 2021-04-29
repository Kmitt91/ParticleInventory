shader_type canvas_item;
render_mode unshaded;

uniform sampler2D noise_texture;
uniform sampler2D texture_mask;

uniform float emission_intensity = 2.0;
uniform float time_scale = 1.0;
uniform vec2 texture_scale = vec2(1.0);


void fragment() {
	
	vec2 base_uv = UV * texture_scale;
	vec2 time_based_pan = vec2(0.2, 1.0) * (- TIME * time_scale);
	
	vec4 mask = texture(texture_mask, UV);
	vec4 noise = texture(noise_texture, base_uv + time_based_pan);
	
	vec4 col = COLOR * mask * noise.r;
	
	COLOR = col * emission_intensity;
	
	
}