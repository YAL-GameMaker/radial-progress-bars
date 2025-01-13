var _x = 100, _y = 125;
//var f = (current_time / 1700) % 1;
var f = clamp((window_mouse_get_x() - 80) / (window_get_width() - 160), 0, 1);

//draw_texture_radial(sprite_get_texture(spr_radial, 0), 1-f, _x + 64, _y - 64, _x - 64, _y + 64, c_white, 1);
//draw_texture_radial(sprite_get_texture(spr_radial, 1), f, _x - 64, _y - 64, _x + 64, _y + 64, c_white, 1);
draw_sprite_radial(spr_radial, 0, 1-f, _x, _y, -1, 1, c_white, 1);
draw_sprite_radial(spr_radial, 1, f, _x, _y, 1, 1, c_white, 1);

shader_enable_corner_id(true);

_x += 150;
var _z = draw_radial_begin();
gpu_set_depth(1-f);
draw_sprite_ext(spr_radial, 0, _x, _y, -1, 1, 0, c_white, 1);
gpu_set_depth(f);
draw_sprite_ext(spr_radial, 1, _x, _y, 1, 1, 0, c_white, 1);
draw_radial_end(_z);

_x += 150;
_z = draw_radial_begin(sh_radial_a);
draw_sprite_ext(spr_radial, 0, _x, _y, -1, 1, 0, c_white, 1-f);
draw_sprite_ext(spr_radial, 1, _x, _y, 1, 1, 0, c_white, f);
draw_radial_end(_z);
