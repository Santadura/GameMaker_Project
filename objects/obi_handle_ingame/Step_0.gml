// Lấy vị trí chuột trên GUI
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// ===== NÚT PAUSE GÓC TRÊN PHẢI =====
pause_hover = point_in_rectangle(mx, my, 
    pause_gui_x, pause_gui_y, 
    pause_gui_x + pause_button_width, 
    pause_gui_y + pause_button_height);

// Click nút pause
if (pause_hover && mouse_check_button_pressed(mb_left) && !game_paused) {
    game_paused = true;
    instance_deactivate_all(true);
    instance_activate_object(obi_handle_ingame);
    
    if (instance_exists(obj_quiz_manager)) {
        instance_activate_object(obj_quiz_manager);
    }
}

// Phím ESC để pause
if (keyboard_check_pressed(vk_escape) && !game_paused) {
    game_paused = true;
    instance_deactivate_all(true);
    instance_activate_object(obi_handle_ingame);
    
    if (instance_exists(obj_quiz_manager)) {
        instance_activate_object(obj_quiz_manager);
    }
}

// ===== XỬ LÝ MENU PAUSE (3 NÚT) =====
if (game_paused) {
    // Lấy lại tọa độ chuột GUI
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();
    
    // Vị trí popup
    var popup_w = 400;
    var popup_h = 450;
    var popup_x = screen_w / 2 - popup_w / 2;
    var popup_y = screen_h / 2 - popup_h / 2;
    
    // Vị trí 3 nút
    var button_w = 250;
    var button_h = 60;
    var button_spacing = 20;
    var start_y = popup_y + 140;
    var button_x = popup_x + popup_w / 2 - button_w / 2;
    
    var resume_y = start_y;
    var restart_y = start_y + button_h + button_spacing;
    var exit_y = start_y + (button_h + button_spacing) * 2;
    
    // RESET hover trước
    menu_button_hover = -1;
    
    // Kiểm tra từng nút riêng biệt (KHÔNG DÙNG ELSE IF)
    
    // NÚT RESUME
    if (point_in_rectangle(mx, my, button_x, resume_y, button_x + button_w, resume_y + button_h)) {
        menu_button_hover = 0;
        
        if (mouse_check_button_pressed(mb_left)) {
            game_paused = false;
            instance_activate_all();
        }
    }
    
    // NÚT RESTART
    if (point_in_rectangle(mx, my, button_x, restart_y, button_x + button_w, restart_y + button_h)) {
        menu_button_hover = 1;
        
        if (mouse_check_button_pressed(mb_left)) {
            game_paused = false;
            instance_activate_all();
            room_restart();
        }
    }
		
    // NÚT EXIT
    if (point_in_rectangle(mx, my, button_x, exit_y, button_x + button_w, exit_y + button_h)) {
        menu_button_hover = 2;
        
        if (mouse_check_button_pressed(mb_left)) {
            room_goto(rm_main);
            // Hoặc: room_goto(rm_menu);
        }
    }
    
    // ESC để resume
    if (keyboard_check_pressed(vk_escape)) {
        game_paused = false;
        instance_activate_all();
    }
}
