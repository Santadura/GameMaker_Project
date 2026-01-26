
global.win = 1
global.point = 0
global.time = 0
global.correct = 0
global.incorrect = 0
if (!variable_global_exists("sound")) {
    global.sound = 1;
}

if (!variable_global_exists("bgm_id")) {
    global.bgm_id = -1;
}