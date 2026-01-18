hspeed = 0
vspeed = 0
if(keyboard_check(ord("W"))){
	vspeed = -8	
	sprite_index = spr_player_up_walk
}
else if(keyboard_check_released(ord("W"))){
	vspeed = 0;
	sprite_index = spr_player_up_idle
}

if(keyboard_check(ord("S"))){
	vspeed = 8	
	sprite_index = spr_player_down_walk
}
else if(keyboard_check_released(ord("S"))){
	vspeed = 0;
	sprite_index = spr_player_down_idle
}


if(keyboard_check(ord("A"))){
	hspeed = -8
	sprite_index = spr_player_left_walk
}
else if(keyboard_check_released(ord("A"))){
	vspeed = 0;
	sprite_index = spr_player_left_idle
}

if(keyboard_check(ord("D"))){
	hspeed = 8
	sprite_index = spr_player_right_walk
}
else if(keyboard_check_released(ord("D"))){
	vspeed = 0;
	sprite_index = spr_player_right_idle
}
if(keyboard_check_pressed(ord("H"))){
	global.hp -= 1;
	global.image_health_index = global.max_hp - global.hp;
}

if(keyboard_check_pressed(ord("J"))){
	global.point += 1
}

if (global.hp <= 0) {
	global.win = 0
    room_goto(rm_end);
}

if (global.point >= 9) {
	global.win = 1
    room_goto(rm_end);
}

#region xử lý va chạm
	if place_meeting(x+hspeed,y,tile_wall){
		while(not place_meeting(x+sign(hspeed),y,tile_wall)){
			x = x + sign(hspeed)
		}
		hspeed = 0	

	}
	if place_meeting(x,y+vspeed,tile_wall){	
		while(not place_meeting(x,y+sign(vspeed),tile_wall)){
			y = y + sign(vspeed)
		}
		vspeed = 0
	}
#endregion