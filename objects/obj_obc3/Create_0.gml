// Thiết lập ban đầu
sprite_index = Musgroom1_2;  // Sprite ban đầu (đứng yên)
image_speed = 0.5;
image_xscale = 3;
image_yscale = 3;

// Biến trạng thái
state = "idle";           // idle, alert, chase
detection_range = 150;    // Phạm vi phát hiện (150 pixels)
chase_speed = 5;          // Tốc độ rượt đuổi

// Biến sprite
spr_idle = Mushroom1_Idle_with_shadow;
spr_left = spr_mushroom1_left_run;
spr_right = spr_mushroom1_right_run;
spr_autumn = Musgroom1_2;

player = obj_player2