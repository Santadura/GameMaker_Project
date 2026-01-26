if (global.win) {
	if global.sound == 1{
		audio_stop_all()
		audio_play_sound(snd_gamewin,1,false)
	}
	sprite_index = spr_win_word
}
else {
	if global.sound == 1{
		audio_stop_all()
		audio_play_sound(snd_gamelose,1,false)
	}
	sprite_index = spr_lose_word
}

if (!file_exists("record.ini")) {
    ini_open("record.ini");
    ini_write_real("record", "best_time", 999999);
    ini_write_real("record", "best_correct", 0);
    ini_close();
}

ini_open("record.ini");

var best_time = ini_read_real("record", "best_time", 999999);
var best_correct = ini_read_real("record", "best_point", 0);

// cập nhật

if (global.point > best_correct) {
    ini_write_real("record", "best_time", global.time);
    ini_write_real("record", "best_point", global.point);
}
if (global.point == best_correct && global.time < best_time) {
    ini_write_real("record", "best_time", global.time);
    ini_write_real("record", "best_point", global.point);
}

ini_close();
