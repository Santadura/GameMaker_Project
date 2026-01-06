hspeed = 0
vspeed = 0
if(keyboard_check(ord("W"))){
	vspeed = -5	
}
if(keyboard_check(ord("S"))){
	vspeed = 5	
}
if(keyboard_check(ord("A"))){
	hspeed = -5	
}
if(keyboard_check(ord("D"))){
	hspeed = 5	
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