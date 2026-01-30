// Thiết lập ban đầu
sprite_index = spr_autumn_bush1;  // Sprite ban đầu (đứng yên)
image_speed = 0.5;

// Biến trạng thái
state = "idle";           // idle, alert, chase
detection_range = 130;    // Phạm vi phát hiện (150 pixels)
chase_speed = 7;          // Tốc độ rượt đuổi

// Biến sprite
spr_idle = spr_flower_idle;
spr_left = spr_flower_left_run;
spr_right = spr_flower_right_run;
spr_autumn = spr_autumn_bush1;

player = obj_player3_3