attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vRelative;
varying float v_fill;
#define pi 3.141592653589793

void main() {
	vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
	v_vTexcoord = in_TextureCoord;
	v_vColour = vec4(in_Colour.rgb, 1.0);
	// corner IDs are clockwise but we want 0..1 on two axes
	float ry = mod(in_Colour.b * 255.0, 2.0);
	float rz = mod(in_Colour.r * 255.0, 2.0);
	float rx = ry + (1.0 - ry * 2.0) * rz;
	v_vRelative = vec2(rx, ry);
	v_fill = in_Colour.a * (pi * 2.0);
}
