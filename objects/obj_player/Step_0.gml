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



#region xử lý va chạm
	if place_meeting(x+hspeed,y,tile_wall){
		hspeed = 0	

	}
	if place_meeting(x,y+vspeed,tile_wall){	
		vspeed = 0
	}
#endregion