draw_sprite(spr_health_icon, 0, 50, 50);

draw_sprite(global.sprite_health_index, global.image_health_index, 78, 50);

draw_sprite(spr_point, 0, 50, 75);

draw_sprite(spr_time, 0, 50, 120);

draw_set_font(fnt_score);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var col_text  = make_color_rgb(255, 215, 80); 

draw_set_color(col_text);
draw_text(90, 105, string(global.point));
draw_text(90, 151, string(global.time));

draw_set_font(fnt_level);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_text(window_get_width()/2-50, 25, "Level " + string(global.level));