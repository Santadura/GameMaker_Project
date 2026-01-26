// Kiểm tra player có tồn tại không
if (!instance_exists(obj_player1_3)) {  // Thay obj_player3 = tên player của bạn
    exit;
}

var dist = distance_to_object(obj_player1_3);

// Xác định hướng player
if (obj_player1_3.x < x) {
    facing_direction = "left";
} else {
    facing_direction = "right";
}

// === TRẠNG THÁI CHASE (Rượt đuổi) ===
if (state == "chase") {
    // Kiểm tra nếu player ở trong phạm vi tấn công
    if (dist < attack_range && attack_cooldown <= 0) {
        state = "attack";
        attack_timer = attack_duration;
        speed = 0;  // Dừng lại khi tấn công
        
        // Đổi sang sprite attack
        if (facing_direction == "left") {
            sprite_index = spr_left_attack;
        } else {
            sprite_index = spr_right_attack;
        }
        image_index = 0;  // Bắt đầu animation từ đầu
    }
    else {
        // Di chuyển về phía player
        move_towards_point(obj_player1_3.x, obj_player1_3.y, chase_speed);
        
        // Đổi sprite theo hướng
        if (facing_direction == "left") {
            sprite_index = spr_left_run;
        } else {
            sprite_index = spr_right_run;
        }
    }
}

// === TRẠNG THÁI ATTACK (Tấn công) ===
else if (state == "attack") {
    speed = 0;  // Đứng yên khi tấn công
    attack_timer--;
    
    // Kiểm tra đánh trúng player trong phạm vi
    if (dist < attack_hit_range && !has_triggered_quiz) {
        has_triggered_quiz = true;
        trigger_quiz();
    }
    
    // Kết thúc animation tấn công
    if (attack_timer <= 0) {
        state = "chase";
        attack_cooldown = room_speed * 2;  // Cooldown 2 giây
        
        // Quay lại sprite chạy
        if (facing_direction == "left") {
            sprite_index = spr_left_run;
        } else {
            sprite_index = spr_right_run;
        }
    }
}

// Giảm cooldown
if (attack_cooldown > 0) {
    attack_cooldown--;
}

// Tự hủy nếu đi quá xa khỏi room
if (x < -200 || x > room_width + 200 || y < -200 || y > room_height + 200) {
    instance_destroy();
}

// Function trigger quiz khi đánh trúng player
function trigger_quiz() {
    // Kiểm tra quiz manager
    if (!instance_exists(obj_quiz_manager)) {
        instance_create_depth(0, 0, -9999, obj_quiz_manager);
    }
    
    // Hiện popup quiz
    if (!obj_quiz_manager.show_quiz) {
        obj_quiz_manager.show_quiz = true;
        obj_quiz_manager.game_paused = true;
        obj_quiz_manager.obstacle_ref = id;
        
        // Thiết lập môn và level
        obj_quiz_manager.set_subject_and_level("biology", 3);
        obj_quiz_manager.pick_random_question();
        
        // Dừng game
        instance_deactivate_all(true);
        instance_activate_object(obj_quiz_manager);
    }
}
