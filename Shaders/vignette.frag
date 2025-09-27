uniform vec2 u_resolution;
uniform float COL_R;
uniform float COL_G;
uniform float COL_B;
uniform float u_scale;
uniform float u_strength;

void main() {
	vec2 uv = gl_FragCoord.xy/u_resolution.xy;
	uv -= 0.5;
	uv *= u_resolution.x/u_resolution.y;

    vec4 color1 = vec4(gl_Color.r, gl_Color.g, gl_Color.b, gl_Color.a);
    vec4 color2 = vec4(COL_R, COL_G, COL_B, gl_Color.a);

    gl_FragColor = mix(color1, color2, (pow(distance(uv * u_scale, vec2(0.0)), u_strength)));
}