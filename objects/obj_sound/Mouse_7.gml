
if (obj_icon.sprite_index == spr_sound_icon) {
	global.sound = 0
	obj_icon.sprite_index = spr_nosound_icon
}
else{
	global.sound = 1
	obj_icon.sprite_index = spr_sound_icon
}

