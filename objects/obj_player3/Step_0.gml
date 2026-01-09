hspeed = 0
vspeed = 0
if(keyboard_check(ord("W"))){
	vspeed = -8	
	sprite_index = spr_player31_up_walk
}
else if(keyboard_check_released(ord("W"))){
	vspeed = 0;
	sprite_index = spr_player31_up_idle
}

if(keyboard_check(ord("S"))){
	vspeed = 8	
	sprite_index = spr_player31_down_walk
}
else if(keyboard_check_released(ord("S"))){
	vspeed = 0;
	sprite_index = spr_player31_down_idle
}


if(keyboard_check(ord("A"))){
	hspeed = -8
	sprite_index = spr_player31_left_walk
}
else if(keyboard_check_released(ord("A"))){
	vspeed = 0;
	sprite_index = spr_player31_left_idle
}

if(keyboard_check(ord("D"))){
	hspeed = 8
	sprite_index = spr_player31_right_walk
}
else if(keyboard_check_released(ord("D"))){
	vspeed = 0;
	sprite_index = spr_player31_right_idle
}



#region xử lý va chạm
	//xử lý va chạm theo phương ngang
	if place_meeting(x+hspeed,y,tile_wall){
		hspeed = 0	

	}
	//xử lý va chạm theo phương dọc
	if place_meeting(x,y+vspeed,tile_wall){	
		vspeed = 0
	}
	
	
#endregion