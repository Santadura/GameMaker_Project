// Kiểm tra player có tồn tại không
if (!instance_exists(player)) {
    exit; 
}

var dist = distance_to_object(player);

if (state == "idle") {
    sprite_index = spr_autumn;
    speed = 0;
    image_xscale = 1;
    image_yscale = 1;
    if (dist < detection_range) {
        state = "alert";
        sprite_index = spr_idle;
        speed = 0;
        alarm[0] = room_speed * 1;
    }
}
else if (state == "alert") {
    sprite_index = spr_idle;
    speed = 0;
    image_xscale = 3;
    image_yscale = 3;
}
else if (state == "chase") {
    image_xscale = 3;
    image_yscale = 3;
    move_towards_point(player.x, player.y, chase_speed);
    if (player.x < x) {
        sprite_index = spr_left;
    }
    else {
        sprite_index = spr_right;
    }
}
