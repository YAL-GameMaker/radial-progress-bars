function draw_sprite_radial(_sprite, _subimg, _value, _x, _y, _xscale, _yscale, _color, _alpha, _uncrop = true) {
	var _x1, _y1, _x2, _y2;
	if (_uncrop) {
		var _ox = sprite_get_xoffset(_sprite);
		var _oy = sprite_get_yoffset(_sprite);
		_x1 = _x + _xscale * (sprite_get_bbox_left(_sprite) - _ox);
		_x2 = _x + _xscale * (sprite_get_bbox_right(_sprite) + 1 - _ox);
		_y1 = _y + _yscale * (sprite_get_bbox_top(_sprite) - _oy);
		_y2 = _y + _yscale * (sprite_get_bbox_bottom(_sprite) + 1 - _oy);
	} else {
		_x1 =  _x - _xscale * sprite_get_xoffset(_sprite);
		_x2 = _x1 + _xscale * sprite_get_width(_sprite);
		_y1 = _y -  _yscale * sprite_get_yoffset(_sprite);
		_y2 = _y1 + _yscale * sprite_get_height(_sprite);
	}
	draw_texture_radial(sprite_get_texture(_sprite, _subimg), _value, _x1, _y1, _x2, _y2, _color, _alpha);
}