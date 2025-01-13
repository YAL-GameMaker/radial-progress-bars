function draw_radial_begin(_shader = sh_radial_z) {
	shader_set(_shader);
	shader_enable_corner_id(true);
	return gpu_get_depth();
}
function draw_radial_end(_depth) {
	shader_reset();
	shader_enable_corner_id(false);
	gpu_set_depth(_depth);
}