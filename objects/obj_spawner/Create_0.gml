// Thiết lập spawner
spawn_active = true;
min_spawn_time = 3;  // Tối thiểu 3 giây
max_spawn_time = 8;  // Tối đa 8 giây

// Vị trí spawn: góc dưới bên trái
spawn_x = 50;
spawn_y = room_height - 50;

// Enemy cho room này
current_enemy = ene1;  // Mặc định

// Thiết lập alarm spawn đầu tiên
alarm[0] = room_speed * irandom_range(min_spawn_time, max_spawn_time);
