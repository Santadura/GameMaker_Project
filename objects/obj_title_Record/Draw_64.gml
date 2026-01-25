var col_text  = make_color_rgb(255, 215, 80); 

draw_set_color(col_text);
draw_set_font(fnt_vietnamese_30);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(window_get_width()/2-220, 300, "Kỷ lục cao nhất của bạn");
draw_text(window_get_width()/2-200, 400, "Số câu đúng: " + string(best_point));
draw_text(window_get_width()/2-200, 500, "Thời gian: " + string(best_time));