hspeed = 0
vspeed = 0

// ===== XỬ LÝ ATTACK =====
if (keyboard_check_pressed(vk_space) && !is_attacking) {
	if global.sound == 1
		audio_play_sound(snd_player_attack,1,false)
    is_attacking = true;
    attack_timer = attack_duration;
    attack_hit_triggered = false;  // Reset flag
    
    // Đổi sang sprite attack theo hướng
    switch(last_direction) {
        case "up":
            sprite_index = spr_player_up_attack;
            break;
        case "down":
            sprite_index = spr_player_down_attack;
            break;
        case "left":
            sprite_index = spr_player_left_attack;
            break;
        case "right":
            sprite_index = spr_player_right_attack;
            break;
    }
    image_index = 0;  // Bắt đầu từ đầu
}

// Đếm thời gian attack
if (is_attacking) {
    attack_timer--;
    
    // KÍCH HOẠT HITBOX Ở GIỮA ANIMATION (khi còn 10 frames)
    if (attack_timer == attack_hit_frame && !attack_hit_triggered) {
        attack_hit_triggered = true;
        
        // Tạo hitbox theo hướng
        switch(last_direction) {
            case "up":
                check_attack_hit(0, -attack_offset);
                break;
            case "down":
                check_attack_hit(0, attack_offset);
                break;
            case "left":
                check_attack_hit(-attack_offset, 0);
                break;
            case "right":
                check_attack_hit(attack_offset, 0);
                break;
        }
    }
    
    // Kết thúc attack
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
    
    // Kiểm tra có enemy không
    if (!instance_exists(ene1)) {
        return;
    }
    
    // Tìm enemy gần nhất
    var nearest_enemy = instance_nearest(hitbox_x, hitbox_y, ene1);
    
    if (instance_exists(nearest_enemy)) {
        var dist = point_distance(hitbox_x, hitbox_y, nearest_enemy.x, nearest_enemy.y);
        
        if (dist < attack_range) {
            // Đánh trúng
            instance_destroy(nearest_enemy);
            
            // Tăng điểm
            //global.point += 1;
            //global.correcting += 1;
        }
    }
}
