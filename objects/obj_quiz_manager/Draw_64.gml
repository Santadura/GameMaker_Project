if (show_quiz) {
	
	draw_set_font(fnt_vietnamese);
    // Lấy kích thước màn hình
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();
    
    // === VẼ NỀN TỐI PHỦ TOÀN MÀN HÌNH ===
    draw_set_alpha(0.85);
    draw_rectangle_color(0, 0, screen_w, screen_h, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    
    // === THIẾT LẬP POPUP ===
    var popup_w = 700;
    var popup_h = 450;
    var popup_x = screen_w / 2 - popup_w / 2;
    var popup_y = screen_h / 2 - popup_h / 2;
    var padding = 30;
    var corner_radius = 20;
    
    // === VẼ BÓNG ĐỔ (SHADOW) ===
    draw_set_alpha(0.4);
    draw_roundrect_color_ext(popup_x + 8, popup_y + 8, popup_x + popup_w + 8, popup_y + popup_h + 8, 
                             corner_radius, corner_radius, c_black, c_black, false);
    draw_set_alpha(1);
    
    // === VẼ NỀN POPUP (Màu xám tối như game) ===
    draw_roundrect_color_ext(popup_x, popup_y, popup_x + popup_w, popup_y + popup_h, 
                             corner_radius, corner_radius, 
                             make_color_rgb(70, 75, 70),   // Xám xanh tối
                             make_color_rgb(55, 60, 55),   // Gradient tối hơn
                             false);
    
    // === VẼ VIỀN POPUP (Màu xanh lá khô) ===
    draw_set_color(make_color_rgb(120, 140, 90)); // Xanh lá khô
    for (var i = 0; i < 3; i++) {
        draw_roundrect_ext(popup_x - i, popup_y - i, popup_x + popup_w + i, popup_y + popup_h + i, 
                           corner_radius, corner_radius, true);
    }
    
    // === VẼ THANH HEADER (Màu đá mộ) ===
    draw_roundrect_color_ext(popup_x, popup_y, popup_x + popup_w, popup_y + 80, 
                             corner_radius, corner_radius, 
                             make_color_rgb(90, 95, 85),   // Màu đá
                             make_color_rgb(70, 75, 65),   // Gradient
                             false);
    
    // === VẼ TIÊU ĐỀ ===
    draw_set_color(make_color_rgb(220, 230, 200)); // Màu vàng nhạt cũ
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_transformed(popup_x + popup_w/2, popup_y + 40, "BẠN QUÁ NGU, HÃY TRẢ LỜI ĐỂ SỐNG SÓT", 1.5, 1.5, 0);
    
    // === VẼ CÂU HỎI ===
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    // Vẽ khung câu hỏi (màu giấy cũ)
    var question_y = popup_y + 100;
    draw_roundrect_color_ext(popup_x + padding, question_y, 
                            popup_x + popup_w - padding, question_y + 70,
                            10, 10,
                            make_color_rgb(200, 195, 170), // Màu giấy cũ
                            make_color_rgb(190, 185, 160),
                            false);
    
    // Viền câu hỏi
    draw_set_color(make_color_rgb(100, 95, 70));
    draw_roundrect_ext(popup_x + padding, question_y, 
                      popup_x + popup_w - padding, question_y + 70,
                      10, 10, true);
    
    // Text câu hỏi
    draw_set_color(make_color_rgb(40, 35, 30)); // Màu nâu đậm
    draw_text_ext(popup_x + padding + 15, question_y + 15, 
                  question_bank[current_question][0], 
                  20, popup_w - padding * 2 - 30);
    
    // === VẼ CÁC ĐÁP ÁN ===
    var answer_y = question_y + 90;
    var answer_h = 50;
    var answer_spacing = 10;
    
    // Màu cho từng đáp án (tông xám, nâu, xanh tối)
    var answer_colors = [
        make_color_rgb(140, 130, 120), // A - Xám nâu
        make_color_rgb(120, 135, 110), // B - Xám xanh
        make_color_rgb(135, 120, 105), // C - Nâu xám
        make_color_rgb(110, 125, 100)  // D - Xanh rêu
    ];
    
    var answer_border_colors = [
        make_color_rgb(180, 160, 140), // A
        make_color_rgb(150, 170, 130), // B
        make_color_rgb(170, 150, 130), // C
        make_color_rgb(140, 160, 120)  // D
    ];
    
    // Vẽ 4 đáp án
    for (var i = 0; i < 4; i++) {
        var btn_y = answer_y + i * (answer_h + answer_spacing);
        
        // Nền đáp án
        draw_roundrect_color_ext(popup_x + padding, btn_y,
                                popup_x + popup_w - padding, btn_y + answer_h,
                                10, 10,
                                answer_colors[i], answer_colors[i], false);
        
        // Viền đáp án
        draw_set_color(answer_border_colors[i]);
        draw_roundrect_ext(popup_x + padding, btn_y,
                          popup_x + popup_w - padding, btn_y + answer_h,
                          10, 10, true);
        draw_roundrect_ext(popup_x + padding + 1, btn_y + 1,
                          popup_x + popup_w - padding - 1, btn_y + answer_h - 1,
                          10, 10, true);
        
        // Text đáp án (màu vàng nhạt)
        draw_set_color(make_color_rgb(230, 235, 210));
        draw_set_halign(fa_left);
        draw_set_valign(fa_middle);
        draw_text(popup_x + padding + 20, btn_y + answer_h/2, 
                 question_bank[current_question][i + 1]);
    }
    
    // === VẼ HƯỚNG DẪN Ở DƯỚI ===
    draw_set_color(make_color_rgb(180, 185, 160));
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(popup_x + popup_w/2, popup_y + popup_h - 10, 
             "Nhấn phím A, B, C hoặc D để chọn đáp án");
    
    // Reset draw settings
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
}
