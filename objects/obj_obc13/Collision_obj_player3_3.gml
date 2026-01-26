// Collision Event của obstacle với player
if (!obj_quiz_manager.show_quiz) {
    obj_quiz_manager.show_quiz = true;
    obj_quiz_manager.game_paused = true;
    obj_quiz_manager.obstacle_ref = id;
    
    // Thiết lập môn và level (tùy vào room)
    obj_quiz_manager.set_subject_and_level("physics", 3);  // Vật lý level 1
    // Hoặc: obj_quiz_manager.set_subject_and_level("chemistry", 2);  // Hóa level 2
    // Hoặc: obj_quiz_manager.set_subject_and_level("biology", 3);  // Sinh level 3
    
    obj_quiz_manager.pick_random_question();
    
    instance_deactivate_all(true);
    instance_activate_object(obj_quiz_manager);
}
