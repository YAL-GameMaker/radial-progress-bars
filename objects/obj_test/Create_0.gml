//show_debug_message(sprite_get_uvs(spr_radial, 0));
show_debug_overlay(true);

var _sprite = spr_radial;
show_debug_message([
	sprite_get_bbox_left(_sprite),
	sprite_get_bbox_right(_sprite),
	sprite_get_bbox_top(_sprite),
	sprite_get_bbox_bottom(_sprite),
])