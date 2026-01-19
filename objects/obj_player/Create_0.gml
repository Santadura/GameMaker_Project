tile_wall = layer_tilemap_get_id("Tile_wall")

alarm[0] = 60

global.level = 1

player_speed = 5

global.hp_lost = 1

global.correcting = 0

global.max_hp = 6;
global.hp = 6;

global.sprite_health_index = spr_health;
global.image_health_index = global.max_hp - global.hp;
image_speed = 0;


if (!instance_exists(obj_health)) {
    instance_create_layer(78, 50, "Instances", obj_health);
}


spr_player_down_idle  = spr_player11_down_idle;
spr_player_up_idle    = spr_player11_up_idle;
spr_player_left_idle  = spr_player11_left_idle;
spr_player_right_idle = spr_player11_right_idle;
spr_player_down_attack  = spr_player11_down_attack;
spr_player_up_attack    = spr_player11_up_attack;
spr_player_left_attack  = spr_player11_left_attack;
spr_player_right_attack = spr_player11_right_attack;
spr_player_down_walk  = spr_player11_down_walk;
spr_player_up_walk    = spr_player11_up_walk;
spr_player_left_walk  = spr_player11_left_walk;
spr_player_right_walk = spr_player11_right_walk;
