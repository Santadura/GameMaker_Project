// Vị trí nút pause trên GUI (góc trên phải)
pause_gui_x = display_get_gui_width() - 70;
pause_gui_y = 20;

// Kích thước nút pause
pause_button_width = 50;
pause_button_height = 50;

// Trạng thái
game_paused = false;
pause_hover = false;

// Menu pause - 3 nút
menu_button_selected = 0;  // 0=Resume, 1=Restart, 2=Exit
menu_button_hover = -1;
