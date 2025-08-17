/// Draw GUI Event (obj_hud)

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Fonte
draw_set_font(fnt_hud);

/// Função local para desenhar texto com sombra
function draw_text_shadow(_x, _y, _str) {
    // sombra preta (4 direções)
    draw_set_color(c_black);
    draw_text(_x + 1, _y, _str);
    draw_text(_x - 1, _y, _str);
    draw_text(_x, _y + 1, _str);
    draw_text(_x, _y - 1, _str);
    // texto branco principal
    draw_set_color(c_white);
    draw_text(_x, _y, _str);
}

// Margens
var margin_top  = 16;
var margin_left = 32;

// -------- LIVES --------
var life_scale = 5;
var life_icon_w = sprite_get_width(spr_life) * life_scale;

var lives_x = margin_left;
var lives_y = margin_top + 6;

draw_sprite_ext(spr_life, 0, lives_x, lives_y, life_scale, life_scale, 0, c_white, 1);
var lives_text = "x" + string(global.lives);
draw_text_shadow(lives_x + life_icon_w + 8, margin_top + 14, lives_text);

// -------- SCORE --------
var score_x = lives_x + life_icon_w + 8 + string_width(lives_text) + 64;
draw_text_shadow(score_x, margin_top, "SCORE");
draw_text_shadow(score_x, margin_top + 32, string_format(global.score, 6, 0));

// -------- COINS --------
var coin_x = gui_w * 0.4;
draw_sprite_ext(spr_coin, 0, coin_x - 40, margin_top + 6, 5, 5, 0, c_white, 1);
draw_text_shadow(coin_x, margin_top + 14, "x" + string(global.coins));

// -------- WORLD --------
var world_x = gui_w * 0.66;
draw_text_shadow(world_x, margin_top, "WORLD");
draw_text_shadow(world_x + 16, margin_top + 32, string(global.world) + "-" + string(global.level));

// -------- TIME --------
var time_x = gui_w - 128;
draw_text_shadow(time_x, margin_top, "TIME");
draw_text_shadow(time_x + 16, margin_top + 32, string(global.time));
