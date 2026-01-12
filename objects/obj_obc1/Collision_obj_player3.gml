// Collision với player
if (instance_exists(obj_quiz_manager) && !obj_quiz_manager.show_quiz) {
    obj_quiz_manager.show_quiz = true;
    obj_quiz_manager.game_paused = true;
	obj_quiz_manager.obstacle_ref = id;
    obj_quiz_manager.pick_random_question(); 
    
    instance_deactivate_all(true); 
    instance_activate_object(obj_quiz_manager);
}
