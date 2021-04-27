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
	
	// the part below is from the sylized 3D fire shader by GDQuest; more in ReadMe.txt//
	// Copyright (c) 2020 GDQuest
	float erosion = (1.0 - COLOR.a);
	float alpha = (noise.r * mask.r) - erosion;
	alpha = clamp(alpha, 0.0, 1.0);
	
	
	COLOR = col * emission_intensity * smoothstep(0.0, 1.0, alpha);
}