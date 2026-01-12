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
        if (instance_exists(obstacle_ref)) {
            instance_destroy(obstacle_ref);
        }
    } else {
        show_message("Sai rồi!");
    }
    show_quiz = false;
    game_paused = false;
    obstacle_ref = noone;
    instance_activate_all();
}

