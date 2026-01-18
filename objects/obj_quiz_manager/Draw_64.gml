// ===== POPUP CÂU HỎI =====
if (show_quiz && !show_result) {
    draw_set_font(fnt_vietnamese);
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();
   
    draw_set_alpha(0.85);
    draw_rectangle_color(0, 0, screen_w, screen_h, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    
    var popup_w = 700;
    var popup_h = 450;
    var popup_x = screen_w / 2 - popup_w / 2;
    var popup_y = screen_h / 2 - popup_h / 2;
    var padding = 30;
    var corner_radius = 20;
    
    draw_set_alpha(0.4);
    draw_roundrect_color_ext(popup_x + 8, popup_y + 8, popup_x + popup_w + 8, popup_y + popup_h + 8, 
                             corner_radius, corner_radius, c_black, c_black, false);
    draw_set_alpha(1);
    
    draw_roundrect_color_ext(popup_x, popup_y, popup_x + popup_w, popup_y + popup_h, 
                             corner_radius, corner_radius, 
                             make_color_rgb(70, 75, 70),
                             make_color_rgb(55, 60, 55),
                             false);
    
    draw_set_color(make_color_rgb(120, 140, 90));
    for (var i = 0; i < 3; i++) {
        draw_roundrect_ext(popup_x - i, popup_y - i, popup_x + popup_w + i, popup_y + popup_h + i, 
                           corner_radius, corner_radius, true);
    }
    
    draw_roundrect_color_ext(popup_x, popup_y, popup_x + popup_w, popup_y + 80, 
                             corner_radius, corner_radius, 
                             make_color_rgb(90, 95, 85), 
                             make_color_rgb(70, 75, 65),  
                             false);
    
    draw_set_color(make_color_rgb(220, 230, 200)); 
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_transformed(popup_x + popup_w/2, popup_y + 40, "HÃY TRẢ LỜI ĐỂ SỐNG SÓT", 1.5, 1.5, 0);
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    var question_y = popup_y + 100;
    draw_roundrect_color_ext(popup_x + padding, question_y, 
                            popup_x + popup_w - padding, question_y + 70,
                            10, 10,
                            make_color_rgb(200, 195, 170), 
                            make_color_rgb(190, 185, 160),
                            false);
    
    draw_set_color(make_color_rgb(100, 95, 70));
    draw_roundrect_ext(popup_x + padding, question_y, 
                      popup_x + popup_w - padding, question_y + 70,
                      10, 10, true);
    
    // Lấy câu hỏi theo môn và level
    var question_array = get_current_question_array();
    
    draw_set_color(make_color_rgb(40, 35, 30)); 
    draw_text_ext(popup_x + padding + 15, question_y + 15, 
                  question_array[current_question][0], 
                  20, popup_w - padding * 2 - 30);
    
    var answer_y = question_y + 90;
    var answer_h = 50;
    var answer_spacing = 10;
    
    var answer_colors = [
        make_color_rgb(140, 130, 120), 
        make_color_rgb(120, 135, 110), 
        make_color_rgb(135, 120, 105),
        make_color_rgb(110, 125, 100) 
    ];
    
    var answer_border_colors = [
        make_color_rgb(180, 160, 140), 
        make_color_rgb(150, 170, 130),
        make_color_rgb(170, 150, 130), 
        make_color_rgb(140, 160, 120)  
    ];
    
    for (var i = 0; i < 4; i++) {
        var btn_y = answer_y + i * (answer_h + answer_spacing);
        
        draw_roundrect_color_ext(popup_x + padding, btn_y,
                                popup_x + popup_w - padding, btn_y + answer_h,
                                10, 10,
                                answer_colors[i], answer_colors[i], false);
        
        draw_set_color(answer_border_colors[i]);
        draw_roundrect_ext(popup_x + padding, btn_y,
                          popup_x + popup_w - padding, btn_y + answer_h,
                          10, 10, true);
        draw_roundrect_ext(popup_x + padding + 1, btn_y + 1,
                          popup_x + popup_w - padding - 1, btn_y + answer_h - 1,
                          10, 10, true);
        
        draw_set_color(make_color_rgb(230, 235, 210));
        draw_set_halign(fa_left);
        draw_set_valign(fa_middle);
        draw_text(popup_x + padding + 20, btn_y + answer_h/2, 
                 question_array[current_question][i + 1]);
    }
    
    draw_set_color(make_color_rgb(180, 185, 160));
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(popup_x + popup_w/2, popup_y + popup_h - 10, 
             "Nhấn phím A, B, C hoặc D để chọn đáp án");
    
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
}

// ===== POPUP KẾT QUẢ =====
if (show_result) {
    draw_set_font(fnt_vietnamese);
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();
    
    // Nền tối
    draw_set_alpha(0.85);
    draw_rectangle_color(0, 0, screen_w, screen_h, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    
    // Thiết lập popup
    var popup_w = 650;
    var popup_h = is_correct ? 400 : 280;  // Cao hơn nếu đúng (có feedback)
    var popup_x = screen_w / 2 - popup_w / 2;
    var popup_y = screen_h / 2 - popup_h / 2;
    var padding = 25;
    var corner_radius = 20;
    
    // Bóng đổ
    draw_set_alpha(0.4);
    draw_roundrect_color_ext(popup_x + 8, popup_y + 8, popup_x + popup_w + 8, popup_y + popup_h + 8, 
                             corner_radius, corner_radius, c_black, c_black, false);
    draw_set_alpha(1);
    
    // Màu nền tùy theo đúng/sai
    if (is_correct) {
        // Nền xanh lá nhạt khi đúng
        draw_roundrect_color_ext(popup_x, popup_y, popup_x + popup_w, popup_y + popup_h, 
                                 corner_radius, corner_radius, 
                                 make_color_rgb(85, 107, 47),   // Xanh lá tối
                                 make_color_rgb(70, 90, 35),
                                 false);
        
        // Viền xanh lá
        draw_set_color(make_color_rgb(144, 238, 144));
        for (var i = 0; i < 3; i++) {
            draw_roundrect_ext(popup_x - i, popup_y - i, popup_x + popup_w + i, popup_y + popup_h + i, 
                               corner_radius, corner_radius, true);
        }
        
        // Header xanh
        draw_roundrect_color_ext(popup_x, popup_y, popup_x + popup_w, popup_y + 100, 
                                 corner_radius, corner_radius, 
                                 make_color_rgb(34, 139, 34),
                                 make_color_rgb(50, 155, 50),
                                 false);
    }
    else {
        // Nền đỏ nhạt khi sai
        draw_roundrect_color_ext(popup_x, popup_y, popup_x + popup_w, popup_y + popup_h, 
                                 corner_radius, corner_radius, 
                                 make_color_rgb(105, 60, 60),   // Đỏ nâu tối
                                 make_color_rgb(90, 50, 50),
                                 false);
        
        // Viền đỏ
        draw_set_color(make_color_rgb(205, 92, 92));
        for (var i = 0; i < 3; i++) {
            draw_roundrect_ext(popup_x - i, popup_y - i, popup_x + popup_w + i, popup_y + popup_h + i, 
                               corner_radius, corner_radius, true);
        }
        
        // Header đỏ
        draw_roundrect_color_ext(popup_x, popup_y, popup_x + popup_w, popup_y + 100, 
                                 corner_radius, corner_radius, 
                                 make_color_rgb(139, 0, 0),
                                 make_color_rgb(155, 20, 20),
                                 false);
    }
    
    // Tiêu đề
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    if (is_correct) {
        draw_text_transformed(popup_x + popup_w/2, popup_y + 50, "CHÍNH XÁC!", 2, 2, 0);
    }
    else {
        draw_text_transformed(popup_x + popup_w/2, popup_y + 50, "SAI RỒI!", 2, 2, 0);
    }
    
    // Lời động viên
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_color(make_color_rgb(255, 255, 200));
    
    var message_y = popup_y + 120;
     draw_text_ext(popup_x + popup_w/2, message_y, result_message, 25, popup_w - 50);
    if (is_correct) {
        // Feedback giải thích
        var question_array = get_current_question_array();
        var feedback = question_array[current_question][6];  // Index 6 là feedback
        
        var feedback_y = message_y + 50;
        
        // Khung feedback
        draw_roundrect_color_ext(popup_x + padding, feedback_y, 
                                popup_x + popup_w - padding, feedback_y + 130,
                                10, 10,
                                make_color_rgb(255, 255, 220),
                                make_color_rgb(245, 245, 210),
                                false);
        
        draw_set_color(make_color_rgb(100, 140, 70));
        draw_roundrect_ext(popup_x + padding, feedback_y, 
                          popup_x + popup_w - padding, feedback_y + 130,
                          10, 10, true);
        
        // Text feedback
        draw_set_color(make_color_rgb(40, 35, 30));
        draw_set_halign(fa_left);
        draw_text_ext(popup_x + padding + 15, feedback_y + 15, 
                     "📖 Giải thích: " + feedback, 
                     22, popup_w - padding * 2 - 30);
    }
    else {
        // Hiển thị đáp án đúng
        draw_set_color(make_color_rgb(255, 200, 200));
        draw_text(popup_x + popup_w/2, message_y + 70, 
                 "Đáp án đúng là: " + correct_answer);
    }
    
    // Hướng dẫn đóng popup
    draw_set_color(make_color_rgb(200, 200, 180));
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(popup_x + popup_w/2, popup_y + popup_h - 15, 
             "Nhấn SPACE hoặc ENTER để tiếp tục");
    
    // Reset
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
}

// Function helper để lấy mảng câu hỏi hiện tại
function get_current_question_array() {
    var question_array = [];
    
    switch(current_subject) {
        case "physics":
            switch(current_level) {
                case 1: question_array = physics_questions.level1; break;
                case 2: question_array = physics_questions.level2; break;
                case 3: question_array = physics_questions.level3; break;
            }
            break;
        case "chemistry":
            switch(current_level) {
                case 1: question_array = chemistry_questions.level1; break;
                case 2: question_array = chemistry_questions.level2; break;
                case 3: question_array = chemistry_questions.level3; break;
            }
            break;
        case "biology":
            switch(current_level) {
                case 1: question_array = biology_questions.level1; break;
                case 2: question_array = biology_questions.level2; break;
                case 3: question_array = biology_questions.level3; break;
            }
            break;
    }
    
    return question_array;
}
