// Sprite và animation
sprite_index = spr_enemy32_right_run;
image_speed = 0.5;
image_xscale = 3; 
image_yscale = 3;

// Biến trạng thái
state = "chase";  // chase, attack
chase_speed = 2.5;
attack_range = 80;  // Phạm vi bắt đầu tấn công (pixels)
attack_hit_range = 60;  // Phạm vi đánh trúng player

// Biến sprite
spr_left_run = spr_enemy32_left_run;
spr_right_run = spr_enemy32_right_run;
spr_left_attack = spr_enemy32_left_attack;
spr_right_attack = spr_enemy32_right_attack;

// Biến attack
attack_cooldown = 0;
attack_duration = 30;  // 0.5 giây (30 frames)
attack_timer = 0;
facing_direction = "right";

// Biến combat
has_triggered_quiz = false;
