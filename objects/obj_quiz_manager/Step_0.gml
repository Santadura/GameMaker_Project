if (show_quiz) {
    // Kiểm tra phím A, B, C, D
    if (keyboard_check_pressed(ord("A"))) {
        chosen_answer = "A";
        check_answer();
    }
    else if (keyboard_check_pressed(ord("B"))) {
        chosen_answer = "B";
        check_answer();
    }
    else if (keyboard_check_pressed(ord("C"))) {
        chosen_answer = "C";
        check_answer();
    }
    else if (keyboard_check_pressed(ord("D"))) {
        chosen_answer = "D";
        check_answer();
    }
}

// Function kiểm tra đáp án
function check_answer() {
    if (chosen_answer == correct_answer) {
        show_message("Đúng rồi!");
        instance_destroy(other); // Xóa obstacle
    } else {
        show_message("Sai rồi!");
        // Xử lý khi sai (trừ máu, v.v.)
    }
    
    // Đóng popup và tiếp tục game
    show_quiz = false;
    game_paused = false;
    instance_activate_all(); // Activate lại tất cả objects
}
