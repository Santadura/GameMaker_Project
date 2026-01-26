// Kiểm tra room hiện tại và chọn enemy tương ứng
switch(room) {
    // === BIOLOGY ===
    case rm_biology:
        current_enemy = ene1;
        break;
    
    case rm_biology_2:
        current_enemy = ene1_2;
        break;
    
    case rm_biology_3:
        current_enemy = ene1_3;
        break;
    
    // === PHYSICS ===
    case rm_physiscal:
        current_enemy = ene3;
        break;
    
    case rm_physiscal_2:
        current_enemy = ene3_2;
        break;
    
    case rm_physiscal_3:
        current_enemy = ene3_3;
        break;
    
    // === CHEMISTRY ===
    case rm_chemistry:
        current_enemy = ene2;
        break;
    
    case rm_chemistry_2:
        current_enemy = ene2_2;
        break;
    
    case rm_chemistry_3:
        current_enemy = ene2_3;
        break;
    
    default:
        current_enemy = ene1;
        break;
}

// Xác định player object tương ứng với room
var player_obj = noone;

switch(room) {
    // === LEVEL 1 ===
    case rm_biology:   
	    player_obj = obj_player1;
        break;
		
    case rm_physiscal:
	    player_obj = obj_player3;
        break;
		
    case rm_chemistry:
        player_obj = obj_player2;
        break;
    
    // === LEVEL 2 ===
    case rm_biology_2:
	    player_obj = obj_player1_2;
        break;
    case rm_physiscal_2:
	    player_obj = obj_player3_2;
        break;
    case rm_chemistry_2:
        player_obj = obj_player2_2;
        break;
    
    // === LEVEL 3 ===
    case rm_biology_3:
	    player_obj = obj_player1_3;
        break;
    case rm_physiscal_3:
	    player_obj = obj_player2_3;
        break;
    case rm_chemistry_3:
        player_obj = obj_player3_3;
        break;
    
    default:
        player_obj = obj_player1;
        break;
}

// Spawn enemy từ góc dưới trái nếu player tồn tại
if (spawn_active && instance_exists(player_obj)) {
    // Spawn enemy tương ứng với room hiện tại
    var enemy = instance_create_depth(spawn_x, spawn_y, -100, current_enemy);
    
    // Set state nếu có
    if (variable_instance_exists(enemy, "state")) {
        enemy.state = "chase";
    }
}

// Set alarm cho lần spawn tiếp theo
alarm[0] = room_speed * irandom_range(min_spawn_time, max_spawn_time);
