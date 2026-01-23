// Vẽ enemy bình thường
draw_self();

// DEBUG: Vẽ vòng tròn phạm vi tấn công (có thể bỏ sau)
/*
draw_set_color(c_red);
draw_set_alpha(0.3);
draw_circle(x, y, attack_range, false);  // Phạm vi bắt đầu tấn công
draw_set_color(c_yellow);
draw_circle(x, y, attack_hit_range, false);  // Phạm vi đánh trúng
draw_set_alpha(1);
draw_set_color(c_white);
*/
