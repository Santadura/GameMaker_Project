// ===== VẼ NÚT PAUSE GÓC TRÊN PHẢI =====
if (!game_paused) {
    // Vẽ nền nút
    if (pause_hover) {
        draw_set_color(make_color_rgb(255, 200, 100));
        draw_set_alpha(0.9);
    } else {
        draw_set_color(make_color_rgb(255, 255, 255));
        draw_set_alpha(0.7);
    }
    
    draw_roundrect_ext(pause_gui_x, pause_gui_y, 
        pause_gui_x + pause_button_width, 
        pause_gui_y + pause_button_height, 8, 8, false);
    
    // Viền
    draw_set_color(c_black);
    draw_set_alpha(1);
    draw_roundrect_ext(pause_gui_x, pause_gui_y, 
        pause_gui_x + pause_button_width, 
        pause_gui_y + pause_button_height, 8, 8, true);
    
    // Icon pause (||)
    draw_set_color(c_black);
    draw_rectangle(pause_gui_x + 15, pause_gui_y + 12, 
        pause_gui_x + 22, pause_gui_y + 38, false);
    draw_rectangle(pause_gui_x + 28, pause_gui_y + 12, 
        pause_gui_x + 35, pause_gui_y + 38, false);
}

// ===== VẼ POPUP PAUSE MENU =====
if (game_paused) {
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();
    
    // Nền tối
    draw_set_alpha(0.8);
    draw_rectangle_color(0, 0, screen_w, screen_h, 
        c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    
    // Khung popup
    var popup_w = 400;
    var popup_h = 450;
    var popup_x = screen_w / 2 - popup_w / 2;
    var popup_y = screen_h / 2 - popup_h / 2;
    var corner_radius = 20;
    
    // Bóng đổ
    draw_set_alpha(0.4);
    draw_roundrect_color_ext(popup_x + 8, popup_y + 8, 
        popup_x + popup_w + 8, popup_y + popup_h + 8, 
        corner_radius, corner_radius, c_black, c_black, false);
    draw_set_alpha(1);
    
    // Nền popup
    draw_roundrect_color_ext(popup_x, popup_y, popup_x + popup_w, popup_y + popup_h, 
        corner_radius, corner_radius, 
        make_color_rgb(70, 75, 70),
        make_color_rgb(55, 60, 55),
        false);
    
    // Viền popup
    draw_set_color(make_color_rgb(120, 140, 90));
    for (var i = 0; i < 3; i++) {
        draw_roundrect_ext(popup_x - i, popup_y - i, 
            popup_x + popup_w + i, popup_y + popup_h + i, 
            corner_radius, corner_radius, true);
    }
    
    // Header
    draw_roundrect_color_ext(popup_x, popup_y, popup_x + popup_w, popup_y + 100, 
        corner_radius, corner_radius, 
        make_color_rgb(90, 95, 85),
        make_color_rgb(70, 75, 65),
        false);
    
    // Tiêu đề "GAME PAUSED"
    draw_set_color(make_color_rgb(220, 230, 200));
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_vietnamese);
    draw_text_transformed(popup_x + popup_w / 2, popup_y + 50, "GAME PAUSED", 2, 2, 0);
    
    // ===== 3 NÚT MENU =====
    var button_w = 250;
    var button_h = 60;
    var button_spacing = 20;
    var start_y = popup_y + 140;
    
    var button_x = popup_x + popup_w / 2 - button_w / 2;
    
    // Màu sắc nút
    var normal_color = make_color_rgb(120, 130, 110);
    var hover_color = make_color_rgb(150, 170, 120);
    var border_color = make_color_rgb(180, 200, 150);
    
    // NÚT 1: RESUME
    var resume_y = start_y;
    
    if (menu_button_hover == 0) {
        draw_set_color(hover_color);
    } else {
        draw_set_color(normal_color);
    }
    
    draw_roundrect_ext(button_x, resume_y, button_x + button_w, resume_y + button_h, 10, 10, false);
    
    draw_set_color(border_color);
    draw_roundrect_ext(button_x, resume_y, button_x + button_w, resume_y + button_h, 10, 10, true);
    draw_roundrect_ext(button_x + 1, resume_y + 1, button_x + button_w - 1, resume_y + button_h - 1, 10, 10, true);
    
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_transformed(button_x + button_w / 2, resume_y + button_h / 2, "▶ RESUME", 1.3, 1.3, 0);
    
    // NÚT 2: RESTART
    var restart_y = start_y + button_h + button_spacing;
    
    if (menu_button_hover == 1) {
        draw_set_color(hover_color);
    } else {
        draw_set_color(normal_color);
    }
    
    draw_roundrect_ext(button_x, restart_y, button_x + button_w, restart_y + button_h, 10, 10, false);
    
    draw_set_color(border_color);
    draw_roundrect_ext(button_x, restart_y, button_x + button_w, restart_y + button_h, 10, 10, true);
    draw_roundrect_ext(button_x + 1, restart_y + 1, button_x + button_w - 1, restart_y + button_h - 1, 10, 10, true);
    
    draw_set_color(c_white);
    draw_text_transformed(button_x + button_w / 2, restart_y + button_h / 2, "↻ RESTART", 1.3, 1.3, 0);
    
    // NÚT 3: EXIT
    var exit_y = start_y + (button_h + button_spacing) * 2;
    
    if (menu_button_hover == 2) {
        draw_set_color(make_color_rgb(180, 80, 80));  // Đỏ khi hover
    } else {
        draw_set_color(make_color_rgb(130, 70, 70));  // Đỏ tối
    }
    
    draw_roundrect_ext(button_x, exit_y, button_x + button_w, exit_y + button_h, 10, 10, false);
    
    draw_set_color(make_color_rgb(200, 100, 100));
    draw_roundrect_ext(button_x, exit_y, button_x + button_w, exit_y + button_h, 10, 10, true);
    draw_roundrect_ext(button_x + 1, exit_y + 1, button_x + button_w - 1, exit_y + button_h - 1, 10, 10, true);
    
    draw_set_color(c_white);
    draw_text_transformed(button_x + button_w / 2, exit_y + button_h / 2, "✕ EXIT", 1.3, 1.3, 0);
    
    // Hướng dẫn phím
    draw_set_color(make_color_rgb(180, 185, 160));
    draw_set_halign(fa_center);
    draw_text(popup_x + popup_w / 2, popup_y + popup_h - 30, "Nhấn ESC để tiếp tục chơi");
    
    // Reset
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

// Reset
draw_set_alpha(1);
draw_set_color(c_white);
