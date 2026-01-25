tile_wall = layer_tilemap_get_id("Tile_wall");

alarm[0] = 60

global.level = 3

player_speed = 10

global.hp_lost = 3

global.correcting = 0

if (!instance_exists(obj_health)) {
    instance_create_layer(78, 50, "Instances", obj_health);
}

spr_player_down_idle  = spr_player13_down_idle;
spr_player_up_idle    = spr_player13_up_idle;
spr_player_left_idle  = spr_player13_left_idle;
spr_player_right_idle = spr_player13_right_idle;

spr_player_down_attack  = spr_player13_down_attack;
spr_player_up_attack    = spr_player13_up_attack;
spr_player_left_attack  = spr_player13_left_attack;
spr_player_right_attack = spr_player13_right_attack;

spr_player_down_walk  = spr_player13_down_walk;
spr_player_up_walk    = spr_player13_up_walk;
spr_player_left_walk  = spr_player13_left_walk;
spr_player_right_walk = spr_player13_right_walk;
// Biến attack
is_attacking = false;
attack_timer = 0;
attack_duration = 20;  // Tổng thời gian attack (20 frames)
attack_hit_frame = 10;  // Hitbox kích hoạt ở frame 10 (GIỮA)
attack_hit_triggered = false;
last_direction = "down";

// Thiết lập hitbox
attack_range = 70;
attack_offset = 50;