//if room == rm_biology {
//	instance_create_layer(x, y, "Instances", ene1)
//}
//if room == rm_chemistry {
//	instance_create_layer(x, y, "Instances", ene1)
//}
//if room == rm_physiscal {
	//(x, y, "Instances", ene1)
//}
//alarm[0] = random_range(180,300)

// Spawn enemy từ góc dưới trái
if (spawn_active && instance_exists(obj_player1)) {  // Hoặc obj_player1 tùy game bạn
    var enemy = instance_create_depth(spawn_x, spawn_y, -100, ene1);
    enemy.state = "chase";
}

// Set alarm cho lần spawn tiếp theo (ngẫu nhiên)
alarm[0] = room_speed * irandom_range(min_spawn_time, max_spawn_time);
