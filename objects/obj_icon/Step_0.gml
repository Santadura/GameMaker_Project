if (global.sound == 1) {
    if (global.bgm_id == -1 || !audio_is_playing(global.bgm_id)) {
        global.bgm_id = audio_play_sound(snd_main, 1, true);
    }
}
else {
        audio_stop_all()
}
