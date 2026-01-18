if (show_quiz && !show_result) {
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

// Đóng popup kết quả
if (show_result) {
    if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
        show_result = false;
        show_quiz = false;
        game_paused = false;
        instance_activate_all();
        
        if (is_correct && instance_exists(obstacle_ref)) {
            instance_destroy(obstacle_ref);
        }
    }
}

// Function kiểm tra đáp án
// Function kiểm tra đáp án
function check_answer() {
    is_correct = (chosen_answer == correct_answer);
    
    if (is_correct) {
        var praise_messages = [
            "Xuất sắc! Bạn thật thông minh!",
            "Tuyệt vời! Tiếp tục phát huy nhé!",
            "Đúng rồi! Kiến thức của bạn rất tốt!",
            "Giỏi lắm! Bạn hiểu bài rất rõ!",
            "Hoàn hảo! Cứ như vậy!"
        ];
        result_message = praise_messages[irandom(array_length(praise_messages) - 1)];
    }
    else {
        var encourage_messages = [
            "Đừng nản! Lần sau bạn sẽ làm tốt hơn!",
            "Không sao! Mỗi lần sai là một lần học hỏi!",
            "Cố gắng lên! Bạn gần đúng rồi đấy!",
            "Ôn lại bài nhé! Bạn sẽ làm được!",
            "Tiếp tục cố gắng! Thất bại là mẹ thành công!"
        ];
        result_message = encourage_messages[irandom(array_length(encourage_messages) - 1)];
    }
    
    show_result = true;  // Hiện popup kết quả
}

