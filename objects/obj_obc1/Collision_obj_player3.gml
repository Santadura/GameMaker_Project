// Collision với player
if (!obj_quiz_manager.show_quiz) {
    obj_quiz_manager.show_quiz = true;
    obj_quiz_manager.game_paused = true;
    obj_quiz_manager.pick_random_question(); // Random câu hỏi
    
    // Dừng game
    instance_deactivate_all(true); // Deactivate tất cả trừ object này
    instance_activate_object(obj_quiz_manager); // Activate quiz manager
}
