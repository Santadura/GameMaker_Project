hspeed = 0
vspeed = 0

// ===== XỬ LÝ ATTACK =====
if (keyboard_check_pressed(vk_space) && !is_attacking) {
    is_attacking = true;
    attack_timer = attack_duration;
    
    // Đổi sang sprite attack và tạo hitbox theo hướng
    switch(last_direction) {
        case "up":
            sprite_index = spr_player_up_attack;
            check_attack_hit(0, -attack_offset);  // Hitbox phía trên
            break;
        case "down":
            sprite_index = spr_player_down_attack;
            check_attack_hit(0, attack_offset);   // Hitbox phía dưới
            break;
        case "left":
            sprite_index = spr_player_left_attack;
            check_attack_hit(-attack_offset, 0);  // Hitbox bên trái
            break;
        case "right":
            sprite_index = spr_player_right_attack;
            check_attack_hit(attack_offset, 0);   // Hitbox bên phải
            break;
    }
    image_index = 0;  // Bắt đầu animation từ đầu
}

// Đếm thời gian attack
if (is_attacking) {
    attack_timer--;
    
    if (attack_timer <= 0) {
        is_attacking = false;
        
        // Quay về idle sau khi attack
        switch(last_direction) {
            case "up":
                sprite_index = spr_player_up_idle;
                break;
            case "down":
                sprite_index = spr_player_down_idle;
                break;
            case "left":
                sprite_index = spr_player_left_idle;
                break;
            case "right":
                sprite_index = spr_player_right_idle;
                break;
        }
    }
}

// ===== DI CHUYỂN (chỉ khi không attack) =====
if (!is_attacking) {
    if(keyboard_check(ord("W"))){
        vspeed = -player_speed    
        sprite_index = spr_player_up_walk
        last_direction = "up";
    }
    else if(keyboard_check_released(ord("W"))){
        vspeed = 0;
        sprite_index = spr_player_up_idle
    }

    if(keyboard_check(ord("S"))){
        vspeed = player_speed
        sprite_index = spr_player_down_walk
        last_direction = "down";
    }
    else if(keyboard_check_released(ord("S"))){
        vspeed = 0;
        sprite_index = spr_player_down_idle
    }

    if(keyboard_check(ord("A"))){
        hspeed = -player_speed
        sprite_index = spr_player_left_walk
        last_direction = "left";
    }
    else if(keyboard_check_released(ord("A"))){
        hspeed = 0;
        sprite_index = spr_player_left_idle
    }

    if(keyboard_check(ord("D"))){
        hspeed = player_speed
        sprite_index = spr_player_right_walk
        last_direction = "right";
    }
    else if(keyboard_check_released(ord("D"))){
        hspeed = 0;
        sprite_index = spr_player_right_idle
    }
}
else {
    // Dừng di chuyển khi đang attack
    hspeed = 0;
    vspeed = 0;
}

// ===== PHÍM DEBUG =====
if(keyboard_check_pressed(ord("H"))){
    global.hp -= global.hp_lost;
    global.image_health_index = global.max_hp - global.hp;
    global.incorrect+=1
}

if(keyboard_check_pressed(ord("J"))){
    global.point += 1
    global.correcting+=1
}

// ===== KIỂM TRA GAME OVER =====
if (global.hp <= 0) {
    global.win = 0
    room_goto(rm_end);
}

// ===== TẠO CỔNG KHI ĐỦ ĐIỂM =====
if (global.correcting >= 3) {
    if(!instance_exists(obj_gate)){
        instance_create_layer(0,0,"Instances",obj_gate)
    }
}

// ===== XỬ LÝ VA CHẠM =====
#region xử lý va chạm
    if place_meeting(x+hspeed,y,tile_wall){
        while(not place_meeting(x+sign(hspeed),y,tile_wall)){
            x = x + sign(hspeed)
        }
        hspeed = 0    
    }
    
    if place_meeting(x,y+vspeed,tile_wall){    
        while(not place_meeting(x,y+sign(vspeed),tile_wall)){
            y = y + sign(vspeed)
        }
        vspeed = 0
    }
#endregion

// ===== FUNCTION ATTACK HITBOX =====
function check_attack_hit(offset_x, offset_y) {
    var hitbox_x = x + offset_x;
    var hitbox_y = y + offset_y;
    
    // Tìm tất cả enemy trong phạm vi
    with (ene1) {
        var dist = point_distance(hitbox_x, hitbox_y, x, y);
        
        if (dist < other.attack_range) {
            // Đánh trúng enemy
            instance_destroy();
           // other.global.point += 1;
           // other.global.correcting += 1;
            
            // Hiệu ứng (optional)
            // effect_create_above(ef_spark, x, y, 1, c_yellow);
        }
    }
}
