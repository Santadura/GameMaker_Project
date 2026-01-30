// Thiết lập ban đầu
sprite_index = Burned_tree3;  // Sprite ban đầu (đứng yên)
image_speed = 0.5;

// Biến trạng thái
state = "idle";           // idle, alert, chase
detection_range = 130;    // Phạm vi phát hiện (150 pixels)
chase_speed = 7;          // Tốc độ rượt đuổi

// Biến sprite
spr_idle = Ent1_Idle_with_shadow;
spr_left = spr_tree1_left_run;
spr_right = spr_tree1_right_run;
spr_autumn = Burned_tree3;

player = obj_player1_3