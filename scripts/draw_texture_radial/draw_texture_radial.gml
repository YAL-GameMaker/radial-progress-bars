function draw_texture_radial(_tex, _value, _x1, _y1, _x2, _y2, _color, _alpha) {
	if (_value <= 0) exit;
	if (_value >= 1) {
		draw_primitive_begin_texture(pr_trianglelist, _tex);
		draw_vertex_texture_color(_x1, _y1, 0, 0, _color, _alpha);
		repeat (2) {
			draw_vertex_texture_color(_x2, _y1, 1, 0, _color, _alpha);
			draw_vertex_texture_color(_x1, _y2, 0, 1, _color, _alpha);
		}
		draw_vertex_texture_color(_x2, _y2, 1, 1, _color, _alpha);
		draw_primitive_end();
		exit;
	}
	
	// middle point:
	var _mx = (_x1 + _x2) / 2;
	var _my = (_y1 + _y2) / 2;
	draw_primitive_begin_texture(pr_trianglelist, _tex);
	draw_vertex_texture_color(_mx, _my, 0.5, 0.5, _color, _alpha);
	draw_vertex_texture_color(_mx, _y1, 0.5, 0, _color, _alpha);
	
	// corners, each of these finishes the last triangle and starts a new one:
	if (_value >= 1/8) {
		draw_vertex_texture_color(_x2, _y1, 1, 0, _color, _alpha);
		//
		draw_vertex_texture_color(_mx, _my, 0.5, 0.5, _color, _alpha);
		draw_vertex_texture_color(_x2, _y1, 1, 0, _color, _alpha);
	}
	if (_value >= 3/8) {
		draw_vertex_texture_color(_x2, _y2, 1, 1, _color, _alpha);
		//
		draw_vertex_texture_color(_mx, _my, 0.5, 0.5, _color, _alpha);
		draw_vertex_texture_color(_x2, _y2, 1, 1, _color, _alpha);
	}
	if (_value >= 5/8) {
		draw_vertex_texture_color(_x1, _y2, 0, 1, _color, _alpha);
		//
		draw_vertex_texture_color(_mx, _my, 0.5, 0.5, _color, _alpha);
		draw_vertex_texture_color(_x1, _y2, 0, 1, _color, _alpha);
	}
	if (_value >= 7/8) {
		draw_vertex_texture_color(_x1, _y1, 0, 0, _color, _alpha);
		//
		draw_vertex_texture_color(_mx, _my, 0.5, 0.5, _color, _alpha);
		draw_vertex_texture_color(_x1, _y1, 0, 0, _color, _alpha);
	}
	
	// final vertex (towards value-angle):
	var _dir = pi * (_value * 2 - 0.5);
	var _dx = cos(_dir);
	var _dy = sin(_dir);
	// normalize:
	var _dmax = max(abs(_dx), abs(_dy));
	if (_dmax < 1) {
		_dx /= _dmax;
		_dy /= _dmax;
	}
	//
	_dx = (1 + _dx) / 2;
	_dy = (1 + _dy) / 2;
	draw_vertex_texture_color(
		lerp(_x1, _x2, _dx), lerp(_y1, _y2, _dy),
		_dx, _dy, _color, _alpha
	);
	draw_primitive_end();
}
