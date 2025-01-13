varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vRelative;
varying float v_fill;
#define pi 3.141592653589793

void main() {
	vec2 r = v_vRelative - vec2(0.5, 0.5);
	float a = pi - atan(r.x, r.y);
	if (a < v_fill) {
		gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	} else {
		discard;
	}
}
