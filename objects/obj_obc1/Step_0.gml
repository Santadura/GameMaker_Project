// Kiểm tra player có tồn tại không
if (!instance_exists(obj_player3)) {
    exit;  // Thoát khỏi Step Event nếu player không tồn tại
}

// Tìm khoảng cách đến player
var dist = distance_to_object(obj_player3);

// === TRẠNG THÁI IDLE ===
if (state == "idle") {
    sprite_index = spr_autumn;
    speed = 0;
    image_xscale = 1;
    image_yscale = 1;
    
    // Kiểm tra nếu player ở gần
    if (dist < detection_range) {
        state = "alert";
        sprite_index = spr_idle;
        speed = 0;
        alarm[0] = room_speed * 1;
    }
}

// === TRẠNG THÁI ALERT (Chờ 2s) ===
else if (state == "alert") {
    sprite_index = spr_idle;
    speed = 0;
    image_xscale = 3;
    image_yscale = 3;
}

// === TRẠNG THÁI CHASE (Rượt mãi mãi) ===
else if (state == "chase") {
    // TO HỆT CỠ KHI RƯỢT
    image_xscale = 3;
    image_yscale = 3;
    
    // Di chuyển về phía player
    move_towards_point(obj_player3.x, obj_player3.y, chase_speed);
    
    // Đổi sprite theo hướng
    if (obj_player3.x < x) {
        sprite_index = spr_left;
    }
    else {
        sprite_index = spr_right;
    }
}
